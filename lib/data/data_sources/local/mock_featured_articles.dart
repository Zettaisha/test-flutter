import 'package:test_flutter/data/models/article.dart';

final mockFeaturedArticles = [
  Article(
    id: '1108389a-b3db-11ec-b909-0242ac120002',
    title: 'We are processing your request...',
    publicationDate: DateTime.now().subtract(const Duration(days: 1)),
    imageUrl: 'https://i.ibb.co/Jk8FMMp/unsplash-Oqtaf-YT5k-Tw.jpg',
    description: '''Please excuse the interruption.  
Due to Google's efforts to maintain a “safe ads ecosystem” for its advertisers, publishers and users from fraud and bad experiences, Google has placed restrictions on our ad serving that limit our ability to provide free VPN services. 
Regrettably, this is beyond our control.  
To continue to enjoy ForestVPN without interruptions, please upgrade to our Premium version.''',
  ),
  Article(
    id: 'd3a7bf70-b3dc-11ec-b909-0242ac120002',
    title: 'The History of Lorem Ipsum...',
    publicationDate: DateTime.now().subtract(const Duration(days: 4)),
    imageUrl:
        'https://www.goldmansachs.com/intelligence/pages/multimedia/the-future-of-coding-is-conversation.jpg',
    description:
        '''The origins of Lorem Ipsum can be traced back to ancient Latin literature. This pseudo-Latin text is primarily derived from sections 1.10.32 and 1.10.33 of "De Finibus Bonorum et Malorum" (The Extremes of Good and Evil), written by Cicero in 45 BC. It is a treatise on the theory of ethics, and it was immensely popular during the Renaissance. 

The standard Lorem Ipsum passage has been used since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book. This text not only survived five centuries but also the transition into the digital age, remaining essentially unchanged. Its continued use is testament to its utility in demonstrating the visual form of a document without relying on meaningful content.

Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, is credited with discovering the source of Lorem Ipsum when he stumbled upon the word "consectetur" in a Lorem Ipsum passage and traced it back to Cicero's works. His discovery solidified the text's historical significance and contributed to its enduring presence in the publishing and typesetting industries.''',
  ),
];
