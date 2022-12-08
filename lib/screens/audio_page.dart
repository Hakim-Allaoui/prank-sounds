import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sounds/data_model.dart';
import 'package:assets_audio_player/assets_audio_player.dart' as AudioPlayer;

class AudioPage extends StatefulWidget {
  final Audio audio;

  const AudioPage({Key? key, required this.audio}) : super(key: key);

  @override
  State<AudioPage> createState() => _AudioPageState();
}

class _AudioPageState extends State<AudioPage> {
  final assetsAudioPlayer = AudioPlayer.AssetsAudioPlayer();

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
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(
                  height: 100.0,
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
                  child: Column(
                    children: [
                      Center(
                        child: Text("Play audio ${widget.audio.title}"),
                      ),
                      IconButton(
                        onPressed: () async {
                          try {
                            await assetsAudioPlayer.open(
                              AudioPlayer.Audio.network(widget.audio.url),
                            );
                          } catch (t) {
                            //mp3 unreachable
                          }
                        },
                        icon: Icon(Icons.play_circle),
                      ),
                      Center(
                        child: Text("Play audio ${widget.audio.url}"),
                      ),
                    ],
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
