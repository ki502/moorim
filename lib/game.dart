import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bonfire/bonfire.dart';

import 'package:moorim/main.dart';
import 'package:moorim/player.dart';
import 'package:moorim/background.dart';

class Game extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      tileSize = max(constraints.maxHeight, constraints.maxWidth) / 40;
      return Material(
        color: Colors.transparent,
        child: BonfireTiledWidget(
          joystick: Joystick(
            keyboardEnable: true,
            directional: JoystickDirectional(),
            actions: [
              JoystickAction(
                actionId: 1,
                margin: const EdgeInsets.all(65),
              )
            ],
          ),
          player: HPlayer(Vector2(4 * tileSize, 4 * tileSize)),
          map: TiledWorldMap(
            'maps/map.json',
            forceTileSize: Size(tileSize, tileSize),
            /*
            objectsBuilder: {
              'light': (x, y, width, height) =>
                  Light(Vector2(x, y), width, height),
              'orc': (x, y, width, height) => Orc(Vector2(x, y)),
            },
            */
          ),
          lightingColorGame: Colors.black.withOpacity(0.8),
          progress: Center(
            child: Text(
              'Loading...',
              style: TextStyle(color: Colors.white),
            ),
          ),
          background: Background(),
        ),
      );
    });
  }
}
