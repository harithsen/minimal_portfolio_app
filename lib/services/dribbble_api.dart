import 'package:http/http.dart' as http;
import 'package:minimal_portfolio_webapp/services/access_token.dart';
import 'dart:convert';
import '../models/shots.dart';

//replace APIDetails().access_token with your access token from Dribbble

class DribbbleApi {
  Future<List<Shots>> fetchData() async {
    String url = 'https://api.dribbble.com/v2/user/shots?access_token=' +
        APIDetails().access_token;
    http.Response response = await http.get(Uri.parse(url));
    final values = jsonDecode(response.body);

    final List result = values;
    return result.map((e) => Shots.fromJson(e)).toList();
  }
}
