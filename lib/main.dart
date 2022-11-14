import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sounds/data_model.dart';
import 'package:sounds/screens/Error_page.dart';
import 'package:sounds/screens/HomePage.dart';
import 'package:sounds/theme.dart';
import 'package:sounds/tools.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prank Sounds',
      debugShowCheckedModeBanner: false,
      theme: S.darkTheme,
      themeMode: ThemeMode.dark,
      home: const SplashPage(),
    );
  }
}

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: const []);

    String state = "loading...";

    return Scaffold(
      backgroundColor: const Color.fromRGBO(45, 45, 45, 1),
      body: FutureBuilder(
          future: Tools.getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data != null) {
                print("Snapshot: ${snapshot.data}");
                Tools.allData = DataModel.fromJson(snapshot.data);

                //setState(() {
                //  state = "ready";
                //});

                Future.delayed(const Duration(seconds: 2), () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (builder) {
                    return const HomePage();
                  }));
                });
              } else {

                //setState(() {
                //  state = "error";
                //});

                Future.delayed(const Duration(seconds: 2), () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (builder) {
                    return const ErrorPage();
                  }));
                });
              }
            }

            return SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedContainer(
                      duration: const Duration(milliseconds: 5000),
                      child: Text(state,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20.0))),
                  const SizedBox(
                    height: 50.0,
                  ),
                  const SizedBox(
                    width: 100.0,
                    child: LinearProgressIndicator(
                        color: Colors.white,
                        backgroundColor: Color.fromRGBO(45, 45, 45, 1)),
                  )
                ],
              ),
            );
          }),
    );
  }
}
