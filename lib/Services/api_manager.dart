import 'dart:convert';

import 'package:Rest_API/Constant/strings.dart';
import 'package:Rest_API/models/newsinfo.dart';
import 'package:http/http.dart' as http;

class API_Manager {
  Future<Welcome> getNews() async {
    var Client = http.Client();
    var newsWelcom = null;

    try {
      var response = await Client.get(Strings.news_url);
      if (response.statusCode == 200) {
        var jsonString = response.body;

        var jsonMap = jsonDecode(jsonString);
        newsWelcom = Welcome.fromJson(jsonMap);
      }
    } catch (Exception) {
      return newsWelcom;
    }
    return newsWelcom;
  }
}
