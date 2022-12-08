import 'package:flutter/material.dart';

class S {
  static Map<String, Color> hkColors = {
    "black": const Color(0XFF18191B),
    "white": const Color(0xffffffff),
    "dark": const Color(0xff222524),
    "light": const Color(0xffF1F2F6),
    "darkGrey": const Color(0xff373a39),
    "lightGrey": const Color(0xffB0B4B7),
    "blue": const Color(0xff2C88FF),
  };

  static MColor colors = MColor();

  static ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    // fontFamily: 'Poppins',
    scaffoldBackgroundColor: S.colors.scaffoldBackgroundLight,
    appBarTheme: AppBarTheme(backgroundColor: S.colors.white),
    textTheme: ThemeData.light().textTheme.copyWith(),
    dividerTheme: const DividerThemeData(indent: 10.0, endIndent: 10.0, color: Color(0xffB0B4B7)),
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    textTheme: ThemeData.dark().textTheme.copyWith().apply(
      fontFamily: "Bangers",
    ),
    scaffoldBackgroundColor: S.colors.scaffoldBackgroundDark,
    appBarTheme: AppBarTheme(backgroundColor: S.colors.dark),
    textButtonTheme: const TextButtonThemeData(),
    dividerTheme: const DividerThemeData(indent: 10.0, endIndent: 10.0),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
    ),
    dividerColor: S.colors.lightGrey,
  );
}

class MColor {
  final Color dark = const Color(0xff222524);
  final Color darker = const Color(0xff1C1F1E);
  final Color light = const Color(0xffe5e6ed);
  final Color black = const Color(0xff000000);
  final Color white = const Color(0xffffffff);
  final Color darkGrey = const Color(0xff373a39);
  final Color lightGrey = const Color(0xffB0B4B7);
  final Color blue = const Color(0xff2C88FF);
  final Color blueAccent = const Color(0xff216fdb);
  final Color button = const Color(0xff8ab4f8);
  final Color online = const Color(0xFF4BCB1F);
  final Color scaffoldBackgroundLight = const Color(0XFFC9CCD1);
  final Color scaffoldBackgroundDark = const Color(0XFF18191B);
}
