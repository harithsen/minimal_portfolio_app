import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/shots.dart';

class DribbbleApi {
  // static late DribbbleApi _instance;

  // DribbbleApi._();

  // static DribbbleApi get instance {
  //   // if (_instance == null) {
  //   //   _instance = DribbbleApi._();
  //   // }
  //   return _instance;
  // }

  Future<List<Shots>> fetchData() async {
    String url =
        'https://api.dribbble.com/v2/user/shots?access_token=e89489ed2c0310695cb09f5ca146605df0b51a1c7a4426282d9897418a0f4bcf';
    http.Response response = await http.get(Uri.parse(url));
    final values = jsonDecode(response.body);

    final List result = values;
    return result.map((e) => Shots.fromJson(e)).toList();
  }
}
