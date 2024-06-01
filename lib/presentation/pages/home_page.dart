import 'package:flutter/material.dart';
import 'package:test_flutter/data/data_sources/local/mock_featured_articles.dart';
import 'package:test_flutter/presentation/widgets/featured_news_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 80, left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment
              .start, // Выравнивание дочерних элементов по левому краю
          children: [
            // header
            const Stack(
              children: [
                Positioned(
                  left: 0,
                  child: Icon(Icons.arrow_back_ios, color: Colors.black),
                ),
                Center(
                  child: Text(
                    'Notifications',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
                Positioned(
                  right: 0,
                  child: Text(
                    'Mark all read',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
              ],
            ),
            // featured news region
            const SizedBox(height: 40),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Featured',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 270,
                  width: 380,
                  child: ListView.builder(
                    shrinkWrap: false,
                    scrollDirection: Axis.horizontal,
                    itemCount: mockFeaturedArticles.length,
                    itemBuilder: (context, index) {
                      var featuredArticle = mockFeaturedArticles[index];
                      return Padding(
                        padding: const EdgeInsets.only(right: 30.0),
                        child: FeaturedNewsCard(article: featuredArticle),
                      );
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
