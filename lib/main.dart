import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

const List<Color> _colors = [
  Colors.red,
  Colors.orange,
  Colors.yellow,
  Colors.green,
  Colors.teal,
  Colors.blue,
  Colors.purple,
];

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  final player = AudioCache();

  void _playAudio(int soundNumber) {
    player.play('note$soundNumber.wav');
  }

  Widget playButton({int soundNumber, int colorNumber}) => Expanded(
        child: FlatButton(
          color: _colors[colorNumber],
          textColor: Colors.black,
          child: Text('Play sound'),
          onPressed: () => _playAudio(soundNumber),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: List.generate(
                  7,
                  (index) => playButton(
                      soundNumber: index + 1, colorNumber: index)).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
