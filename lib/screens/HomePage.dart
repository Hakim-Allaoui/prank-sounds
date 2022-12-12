import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sounds/screens/category_page.dart';
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
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: SvgPicture.asset(
                "assets/bg.svg",
                fit: BoxFit.cover,
              ),
            ),
            Positioned.fill(
              child: Center(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 2.0,
                    sigmaY: 2.0,
                  ),
                  child: Container(
                    color: Colors.white.withOpacity(0.1),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                const SizedBox(
                  height: 80.0,
                  child: Center(
                    child: Text(
                      "Sounds",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: (2 / 2.5),
                    crossAxisSpacing: 30,
                    mainAxisSpacing: 30,
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.all(20.0),
                    children: Tools.allData.categories
                        .map(
                          (data) => ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (builder) =>
                                            CategoryPage(category: data)));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [
                                        Tools.mColors[int.parse(Tools
                                                .allData.categories
                                                .indexOf(data)
                                                .toString()
                                                .split('')
                                                .last)]
                                            .withOpacity(0.5),
                                        Tools.mColors[int.parse(Tools
                                            .allData.categories
                                            .indexOf(data)
                                            .toString()
                                            .split('')
                                            .last)],
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Stack(
                                    fit: StackFit.expand,
                                    children: [
                                      Center(
                                        child: FadeInImage(
                                          height: 80.0,
                                          image: NetworkImage(data.cover),
                                          fit: BoxFit.cover,
                                          placeholder: const AssetImage(
                                              'assets/loading.gif'),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: Tools.mColors[int.parse(Tools
                                                    .allData.categories
                                                    .indexOf(data)
                                                    .toString()
                                                    .split('')
                                                    .last)]
                                                .withOpacity(0.9),
                                          ),
                                          child: Text(data.title,
                                              style: const TextStyle(
                                                  fontSize: 16,
                                              ),
                                              textAlign: TextAlign.center),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
