import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:moorim/main.dart';
import 'package:moorim/player_sprite.dart';

class HPlayer extends SimplePlayer with Lighting, ObjectCollision {
  static late double maxSpeed = tileSize * 4;
  bool lockMove = false;

  HPlayer(Vector2 position)
      : super(
          position: position,
          animation: SimpleDirectionAnimation(
            idleLeft: SpriteSheetPlayer.idleBottomLeft,
            idleRight: SpriteSheetPlayer.idleBottomRight,
            idleUp: SpriteSheetPlayer.idleTopRight,
            idleUpLeft: SpriteSheetPlayer.idleTopLeft,
            idleUpRight: SpriteSheetPlayer.idleTopRight,
            runLeft: SpriteSheetPlayer.runBottomLeft,
            runRight: SpriteSheetPlayer.runBottomRight,
            runUpLeft: SpriteSheetPlayer.runTopLeft,
            runUpRight: SpriteSheetPlayer.runTopRight,
            runDownLeft: SpriteSheetPlayer.runBottomLeft,
            runDownRight: SpriteSheetPlayer.runBottomRight,
          ),
          speed: maxSpeed,
          width: tileSize * 2.9,
          height: tileSize * 2.9,
        ) {
    setupLighting(
      LightingConfig(
        radius: width,
        blurBorder: width,
        color: Colors.transparent,
      ),
    );

    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Size(tileSize * 0.4, tileSize * 0.5),
            align: Vector2(
              tileSize * 1.2,
              tileSize * 1.5,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void joystickAction(JoystickActionEvent event) {
    if (isDead || lockMove) return;
    if ((event.id == 1 && event.event == ActionEvent.DOWN) ||
        ((event.id == LogicalKeyboardKey.space.keyId ||
                event.id == LogicalKeyboardKey.select.keyId) &&
            event.event == ActionEvent.DOWN)) {
      addAttackAnimation();
      this.simpleAttackMelee(
        damage: 10,
        width: tileSize * 1.5,
        height: tileSize * 1.5,
        withPush: false,
      );
    }
    super.joystickAction(event);
  }

  @override
  void joystickChangeDirectional(JoystickDirectionalEvent event) {
    if (lockMove) {
      return;
    }
    speed = maxSpeed * event.intensity;
    super.joystickChangeDirectional(event);
  }

  @override
  void receiveDamage(double damage, dynamic from) {
    this.showDamage(
      damage,
      initVelocityTop: -2,
    );

    lockMove = true;
    idle();
    addDamageAnimation(() {
      lockMove = false;
    });
    super.receiveDamage(damage, from);
  }

  @override
  void die() {
    remove();
    gameRef.addGameComponent(
      AnimatedObjectOnce(
        animation: SpriteSheetPlayer.getDie(),
        position: this.position,
      ),
    );
    super.die();
  }

  void addAttackAnimation() {
    Future<SpriteAnimation> newAnimation;
    switch (lastDirection) {
      case Direction.left:
        newAnimation = SpriteSheetPlayer.getAttackBottomLeft();
        break;
      case Direction.right:
        newAnimation = SpriteSheetPlayer.getAttackBottomRight();
        break;
      case Direction.up:
        newAnimation = SpriteSheetPlayer.getAttackTopRight();
        break;
      case Direction.down:
        newAnimation = SpriteSheetPlayer.getAttackBottomRight();
        break;
      case Direction.upLeft:
        newAnimation = SpriteSheetPlayer.getAttackTopLeft();
        break;
      case Direction.upRight:
        newAnimation = SpriteSheetPlayer.getAttackTopRight();
        break;
      case Direction.downLeft:
        newAnimation = SpriteSheetPlayer.getAttackBottomLeft();
        break;
      case Direction.downRight:
        newAnimation = SpriteSheetPlayer.getAttackBottomRight();
        break;
    }
    animation.playOnce(newAnimation, position);
  }

  void addDamageAnimation(VoidCallback onFinish) {
    Future<SpriteAnimation> newAnimation;
    switch (lastDirection) {
      case Direction.left:
        newAnimation = SpriteSheetPlayer.getDamageBottomLeft();
        break;
      case Direction.right:
        newAnimation = SpriteSheetPlayer.getDamageBottomRight();
        break;
      case Direction.up:
        newAnimation = SpriteSheetPlayer.getDamageTopRight();
        break;
      case Direction.down:
        newAnimation = SpriteSheetPlayer.getDamageBottomRight();
        break;
      case Direction.upLeft:
        newAnimation = SpriteSheetPlayer.getDamageTopLeft();
        break;
      case Direction.upRight:
        newAnimation = SpriteSheetPlayer.getDamageTopRight();
        break;
      case Direction.downLeft:
        newAnimation = SpriteSheetPlayer.getDamageBottomLeft();
        break;
      case Direction.downRight:
        newAnimation = SpriteSheetPlayer.getDamageBottomRight();
        break;
    }

    animation.playOnce(
      newAnimation,
      position,
      runToTheEnd: true,
      onFinish: onFinish,
    );
  }
}
