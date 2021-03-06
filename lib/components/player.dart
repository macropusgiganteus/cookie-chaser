import 'package:cookie_chaser/cookie_chaser_game.dart';

import '../helpers/direction.dart';
import 'package:flame/sprite.dart';
import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flame/geometry.dart';

class Player extends SpriteAnimationComponent with HasGameRef {
  Player() : super(size: Vector2.all(50.0));

  Direction direction = Direction.none;
  final double _playerSpeed = 300.0;
  final double _animationSpeed = 0.15;

  late SpriteAnimation _moveDownAnimation;
  late SpriteAnimation _moveLeftAnimation;
  late SpriteAnimation _moveUpAnimation;
  late SpriteAnimation _moveRightAnimation;
  late SpriteAnimation _idleAnimation;
  late SpriteAnimation _runAnimation;

  @override
  Future<void> onLoad() async {
    print('initializing player component...');
    await super.onLoad();
    _idleAnimation = SpriteSheet(
      image: await gameRef.images.load('blue_witch/B_witch_idle.png'),
      srcSize: Vector2(32.0, 48.0),
    ).createAnimation(row: 0, stepTime: _animationSpeed, to: 6);

    _runAnimation = _moveRightAnimation =
        _moveDownAnimation = _moveUpAnimation = SpriteSheet(
      image: await gameRef.images.load('blue_witch/B_witch_run.png'),
      srcSize: Vector2(32.0, 48.0),
    ).createAnimation(row: 0, stepTime: _animationSpeed, to: 8);

    _moveLeftAnimation = _runAnimation;

    animation = _idleAnimation;
    position = Vector2(150, 200);
    size = Vector2.all(80);
    // await _loadAnimations().then((_) => {animation = _standingAnimation});
    print('initialized.');
  }

  // Future<void> _loadAnimations() async {}

  @override
  void update(double dt) {
    super.update(dt);
    movePlayer(dt);
  }

  void movePlayer(double delta) {
    switch (direction) {
      case Direction.up:
        animation = _moveUpAnimation;
        if (y - 80 > 0) y -= 1;
        break;
      case Direction.down:
        animation = _moveDownAnimation;
        if (y + 80 < gameRef.size.y) y += 1;
        break;
      case Direction.left:
        animation = _moveLeftAnimation;
        if (x - 80 > 0) x -= 1;
        break;
      case Direction.right:
        animation = _moveRightAnimation;
        if (x + 80 < gameRef.size.x) x += 1;
        break;
      case Direction.none:
        animation = _idleAnimation;
        break;
    }
  }
}
