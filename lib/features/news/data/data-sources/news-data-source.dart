import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:recruitment/core/constants/constants.dart';

class NewsDataSource {
  Future<dynamic> getArticles() async {
    try {
      final uri = Uri.parse("$newsApiUrl/top-headlines?$newsQueryCountry&apiKey=$newsApiKey");
      final response = await http.get(uri);
      log(response.body);
    } on HttpException catch(e) {}
  }
}