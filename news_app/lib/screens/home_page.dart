import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../store/news_store.dart';
import '../utils/constants.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<NewsState>(context, listen: false).fetchNewsArticles();
    });
  }

  @override
  Widget build(BuildContext context) {
    final newsState = Provider.of<NewsState>(context);
    final mediaQuery = MediaQuery.of(context);
    final isPortrait = mediaQuery.orientation == Orientation.portrait;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: newsState.isLoading
          ? const Center(child: CircularProgressIndicator())
          : newsState.errorMessage != null
              ? Center(child: Text(newsState.errorMessage!))
              : ListView.builder(
                  itemCount: newsState.newsArticles.length,
                  itemBuilder: (context, index) {
                    final article = newsState.newsArticles[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/articleDetail',
                          arguments: {
                            'title': article.title,
                            'content':
                                article.content ?? 'No content available',
                            'urlToImage': article.urlToImage ?? '',
                            'articleUrl': article.url,
                            'publishedAt':
                                article.publishedAt?.toIso8601String() ??
                                    'Unknown Date',
                          },
                        );
                      },
                      child: ArticleCard(
                          title: article.title,
                          description: article.description ?? '',
                          urlToImage: article.urlToImage ?? '',
                          isPortrait: isPortrait,
                          publishedAt: article.publishedAt!.toIso8601String()),
                    );
                  },
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<NewsState>(context, listen: false).fetchNewsArticles();
        },
        tooltip: 'Refresh',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
