import 'package:flutter/material.dart';
import 'package:test_flutter/core/extensions/datetime.dart';
import 'package:test_flutter/data/models/article.dart';

class LatestNewsCard extends StatelessWidget {
  const LatestNewsCard({Key? key, required this.article, required this.color})
      : super(key: key);
  final Article article;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        constraints:
            const BoxConstraints(maxWidth: 370), // Максимальная ширина карточки
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(3, 3),
            ),
          ],
        ),
        height: 103,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  article.imageUrl,
                  width: 90,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      article.title,
                      style: TextStyle(color: color, fontSize: 16),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      article.publicationDate.getTimeAgo(),
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
