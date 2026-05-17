import 'package:flutter/material.dart';
import 'package:music_app/features/home/presentation/screen/home_screen.dart';
import 'package:music_app/features/song/presentation/screen/song_screen.dart';

class Routes {
  static const String homeScreen = '/homeScreen';
  static const String songScreen = '/songScreen';


  static Map<String, WidgetBuilder> get routes => {
        homeScreen: (context) => const HomeScreen(),
        songScreen: (context) => const SongScreen(),

      };
}
