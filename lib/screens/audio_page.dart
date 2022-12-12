import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sounds/data_model.dart';
import 'package:assets_audio_player/assets_audio_player.dart' as AudioPlayer;
import 'package:switcher/core/switcher_size.dart';
import 'package:switcher/switcher.dart';

class AudioPage extends StatefulWidget {
  final Audio audio;

  const AudioPage({Key? key, required this.audio}) : super(key: key);

  @override
  State<AudioPage> createState() => _AudioPageState();
}

class _AudioPageState extends State<AudioPage> {
  final assetsAudioPlayer = AudioPlayer.AssetsAudioPlayer();

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

  String counting = "";

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
                        SizedBox(height: 50),
                        Text(counting),
                        Expanded(
                          child: Center(
                            child: GestureDetector(
                              onTap: () async {
                                final bool playing =
                                    assetsAudioPlayer.isPlaying.value;

                                if (playing) {
                                  await assetsAudioPlayer.stop();
                                  return;
                                }

                                try {
                                  Duration duration = Duration(
                                      seconds: timerValues[timerItems
                                          .indexOf(timerSelectedItem)]);

                                  if (duration.inSeconds != 0) {
                                    Timer.periodic(duration, (timer) async {
                                      counting = timer.tick.toString();
                                      setState(() {});
                                    });
                                  }

                                  Future.delayed(duration, () async {
                                    await assetsAudioPlayer.open(
                                      AudioPlayer.Audio.network(
                                          widget.audio.url),
                                    );
                                  });
                                } catch (t) {
                                  //mp3 unreachable
                                }
                              },
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
                                  if (volume > 20) volume -= 20;
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
                                      setState(() {});
                                    },
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  if (volume <= 80) volume += 20;
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
