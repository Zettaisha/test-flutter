class Article {
  const Article({
    required this.id,
    required this.title,
    required this.publicationDate,
    required this.imageUrl,
    this.readed = false,
    this.description,
  });

  final String id;
  final String title;
  final DateTime publicationDate;
  final String imageUrl;
  final bool readed;
  final String? description;

  String getTimeAgo() {
    final now = DateTime.now();
    final difference = now.difference(publicationDate);
    final daysAgo = difference.inDays;

    if (daysAgo == 1) {
      return '1 day ago';
    } else {
      return '$daysAgo days ago';
    }
  }
}
