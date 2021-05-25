import 'dart:ui';

import 'package:bonfire/bonfire.dart';

class SpriteSheetPlayer {
  static late double animSpeed = 0.05;
  static late Image spriteSheetPlayerRun;
  static late Image spriteSheetPlayerAttack;
  static late Image spriteSheetPlayerIdle;
  static late Image spriteSheetPlayerDie;
  static late Image spriteSheetPlayerDamage;
  static late Future<SpriteAnimation> runTopLeft;
  static late Future<SpriteAnimation> runTopRight;
  static late Future<SpriteAnimation> runBottomRight;
  static late Future<SpriteAnimation> runBottomLeft;
  static late Future<SpriteAnimation> idleBottomRight;
  static late Future<SpriteAnimation> idleBottomLeft;
  static late Future<SpriteAnimation> idleTopRight;
  static late Future<SpriteAnimation> idleTopLeft;

  static Future load() async {
    spriteSheetPlayerRun = await Flame.images.load('land.png');
    spriteSheetPlayerAttack = await Flame.images.load('land.png');
    spriteSheetPlayerIdle = await Flame.images.load('land.png');
    spriteSheetPlayerDie = await Flame.images.load('land.png');
    spriteSheetPlayerDamage = await Flame.images.load('land.png');

    runBottomRight = spriteSheetPlayerRun
        .getAnimation(
          width: 21,
          height: 21,
          count: 4,
        )
        .asFuture();
    runBottomLeft = spriteSheetPlayerRun
        .getAnimation(
          width: 21,
          height: 21,
          count: 4,
          startDy: 21,
        )
        .asFuture();
    runTopRight = spriteSheetPlayerRun
        .getAnimation(
          width: 21,
          height: 21,
          count: 4,
          startDy: 42,
        )
        .asFuture();
    runTopLeft = spriteSheetPlayerRun
        .getAnimation(
          width: 21,
          height: 21,
          count: 4,
          startDy: 63,
        )
        .asFuture();

    idleBottomRight = spriteSheetPlayerIdle
        .getAnimation(
          width: 21,
          height: 21,
          count: 16,
        )
        .asFuture();
    idleBottomLeft = spriteSheetPlayerIdle
        .getAnimation(
          width: 21,
          height: 21,
          count: 16,
          startDy: 21,
        )
        .asFuture();

    idleTopRight = spriteSheetPlayerIdle
        .getAnimation(
          width: 21,
          height: 21,
          count: 16,
          startDy: 42,
        )
        .asFuture();

    idleTopLeft = spriteSheetPlayerIdle
        .getAnimation(
          width: 21,
          height: 21,
          count: 16,
          startDy: 63,
        )
        .asFuture();

    return Future.value();
  }

  static Future<SpriteAnimation> getAttackBottomRight() {
    return spriteSheetPlayerAttack
        .getAnimation(
          width: 21,
          height: 21,
          count: 4,
          loop: false,
          stepTime: animSpeed,
        )
        .asFuture();
  }

  static Future<SpriteAnimation> getAttackBottomLeft() {
    return spriteSheetPlayerAttack
        .getAnimation(
          width: 21,
          height: 21,
          count: 4,
          startDy: 21,
          loop: false,
          stepTime: animSpeed,
        )
        .asFuture();
  }

  static Future<SpriteAnimation> getAttackTopRight() {
    return spriteSheetPlayerAttack
        .getAnimation(
          width: 21,
          height: 21,
          count: 4,
          startDy: 42,
          loop: false,
          stepTime: animSpeed,
        )
        .asFuture();
  }

  static Future<SpriteAnimation> getAttackTopLeft() {
    return spriteSheetPlayerAttack
        .getAnimation(
          width: 21,
          height: 21,
          count: 4,
          startDy: 63,
          loop: false,
          stepTime: animSpeed,
        )
        .asFuture();
  }

  static Future<SpriteAnimation> getDie() {
    return spriteSheetPlayerDie
        .getAnimation(
          width: 21,
          height: 21,
          count: 12,
          loop: false,
        )
        .asFuture();
  }

  static Future<SpriteAnimation> getDamageTopRight() {
    return spriteSheetPlayerDamage
        .getAnimation(
          width: 21,
          height: 21,
          count: 4,
          loop: false,
        )
        .asFuture();
  }

  static Future<SpriteAnimation> getDamageTopLeft() {
    return spriteSheetPlayerDamage
        .getAnimation(
          width: 21,
          height: 21,
          count: 4,
          startDy: 21,
          loop: false,
        )
        .asFuture();
  }

  static Future<SpriteAnimation> getDamageBottomRight() {
    return spriteSheetPlayerDamage
        .getAnimation(
          width: 21,
          height: 21,
          count: 4,
          startDy: 42,
          loop: false,
        )
        .asFuture();
  }

  static Future<SpriteAnimation> getDamageBottomLeft() {
    return spriteSheetPlayerDamage
        .getAnimation(
          width: 21,
          height: 21,
          count: 4,
          startDy: 63,
          loop: false,
        )
        .asFuture();
  }
}
