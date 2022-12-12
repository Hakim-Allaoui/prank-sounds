import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sounds/data_model.dart';
import 'package:sounds/screens/Error_page.dart';
import 'package:sounds/screens/HomePage.dart';
import 'package:sounds/tools.dart';

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
            /*Tools.allData = DataModel.fromJson(jsonDecode('''{
            "ads": {
            "adNetwork": "admob",
            "ids": {
            "appId": "ca-app-pub-3940256099942544~3347511713",
            "banners": "ca-app-pub-5345037485983429/5704363995",
            "inters": "ca-app-pub-5345037485983429/9466433461",
            "rewards": "ca-app-pub-5345037485983429/4729397518",
            "natives": "ca-app-pub-5345037485983429/4729397518",
            "mRecs": "/6499/example/rewarded",
            "appOpen": "ca-app-pub-5320310844464753/6936276268"
            }
            },
            "config": {
            "currentAppVersion": "1.0.0",
            "forceUpdate": false,
            "title": "update_available",
            "body": "update_message",
            "updateLink": "https://play.google.com/store/apps/details?id=com.prosoft.fake_post_for_fb",
            "approved": true
            },
            "categories": [
            {
            "title": "Category 1",
            "cover": "https://files.voicy.network/cdn-cgi/image/height=100,quality=85,format=auto/public/Content/Clips/Images/4280ed3f-ecbf-4654-b967-32fee28da673-small.png",
            "audios": [
            {"title": "You look like a 'hhh'", "url": "https://github.com/Amegodev/amegodev.github.io/raw/master/api/Online%20Audio%20Player/You%20look%20like%20a%20uhhhh.mp3", "cover": "https://files.voicy.network/cdn-cgi/image/height=100,quality=85,format=auto/public/Content/Clips/Images/4280ed3f-ecbf-4654-b967-32fee28da673-small.png"},
            {"title": "Fuck This Shit I' Ou'", "url": "https://example.com", "cover": "https://files.voicy.network/cdn-cgi/image/height=100,quality=85,format=auto/public/Content/Clips/Images/d6696188-c3bd-4c1e-aa7f-495c06932d30-small.jpg"},
            {"title": "FBI OPEN UP! (Sound Effect'", "url": "https://example.com", "cover": "https://files.voicy.network/cdn-cgi/image/height=100,quality=85,format=auto/public/Content/Clips/Images/9261dbf0-f29c-4992-8545-23bfd80aceab-small.png"},
            {"title": "Omg they were roommates - Dank'mem'", "url": "https://example.com", "cover": "https://files.voicy.network/cdn-cgi/image/height=100,quality=85,format=auto/public/Content/Clips/Images/e5060505-3c01-4d50-a18e-be50fed513d2-small.jpeg"},
            {"title": "Ka'oom'", "url": "https://example.com", "cover": "https://files.voicy.network/cdn-cgi/image/height=100,quality=85,format=auto/public/Content/Clips/Images/51d40745-6e3b-411e-a762-acc1a5dbdfcc-small.jpeg"},
            {"title": "JonTron 'WTF'", "url": "https://example.com", "cover": "https://files.voicy.network/cdn-cgi/image/height=100,quality=85,format=auto/public/Content/Clips/Images/4498306b-506e-43ea-9ffd-f761d12cd729-small.png"},
            {"title": "Simba - TikTok Sound E'fec'", "url": "https://example.com", "cover": "https://files.voicy.network/public/Content/Custom/Logo_Wit.png"},
            {"title": "Run (meme 'ong'", "url": "https://example.com", "cover": "https://files.voicy.network/public/Content/Custom/Logo_Wit.png"},
            {"title": "My name is'Jef'", "url": "https://example.com", "cover": "https://files.voicy.network/public/Content/Custom/Logo_Wit.png"},
            {"title": "No God Pleas' No'", "url": "https://example.com", "cover": "https://files.voicy.network/public/Content/Custom/Logo_Wit.png"}
            ]
            },
            {"title": "Category 2", "cover": "https://files.voicy.network/cdn-cgi/image/height=100,quality=85,format=auto/public/Content/Clips/Images/d6696188-c3bd-4c1e-aa7f-495c06932d30-small.jpg", "audios": [{"title": "Title 1","url": "https://example.com", "cover": "https://files.voicy.network/public/Content/Custom/Logo_Wit.png"}, {"title": "Title 2","url": "https://example.com", "cover": "https://files.voicy.network/public/Content/Custom/Logo_Wit.png"}]},
            {"title": "Category 3", "cover": "https://files.voicy.network/cdn-cgi/image/height=100,quality=85,format=auto/public/Content/Clips/Images/9261dbf0-f29c-4992-8545-23bfd80aceab-small.png", "audios": [{"title": "Title 1","url": "https://example.com", "cover": "https://files.voicy.network/public/Content/Custom/Logo_Wit.png"}, {"title": "Title 2","url": "https://example.com", "cover": "https://files.voicy.network/public/Content/Custom/Logo_Wit.png"}]},
            {"title": "Category 4", "cover": "https://files.voicy.network/cdn-cgi/image/height=100,quality=85,format=auto/public/Content/Clips/Images/9261dbf0-f29c-4992-8545-23bfd80aceab-small.png", "audios": [{"title": "Title 1","url": "https://example.com", "cover": "https://files.voicy.network/public/Content/Custom/Logo_Wit.png"}, {"title": "Title 2","url": "https://example.com", "cover": "https://files.voicy.network/public/Content/Custom/Logo_Wit.png"}]},
            {"title": "Category 5", "cover": "https://files.voicy.network/cdn-cgi/image/height=100,quality=85,format=auto/public/Content/Clips/Images/9261dbf0-f29c-4992-8545-23bfd80aceab-small.png", "audios": [{"title": "Title 1","url": "https://example.com", "cover": "https://files.voicy.network/public/Content/Custom/Logo_Wit.png"}, {"title": "Title 2","url": "https://example.com", "cover": "https://files.voicy.network/public/Content/Custom/Logo_Wit.png"}]},
            {"title": "Category 6", "cover": "https://files.voicy.network/cdn-cgi/image/height=100,quality=85,format=auto/public/Content/Clips/Images/9261dbf0-f29c-4992-8545-23bfd80aceab-small.png", "audios": [{"title": "Title 1","url": "https://example.com", "cover": "https://files.voicy.network/public/Content/Custom/Logo_Wit.png"}, {"title": "Title 2","url": "https://example.com", "cover": "https://files.voicy.network/public/Content/Custom/Logo_Wit.png"}]},
            {"title": "Category 7", "cover": "https://files.voicy.network/cdn-cgi/image/height=100,quality=85,format=auto/public/Content/Clips/Images/9261dbf0-f29c-4992-8545-23bfd80aceab-small.png", "audios": [{"title": "Title 1","url": "https://example.com", "cover": "https://files.voicy.network/public/Content/Custom/Logo_Wit.png"}, {"title": "Title 2","url": "https://example.com", "cover": "https://files.voicy.network/public/Content/Custom/Logo_Wit.png"}]},
            {"title": "Category 8", "cover": "https://files.voicy.network/cdn-cgi/image/height=100,quality=85,format=auto/public/Content/Clips/Images/9261dbf0-f29c-4992-8545-23bfd80aceab-small.png", "audios": [{"title": "Title 1","url": "https://example.com", "cover": "https://files.voicy.network/public/Content/Custom/Logo_Wit.png"}, {"title": "Title 2","url": "https://example.com", "cover": "https://files.voicy.network/public/Content/Custom/Logo_Wit.png"}]},
            {"title": "Category 9", "cover": "https://files.voicy.network/cdn-cgi/image/height=100,quality=85,format=auto/public/Content/Clips/Images/9261dbf0-f29c-4992-8545-23bfd80aceab-small.png", "audios": [{"title": "Title 1","url": "https://example.com", "cover": "https://files.voicy.network/public/Content/Custom/Logo_Wit.png"}, {"title": "Title 2","url": "https://example.com", "cover": "https://files.voicy.network/public/Content/Custom/Logo_Wit.png"}]},
            {"title": "Category 10", "cover": "https://files.voicy.network/cdn-cgi/image/height=100,quality=85,format=auto/public/Content/Clips/Images/9261dbf0-f29c-4992-8545-23bfd80aceab-small.png", "audios": [{"title": "Title 1","url": "https://example.com", "cover": "https://files.voicy.network/public/Content/Custom/Logo_Wit.png"}, {"title": "Title 2","url": "https://example.com", "cover": "https://files.voicy.network/public/Content/Custom/Logo_Wit.png"}]},
            {"title": "Category 11", "cover": "https://files.voicy.network/cdn-cgi/image/height=100,quality=85,format=auto/public/Content/Clips/Images/9261dbf0-f29c-4992-8545-23bfd80aceab-small.png", "audios": [{"title": "Title 1","url": "https://example.com", "cover": "https://files.voicy.network/public/Content/Custom/Logo_Wit.png"}, {"title": "Title 2","url": "https://example.com", "cover": "https://files.voicy.network/public/Content/Custom/Logo_Wit.png"}]},
            {"title": "Category 12", "cover": "https://files.voicy.network/cdn-cgi/image/height=100,quality=85,format=auto/public/Content/Clips/Images/9261dbf0-f29c-4992-8545-23bfd80aceab-small.png", "audios": [{"title": "Title 1","url": "https://example.com", "cover": "https://files.voicy.network/public/Content/Custom/Logo_Wit.png"}, {"title": "Title 2","url": "https://example.com", "cover": "https://files.voicy.network/public/Content/Custom/Logo_Wit.png"}]},
            {"title": "Category 13", "cover": "https://files.voicy.network/cdn-cgi/image/height=100,quality=85,format=auto/public/Content/Clips/Images/9261dbf0-f29c-4992-8545-23bfd80aceab-small.png", "audios": [{"title": "Title 1","url": "https://example.com", "cover": "https://files.voicy.network/public/Content/Custom/Logo_Wit.png"}, {"title": "Title 2","url": "https://example.com", "cover": "https://files.voicy.network/public/Content/Custom/Logo_Wit.png"}]},
            {"title": "Category 14", "cover": "https://files.voicy.network/cdn-cgi/image/height=100,quality=85,format=auto/public/Content/Clips/Images/9261dbf0-f29c-4992-8545-23bfd80aceab-small.png", "audios": [{"title": "Title 1","url": "https://example.com", "cover": "https://files.voicy.network/public/Content/Custom/Logo_Wit.png"}, {"title": "Title 2","url": "https://example.com", "cover": "https://files.voicy.network/public/Content/Custom/Logo_Wit.png"}]},
            {"title": "Category 15", "cover": "https://files.voicy.network/cdn-cgi/image/height=100,quality=85,format=auto/public/Content/Clips/Images/9261dbf0-f29c-4992-8545-23bfd80aceab-small.png", "audios": [{"title": "Title 1","url": "https://example.com", "cover": "https://files.voicy.network/public/Content/Custom/Logo_Wit.png"}, {"title": "Title 2","url": "https://example.com", "cover": "https://files.voicy.network/public/Content/Custom/Logo_Wit.png"}]},
            {"title": "Category 16", "cover": "https://files.voicy.network/cdn-cgi/image/height=100,quality=85,format=auto/public/Content/Clips/Images/9261dbf0-f29c-4992-8545-23bfd80aceab-small.png", "audios": [{"title": "Title 1","url": "https://example.com", "cover": "https://files.voicy.network/public/Content/Custom/Logo_Wit.png"}, {"title": "Title 2","url": "https://example.com", "cover": "https://files.voicy.network/public/Content/Custom/Logo_Wit.png"}]},
            {"title": "Category 17", "cover": "https://files.voicy.network/cdn-cgi/image/height=100,quality=85,format=auto/public/Content/Clips/Images/9261dbf0-f29c-4992-8545-23bfd80aceab-small.png", "audios": [{"title": "Title 1","url": "https://example.com", "cover": "https://files.voicy.network/public/Content/Custom/Logo_Wit.png"}, {"title": "Title 2","url": "https://example.com", "cover": "https://files.voicy.network/public/Content/Custom/Logo_Wit.png"}]},
            {"title": "Category 18", "cover": "https://files.voicy.network/cdn-cgi/image/height=100,quality=85,format=auto/public/Content/Clips/Images/9261dbf0-f29c-4992-8545-23bfd80aceab-small.png", "audios": [{"title": "Title 1","url": "https://example.com", "cover": "https://files.voicy.network/public/Content/Custom/Logo_Wit.png"}, {"title": "Title 2","url": "https://example.com", "cover": "https://files.voicy.network/public/Content/Custom/Logo_Wit.png"}]},
            {"title": "Category 19", "cover": "https://files.voicy.network/cdn-cgi/image/height=100,quality=85,format=auto/public/Content/Clips/Images/9261dbf0-f29c-4992-8545-23bfd80aceab-small.png", "audios": [{"title": "Title 1","url": "https://example.com", "cover": "https://files.voicy.network/public/Content/Custom/Logo_Wit.png"}, {"title": "Title 2","url": "https://example.com", "cover": "https://files.voicy.network/public/Content/Custom/Logo_Wit.png"}]},
                {"title": "Category 20", "cover": "https://files.voicy.network/cdn-cgi/image/height=100,quality=85,format=auto/public/Content/Clips/Images/9261dbf0-f29c-4992-8545-23bfd80aceab-small.png", "audios": [{"title": "Title 1","url": "https://example.com", "cover": "https://files.voicy.network/public/Content/Custom/Logo_Wit.png"}, {"title": "Title 2","url": "https://example.com", "cover": "https://files.voicy.network/public/Content/Custom/Logo_Wit.png"}]}
                ]
            }'''));*/

            /*Future.delayed(const Duration(seconds: 2), () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (builder) {
                    return const HomePage();
                  }));
            });*/

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
                              color: Colors.white, fontSize: 40.0))),
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
