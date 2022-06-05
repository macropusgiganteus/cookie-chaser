import 'package:cookie_chaser/cookie_chaser_game.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';

void main() {
  print('initializing game...');
  WidgetsFlutterBinding.ensureInitialized();
  CookieChaserGame game = CookieChaserGame();

  runApp(GameWidget(
    game: game,
  ));
}
