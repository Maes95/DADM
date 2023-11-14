import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioApp extends StatefulWidget {
  const AudioApp();

  @override
  _AudioAppState createState() => _AudioAppState();
}

class _AudioAppState extends State<AudioApp> {

  final player = AudioPlayer();

  void play() {
    player.play(AssetSource('coins.wav'));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Audio Demo',
      home: Scaffold(
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Click on the play button to play a sound',
                style: TextStyle(fontSize: 20)
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: play,
          tooltip: 'Play',
          child: const Icon(Icons.volume_up),
        ),
      ),
    );
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }
  
}
