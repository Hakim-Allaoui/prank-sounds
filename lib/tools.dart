import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sounds/data_model.dart';

class Tools {
  static late DataModel allData;

  static Future<dynamic> getData() async {
    var res = await http.get(
        Uri.parse(
            "https://raw.githubusercontent.com/Amegodev/amegodev.github.io/master/api/Online%20Audio%20Player/index.json"),
        headers: {"Accept": "application/json"});
    print("Data:\n${res.body}");
    if (res.statusCode == 200) {
      var data = json.decode(res.body);
      return data;
    } else {
      return null;
    }
  }

  static List<Color> mColors = [
    const Color(0xfff94144),
    const Color(0xfff3722c),
    const Color(0xfff8961e),
    const Color(0xfff9844a),
    const Color(0xfff9c74f),
    const Color(0xff90be6d),
    const Color(0xff43aa8b),
    const Color(0xff4d908e),
    const Color(0xff577590),
    const Color(0xff277da1)
  ];
}
