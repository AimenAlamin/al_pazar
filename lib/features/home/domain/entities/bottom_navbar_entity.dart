import '../../../../core/helpers/app_images.dart';

class BottomNavigationBarEntity {
  final String activeImage, inActiveImage;
  final String name;

  BottomNavigationBarEntity(
      {required this.activeImage,
      required this.inActiveImage,
      required this.name});
}

List<BottomNavigationBarEntity> get bottomNavigationBarItems => [
      //creating a list of BottomNavigationBarEntity to access them as objects in the NavigationBar widget
      BottomNavigationBarEntity(
          activeImage: Assets.homeFilled,
          inActiveImage: Assets.homeOutlined,
          name: "Home"),
      BottomNavigationBarEntity(
          activeImage: Assets.favoritesFilled,
          inActiveImage: Assets.favoritesOutlined,
          name: "Favorites"),
      BottomNavigationBarEntity(
          activeImage: Assets.sell,
          inActiveImage: Assets.sell,
          name: "Post Ad"),
      BottomNavigationBarEntity(
          activeImage: Assets.chatFilled,
          inActiveImage: Assets.chatOutlined,
          name: "Chats"),
      BottomNavigationBarEntity(
          activeImage: Assets.accountFiled,
          inActiveImage: Assets.accountOutlined,
          name: "Account"),
    ];
