import 'package:flutter/material.dart';
import 'package:sounds/main.dart';

class ErrorPage extends StatefulWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  State<ErrorPage> createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: const Color.fromRGBO(45, 45, 45, 1),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100.0,
              ),
              const Icon(
                Icons.error,
                size: 150.0,
              ),
              MaterialButton(
                height: 40.0,
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (builder) {
                    return const SplashPage();
                  }));
                },
                child: const Text("Try again"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
