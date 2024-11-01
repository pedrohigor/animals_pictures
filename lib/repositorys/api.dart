import 'dart:convert';
import 'dart:io';

import 'package:bloc_2/models/app_picture.dart';
import 'package:http/http.dart' as http;

class Api {
  String apiBase = "https://api.thecatapi.com/v1/images/search";

  Future<List<dynamic>> randomConsult(int limit) async {
    var response = await http.get(Uri.parse("$apiBase?limit=$limit"));
    print("${response.body}");
    return jsonDecode(response.body);
  }

  listGenerate(List<dynamic> value) {
    List<AppPicture> list = [];
    for (var i = 0; i < value.length; i++) {
      list.add(AppPicture.fromJson(value[i]));
    }
  }
}
