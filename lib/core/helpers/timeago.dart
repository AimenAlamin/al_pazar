class TimeAgoHelper {
  static String getTimeAgo(DateTime timestamp) {
    final Duration difference = DateTime.now().difference(timestamp);

    // if (difference.inSeconds < 60) {
    //   return '${difference.inSeconds} seconds ago';
    // } else if (difference.inMinutes < 60) {
    //   return '${difference.inMinutes} minutes ago';
    // } else if (difference.inHours < 24) {
    //   return '${difference.inHours} hours ago';
    // } else {
    //   return '${difference.inDays} days ago';
    // }
    if (difference.inSeconds < 60) {
      return 'just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} ${difference.inMinutes == 1 ? 'minute' : 'minutes'} ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} ${difference.inHours == 1 ? 'hour' : 'hours'} ago';
    } else {
      return '${difference.inDays} ${difference.inDays == 1 ? 'day' : 'days'} ago';
    }
  }
}
