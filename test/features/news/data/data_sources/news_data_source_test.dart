import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:recruitment/core/constants/constants.dart';
import 'package:recruitment/features/news/data/data_sources/news_data_source.dart';
import 'package:recruitment/features/news/domain/entities/fetch_news_response.dart';

import 'news_data_source_test.mocks.dart';

// flutter pub run build_runner build --delete-conflicting-outputs       for generating mocks

@GenerateMocks([http.Client])
void main() {
  late MockClient mockHttpClient;
  late NewsDataSourceImpl dataSource;

  setUp(() {
    mockHttpClient = MockClient();
    dataSource = NewsDataSourceImpl(mockHttpClient);
  });

  group("Fetch News", () {
    test("Returns FetchNewsSuccess on 200", () async {
      String fakeResponse = '''{"status":"ok","totalResults":2,"articles":[{"source":{"id":null,"name":"[Removed]"},"author":null,"title":"[Removed]","description":"[Removed]","url":"https://removed.com","urlToImage":null,"publishedAt":"1970-01-01T00:00:00Z","content":"[Removed]"},{"source":{"id":null,"name":"The Athletic"},"author":"Mike Sando","title":"Bill Belichick is the NFL’s greatest coach … since Don Shula? A closer look at the GOAT debate - The Athletic","description":"Belichick has six Super Bowls and is approaching Shula's wins record, but there's still a great case for Shula as the NFL's gold standard.","url":"https://theathletic.com/5182515/2024/01/12/bill-belichick-don-shula-patriots-dolphins-colts/","urlToImage":"https://cdn.theathletic.com/app/uploads/2024/01/11211541/01-12-Shula-Belichick-2-1.jpg","publishedAt":"2024-01-12T14:20:53Z","content":"Bill Belichicks New England Patriots won three-fourths of their regular-season games during Tom Bradys 19-year tenure as starting quarterback, an incredible run of dominance. Winning seemed automatic… [+16572 chars]"}]}''';
      when(mockHttpClient
          .get(Uri.parse("$newsApiUrl/top-headlines?country=$newsQueryCountry&category=$newsQueryCategory&apiKey=$newsApiKey")))
          .thenAnswer((_) async =>
          http.Response(fakeResponse, 200, headers: {'content-type': 'application/json; charset=utf-8'}));
      expect(await dataSource.fetchNews(), isA<FetchNewsSuccess>());
    });

    test("Returns FetchNewsFailed on StatusCode not 200", () async {
      String fakeResponse = '''{"status":"error","code":"apiKeyMissing", "message":"Your API key is missing. Append this to the URL with the apiKey param, or use the x-api-key HTTP header."}''';
      when(mockHttpClient
          .get(Uri.parse("$newsApiUrl/top-headlines?country=$newsQueryCountry&category=$newsQueryCategory&apiKey=$newsApiKey")))
          .thenAnswer((_) async =>
          http.Response(fakeResponse, 401, headers: {'content-type': 'application/json; charset=utf-8'}));
      expect(await dataSource.fetchNews(), isA<FetchNewsFailed>());
    });

    test("Returns FetchNewsFailed on any Exception", () async {
      when(mockHttpClient
          .get(Uri.parse("$newsApiUrl/top-headlines?country=$newsQueryCountry&category=$newsQueryCategory&apiKey=$newsApiKey")))
          .thenThrow(TimeoutException("Conection timeout"));
      expect(await dataSource.fetchNews(), isA<FetchNewsFailed>());
    });
  });
}
