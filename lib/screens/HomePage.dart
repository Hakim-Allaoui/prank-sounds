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
      body: Column(
        children: [
          const SizedBox(
            height: 100.0,
            child: Center(
              child: Text(
                "Sounds",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: (2 / 1),
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(10.0),
              children: Tools.allData.categories
                  .map(
                    (data) => GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        color: Tools.mColors[int.parse(Tools.allData.categories
                            .indexOf(data)
                            .toString()
                            .split('')
                            .last)],
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Stack(
                            fit: StackFit.loose,
                            children: [
                              Image.network(data.cover),
                              Text(data.title,
                                  style: const TextStyle(
                                      fontSize: 18, color: Colors.black),
                                  textAlign: TextAlign.center)
                            ],
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
    );
  }
}
