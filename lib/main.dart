import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter/domain/repository/abstract_news_repository.dart';
import 'package:test_flutter/injection_container.dart';
import 'package:test_flutter/presentation/bloc/news_bloc.dart';
import 'package:test_flutter/presentation/bloc/news_events.dart';
import 'package:test_flutter/presentation/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const InternLevVotintsev());
}

class InternLevVotintsev extends StatelessWidget {
  const InternLevVotintsev({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<NewsRepository>(
          create: (context) => sl<NewsRepository>(),
        ),
      ],
      child: MaterialApp(
        home: BlocProvider(
          create: (context) => sl<ArticlesBloc>()..add(FetchArticles()),
          child: const HomePage(),
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
