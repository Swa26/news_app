import 'package:flutter/cupertino.dart';

import '../models/news_article.dart';
import '../services/news_services.dart';

class NewsState extends ChangeNotifier {
  NewsService _newsService = NewsService();
  List<MyModelForAPI> _newsArticles = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<MyModelForAPI> get newsArticles => _newsArticles;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  // Public setter for testing
  set newsService(NewsService service) {
    _newsService = service;
  }

  Future<void> fetchNewsArticles() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final newsArticles = await _newsService.fetchNews();
      _newsArticles = newsArticles;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
