import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:bonfire/bonfire.dart';
import 'package:flame/flame.dart';

import 'package:moorim/game.dart';
import 'package:moorim/player_sprite.dart';

double tileSize = 20.0;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (!kIsWeb) {
    await Flame.device.fullScreen();
    await Flame.device.setLandscape();
  }

  await SpriteSheetPlayer.load();
  //await SpriteSheetOrc.load();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '무림',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Game(),
    );
  }
}
