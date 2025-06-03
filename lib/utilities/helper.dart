String getTimeDifference(String publishedAt) {
  final publishedDate = DateTime.parse(publishedAt);
  final difference = DateTime.now().difference(publishedDate);

  if (difference.inDays > 0) {
    return '${difference.inDays} day${difference.inDays > 1 ? 's' : ''} ago';
  } else {
    return '${difference.inHours} hour${difference.inHours > 1 ? 's' : ''} ago';
  }
}
