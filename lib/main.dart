import 'package:flutter/material.dart';

void main() {
  runApp(const InternLevVotintsev());
}

class InternLevVotintsev extends StatelessWidget {
  const InternLevVotintsev({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('News screen'),
        ),
      ),
    );
  }
}
