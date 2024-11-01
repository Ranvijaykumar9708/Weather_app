import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:weather_app/widgets/botton_widget.dart';

class FullScreenNotificationScreen extends StatefulWidget {

  const FullScreenNotificationScreen({Key? key}) : super(key: key);

  @override
  _FullScreenNotificationScreenState createState() => _FullScreenNotificationScreenState();
}

class _FullScreenNotificationScreenState extends State<FullScreenNotificationScreen> {
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _playSound();
  }

  void _playSound() async {
    try {
      // You can use an asset sound or network sound URL here
      await _audioPlayer.play(AssetSource('music/ring_music.mp3'));
    } catch (e, stackTrace) {
      log('Error playing sound: $e');
      FirebaseCrashlytics.instance.recordError(e, stackTrace, reason: 'Error playing notification sound');
    }
  }

  @override
  void dispose() {
    try {
      _audioPlayer.stop(); // Stop audio playback when screen is disposed
      _audioPlayer.dispose();
    } catch (e, stackTrace) {
      log('Error stopping sound: $e');
      FirebaseCrashlytics.instance.recordError(e, stackTrace, reason: 'Error stopping notification sound');
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueGrey, Colors.deepPurple],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.alarm, size: 180, color: Colors.white),
                const Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text( "It's Meal Time!",
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
                ),
                const Text( "Attention Please, It's your meal time, please have a look.",
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 18, color: Colors.white)),
                const SizedBox(height: 30),
                getBottonWidget(
                  title: 'Close',
                  onPressed: () {
                    Get.back();
                  }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
