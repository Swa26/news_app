import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/news_article.dart';
import '../utils/constants.dart';

class NewsService {
  final Dio _dio = Dio();
  final String cacheKey = 'cached_news_data';
  final Duration cacheDuration = const Duration(days: 10);

  // Fetch news articles using Dio and cache them using SharedPreferences
  Future<List<MyModelForAPI>> fetchNews() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      // Retrieve cached data if it exists and hasn't expired
      final String? cachedData = prefs.getString(cacheKey);
      final int? cacheTime = prefs.getInt('${cacheKey}_timestamp');
      final bool isCacheValid = cacheTime != null && DateTime.now().millisecondsSinceEpoch - cacheTime < cacheDuration.inMilliseconds;

      if (cachedData != null && isCacheValid) {
        // Use cached data if available and valid
        return _parseJsonToModelList(cachedData);
      } else {
        // Fetch data from the API
        final response = await _dio.get(FULL_API_URL);

        if (response.statusCode == 200) {
          // Save the data and timestamp in SharedPreferences
          await prefs.setString(cacheKey, json.encode(response.data));
          await prefs.setInt('${cacheKey}_timestamp', DateTime.now().millisecondsSinceEpoch);

          return _parseJsonToModelList(json.encode(response.data));
        } else {
          throw Exception("Failed to fetch news: ${response.statusMessage}");
        }
      }
    } catch (e) {
      // Handle any errors during the API call or caching
      throw Exception("Error occurred during API call or cache handling: $e");
    }
  }

  // Helper function to parse the JSON data into a list of MyModelForAPI objects
  List<MyModelForAPI> _parseJsonToModelList(String jsonData) {
    final Map<String, dynamic> jsonResponse = json.decode(jsonData);
    final List<dynamic> articlesJson = jsonResponse['articles'];
    return articlesJson.map<MyModelForAPI>((json) =>
        MyModelForAPI.fromMap(json as Map<String, dynamic>)).toList();
  }}