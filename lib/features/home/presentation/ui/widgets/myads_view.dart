import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:al_pazar/core/helpers/get_user.dart';

class MyAdsView extends StatelessWidget {
  const MyAdsView({super.key});

  @override
  Widget build(BuildContext context) {
    final String userId = getUserSavedData().uId; // Get the current user ID

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Ads"),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection(
                'posts') // Replace with your Firestore posts collection name
            .where('userId', isEqualTo: userId) // Match userId
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text("No Ads yet"));
          }

          // Retrieve posts from Firestore
          final List<DocumentSnapshot> posts = snapshot.data!.docs;

          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final post = posts[index].data() as Map<String, dynamic>;

              return ListTile(
                leading: post['imageUrl'] != null
                    ? Image.network(
                        post['imageUrl']
                            [0], // Assuming images are stored as a list
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      )
                    : const Icon(Icons.image_not_supported),
                title: Text(post['title'] ?? "No Title"),
                subtitle: Text("Price: ${post['price']} ${post['currency']}"),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    _deletePost(context, posts[index].id);
                  },
                ),
                onTap: () {
                  // Navigate to Post Details Screen
                },
              );
            },
          );
        },
      ),
    );
  }

  Future<void> _deletePost(BuildContext context, String postID) async {
    try {
      await FirebaseFirestore.instance
          .collection(
              'posts') // Replace with your Firestore posts collection name
          .doc(postID)
          .delete();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Post deleted successfully")),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error deleting post: $e")),
      );
    }
  }
}
