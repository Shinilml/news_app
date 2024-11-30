import 'package:flutter/material.dart';
import 'package:news_app/models/homescreenmodel.dart';

import 'package:http/http.dart' as http;

class NewsScreenController with ChangeNotifier {
  List<News> latestNewsList = [];
  List<News> categoryNewsList = [];

  bool isLoading = false;
  bool isCategoryLoading = false;

  Future<void> getData() async {
    isLoading = true;
    notifyListeners();

    final url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=26c0f3c1f9dd4a49a1d7b13195d00e67");

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        NewsScreenModel res = newsScreenModelFromJson(response.body);
        latestNewsList = res.articles ?? [];
      }
    } catch (e) {}

    isLoading = false;
    notifyListeners();
  }

  Future<void> getcatdata(String category) async {
    isCategoryLoading = true;
    notifyListeners();

    final url = Uri.parse(
        "https://newsapi.org/v2/everything?q=$category&apiKey=26c0f3c1f9dd4a49a1d7b13195d00e67");

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        NewsScreenModel newsScreenRes = newsScreenModelFromJson(response.body);
        categoryNewsList = newsScreenRes.articles ?? [];
      }
    } catch (e) {}

    isCategoryLoading = false;
    notifyListeners();
  }

  Future<List<News>> searchNews(String query) async {
    List<News> searchResults = [];
    final url = Uri.parse(
        "https://newsapi.org/v2/everything?q=$query&apiKey=26c0f3c1f9dd4a49a1d7b13195d00e67");

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        NewsScreenModel newsScreenRes = newsScreenModelFromJson(response.body);
        searchResults = newsScreenRes.articles ?? [];
      }
    } catch (e) {}

    return searchResults;
  }
}
