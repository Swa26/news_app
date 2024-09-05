import 'dart:convert';
import 'package:news_app/services/news_services.dart';
import '../store/shared_pref_cached_data.dart';
import 'news_article.dart';

class RepositoryForSharedPrefWay {
  final NewsService newsService;
  final MySharedPreferences mySharedPreferences;

  RepositoryForSharedPrefWay({
    required this.newsService,
    required this.mySharedPreferences,
  });

  // Function to get data from the cache if available, or from the API if not
  Future<List<MyModelForAPI>> getData() async {
    try {
      final String? jsonData = await mySharedPreferences.getDataIfNotExpired();
      if (jsonData != null) {
        return List<MyModelForAPI>.from(
          (jsonDecode(jsonData) as List).map(
                (post) => MyModelForAPI.fromMap(post),
          ),
        );
      } else {
        await newsService.fetchNews();
        return getData();
      }
    } catch (error) {
      throw Exception(error);
    }
  }

  // Function to refresh data from the API and update the cache
  Future<List<MyModelForAPI>> refreshData() async {
    await newsService.fetchNews();
    return getData();
  }
}