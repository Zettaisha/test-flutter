import 'package:flutter/material.dart';
import 'package:test_flutter/injection_container.dart';
import 'package:test_flutter/presentation/pages/home_page.dart';

void main() async {
  await initializeDependencies();
  runApp(const InternLevVotintsev());
}

class InternLevVotintsev extends StatelessWidget {
  const InternLevVotintsev({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
