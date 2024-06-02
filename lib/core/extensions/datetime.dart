extension DaysAgo on DateTime {
  String getTimeAgo() {
    final now = DateTime.now();
    final difference = now.difference(this);
    final daysAgo = difference.inDays;

    if (daysAgo == 1) {
      return '1 day ago';
    } else {
      return '$daysAgo days ago';
    }
  }
}
