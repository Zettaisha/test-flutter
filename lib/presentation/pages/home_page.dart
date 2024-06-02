import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter/domain/repository/abstract_news_repository.dart';
import 'package:test_flutter/domain/usecases/get_featured_articles.dart';
import 'package:test_flutter/domain/usecases/get_latest_articles.dart';
import 'package:test_flutter/presentation/bloc/news_bloc.dart';
import 'package:test_flutter/presentation/bloc/news_events.dart';
import 'package:test_flutter/presentation/bloc/news_states.dart';
import 'package:test_flutter/presentation/widgets/featured_news_card.dart';
import 'package:test_flutter/presentation/widgets/latest_news_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 40, left: 10, right: 10),
        child: BlocProvider(
          create: (context) => ArticlesBloc(
            getLatestArticles:
                GetLatestArticles(context.read<NewsRepository>()),
            getFeaturedArticles:
                GetFeaturedArticles(context.read<NewsRepository>()),
          )..add(FetchArticles()),
          child: const HomePageContent(),
        ),
      ),
    );
  }
}

class HomePageContent extends StatelessWidget {
  const HomePageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
        const Text(
          'Featured',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 20),
        BlocBuilder<ArticlesBloc, ArticlesState>(
          builder: (context, state) {
            if (state is ArticlesLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ArticlesLoaded) {
              return SizedBox(
                height: 270,
                width: 380,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.featuredArticles.length,
                  itemBuilder: (context, index) {
                    var featuredArticle = state.featuredArticles[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 30.0),
                      child: FeaturedNewsCard(article: featuredArticle),
                    );
                  },
                ),
              );
            } else if (state is ArticlesError) {
              return Text('Error: ${state.message}');
            }
            return Container();
          },
        ),
        // latest news region
        const SizedBox(height: 20),
        const Text(
          'Latest news',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        Expanded(
          child: BlocBuilder<ArticlesBloc, ArticlesState>(
            builder: (context, state) {
              if (state is ArticlesLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ArticlesLoaded) {
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: state.latestArticles.length,
                  itemBuilder: (context, index) {
                    var latestArticle = state.latestArticles[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: LatestNewsCard(article: latestArticle),
                    );
                  },
                );
              } else if (state is ArticlesError) {
                return Text('Error: ${state.message}');
              }
              return Container();
            },
          ),
        ),
      ],
    );
  }
}
