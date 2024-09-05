import 'package:flutter/material.dart';
import 'package:news_app/screens/home_page.dart';
import 'package:provider/provider.dart';
import 'store/news_store.dart';
import 'screens/article_detail_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => NewsState(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'NewsApp'),
      onGenerateRoute: (settings) {
        if (settings.name == '/articleDetail') {
          final args = settings.arguments as Map<String, dynamic>;
          final title = args['title'] as String;
          final content = args['content'] as String;
          final urlToImage = args['urlToImage'] as String;
          final publishedAt = args['publishedAt'] as String?;
          return MaterialPageRoute(
            builder: (context) => ArticleDetailScreen(
              title: title,
              content: content,
              urlToImage: urlToImage,
              publishedAt: publishedAt,
            ),
          );
        }
        return null;
      },
    );
  }
}
