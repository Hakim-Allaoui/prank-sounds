import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:sounds/data_model.dart';

class Tools {
  static late DataModel allData;

  static Future<dynamic> getData() async {
    var res = await http.get(
        Uri.parse(
            "https://raw.githubusercontent.com/Hakim-Allaoui/prank-sounds/425f0991bfd6feea2ece6705c7f3b19e70586a81/lib/data.json?token=GHSAT0AAAAAAB3S6YYTGADRZLUKK5BABAF4Y4V2XWQ"),
        headers: {"Accept": "application/json"});
    print("Data:\n${res.body}");
    if (res.statusCode == 200) {
      var data = json.decode(res.body);
      return data;
    } else {
      return null;
    }
  }

  static waitingDialog(
      {required BuildContext context, required VoidCallback process}) async {
    return await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          process();

          return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            backgroundColor: Colors.white,
            content: WillPopScope(
              onWillPop: () => Future.value(false),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text("loading"),
                  SizedBox(
                    height: 40.0,
                  ),
                  SizedBox(
                    height: 40.0,
                    width: 40.0,
                    child: CircularProgressIndicator(
                      color: Colors.purple,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  static var logger = Logger(
    printer: PrettyPrinter(methodCount: 2, colors: true, printEmojis: true),
  );


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
