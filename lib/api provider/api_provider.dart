import 'dart:convert';

import 'package:http/http.dart';

import '../model/news_model.dart';

class ApiProvider {
  var client = Client();
  String baseUrl =
      "https://newsapi.org/v2/everything?q=tesla&from=2024-08-31&sortBy=publishedAt&apiKey=d9bd9d9264bf4e929c02f218a57b9683";
  Future<NewsModel> getNewsData() async {
    try {
      print("api provider GetNews request=====$baseUrl");
      final response = await client.get(Uri.parse(baseUrl));

      var responseJson = json.decode(response.body);
      print("api provider GetNews response=====${response.body}");
      if (response.statusCode == 200) {
        return NewsModel.fromJson(responseJson);
      } else {
        return NewsModel();
      }
    } catch (e) {
      print("exception=================$e");
      return NewsModel();
    }
  }
}
