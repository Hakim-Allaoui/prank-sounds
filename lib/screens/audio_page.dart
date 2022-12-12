import 'dart:async';
import 'dart:ui';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sounds/data_model.dart';
import 'package:assets_audio_player/assets_audio_player.dart' as AudioPlayer;
import 'package:sounds/services/ads.dart';
import 'package:sounds/tools.dart';
import 'package:switcher/core/switcher_size.dart';
import 'package:switcher/switcher.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

class AudioPage extends StatefulWidget {
  final AudioModel audio;

  const AudioPage({Key? key, required this.audio}) : super(key: key);

  @override
  State<AudioPage> createState() => _AudioPageState();
}

class _AudioPageState extends State<AudioPage> {
  final assetsAudioPlayer = AudioPlayer.AssetsAudioPlayer();

  AdsHelper ads = AdsHelper();

  double volume = 50.0;

  String timerSelectedItem = "Instant";

  bool loop = false;

  var timerItems = [
    "Instant",
    "3s",
    "5s",
    "10s",
    "30s",
    "1 minutes",
    "5 minutes",
  ];

  String countDown = "";

  final CountdownController countdownController = CountdownController();

  List<int> timerValues = [
    0,
    3,
    5,
    10,
    30,
    60,
    300,
  ];

  @override
  void initState() {
    super.initState();

    assetsAudioPlayer.playlistAudioFinished.listen((Playing playing) {
      if (loop) playAudio();
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await assetsAudioPlayer.stop();
        await assetsAudioPlayer.dispose();

        return Future.value(true);
      },
      child: Scaffold(
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
                  SizedBox(
                    height: 100.0,
                    child: Row(
                      children: [
                        BackButton(
                          onPressed: () async {
                            await assetsAudioPlayer.stop();
                            await assetsAudioPlayer.dispose();

                            Navigator.of(context).pop();
                          },
                        ),
                        Expanded(
                          child: Text(
                            widget.audio.title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 30.0,
                            ),
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.favorite_border)),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    "TIMER: ",
                                    style: TextStyle(fontSize: 20.0),
                                  ),
                                  const SizedBox(
                                    width: 20.0,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.purple[300]!
                                            .withOpacity(0.6),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        border: Border.all(
                                          color: Colors.purple[300]!,
                                        )),
                                    child: DropdownButton(
                                      alignment: Alignment.center,
                                      icon: Icon(
                                        Icons.arrow_drop_down_sharp,
                                        color: Colors.purple[300],
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                      dropdownColor: Colors.purple[300],
                                      value: timerSelectedItem,
                                      underline: const SizedBox(),
                                      items: timerItems.map((String item) {
                                        return DropdownMenuItem(
                                          value: item,
                                          child: Text(item),
                                        );
                                      }).toList(),
                                      onChanged: (onChanged) {
                                        timerSelectedItem = onChanged!;
                                        setState(() {});
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text(
                                    "LOOP: ",
                                    style: TextStyle(fontSize: 20.0),
                                  ),
                                  const SizedBox(
                                    width: 20.0,
                                  ),
                                  Switcher(
                                    value: loop,
                                    size: SwitcherSize.large,
                                    switcherButtonRadius: 50,
                                    colorOff:
                                        Colors.purple[300]!.withOpacity(0.3),
                                    colorOn: Colors.purple[300]!,
                                    onChanged: (bool state) {
                                      loop = state;
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 50),
                        Countdown(
                          controller: countdownController,
                          seconds: timerValues[
                              timerItems.indexOf(timerSelectedItem)],
                          build: (BuildContext context, double time) {
                            return time == 0 ? const SizedBox() : Text(
                              "Countdown\n${time.toInt().toString()}",
                              style: const TextStyle(fontSize: 20.0),
                              textAlign: TextAlign.center,
                            );
                          },
                          onFinished: () {},
                        ),
                        Expanded(
                          child: Center(
                            child: GestureDetector(
                              onTap: playAudio,
                              child: FadeInImage(
                                height: 60.0,
                                image: NetworkImage(widget.audio.cover),
                                fit: BoxFit.cover,
                                placeholder:
                                    const AssetImage('assets/loading.gif'),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  if (volume > 20) {
                                    volume -= 20;
                                    assetsAudioPlayer.setVolume(0);
                                  }
                                  setState(() {});
                                },
                                icon: const FaIcon(FontAwesomeIcons.volumeLow),
                              ),
                              Expanded(
                                child: SliderTheme(
                                  data: SliderTheme.of(context).copyWith(
                                    trackHeight: 10.0,
                                    activeTrackColor: Colors.purple[300],
                                    activeTickMarkColor: Colors.purple[300],
                                    inactiveTickMarkColor: Colors.purple[100],
                                    inactiveTrackColor: Colors.white,
                                    thumbColor: Colors.black38,
                                  ),
                                  child: Slider(
                                    value: volume,
                                    min: 0,
                                    max: 100,
                                    divisions: 4,
                                    onChanged: (double value) {
                                      volume = value;
                                      assetsAudioPlayer.setVolume(value / 100);
                                      setState(() {});
                                    },
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  if (volume <= 80) {
                                    volume += 20;
                                    assetsAudioPlayer.setVolume(1);
                                  }
                                  setState(() {});
                                },
                                icon: const FaIcon(FontAwesomeIcons.volumeHigh),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  ads.getBannerAd(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  playAudio() async {
    final bool playing = assetsAudioPlayer.isPlaying.value;

    if (playing) {
      await assetsAudioPlayer.stop();
      countdownController.pause();
      return;
    }

    countdownController.start();

    try {
      Duration duration =
          Duration(seconds: timerValues[timerItems.indexOf(timerSelectedItem)]);

      Future.delayed(duration, () async {
        countdownController.restart();
        countdownController.pause();
        await assetsAudioPlayer.open(
          AudioPlayer.Audio.network(widget.audio.url),
        );
      });
    } catch (t) {
      //mp3 unreachable
    }
  }
}
