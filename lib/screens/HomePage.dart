import 'package:flutter/material.dart';
import 'package:sounds/tools.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: Tools.allData.categories.length,
        itemBuilder: (ctx, index) {
          return SizedBox();
        },
      ),
    );
  }
}
