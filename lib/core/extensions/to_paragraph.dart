extension SplitToParagraphs on String {
  String splitIntoParagraphs() {
    List<String> sentences = split('. ');
    List<String> paragraphs = [];

    for (int i = 0; i < sentences.length; i++) {
      paragraphs.add('${sentences[i]}.');

      if (i != sentences.length - 1) {
        paragraphs.add('\n');
      }
    }

    return paragraphs.join();
  }
}
