import 'package:flame/game.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'components/player.dart';
import 'helpers/direction.dart';
import 'package:flame/input.dart';

class CookieChaserGame extends FlameGame
    with TapDetector, VerticalDragDetector, HorizontalDragDetector {
  final Player _player = Player();
  late double mapWidth;
  late double mapHeight;
  late TiledComponent map;

  @override
  Future<void> onLoad() async {
    // map = await TiledComponent.load('map.tmx', Vector2.all(16));
    // add(map);

    // mapWidth = map.tileMap.map.width * 16.0;
    // mapHeight = map.tileMap.map.height * 16.0;

    add(_player);
  }

  @override
  void onTapUp(TapUpInfo info) {
    _player.direction = Direction.none;
  }

  @override
  void onVerticalDragEnd(DragEndInfo info) {
    final primaryYVelocity = info.raw.primaryVelocity ?? 0;
    if (primaryYVelocity > 0 && _player.direction != Direction.down) {
      _player.direction = Direction.down;
    } else {
      _player.direction = Direction.up;
    }
  }

  @override
  void onHorizontalDragEnd(DragEndInfo info) {
    final primaryXVelocity = info.raw.primaryVelocity ?? 0;
    if (primaryXVelocity > 0) {
      if (_player.direction != Direction.right &&
          _player.direction != Direction.none) {
        _player.flipHorizontallyAroundCenter();
      }
      _player.direction = Direction.right;
    } else {
      if (_player.direction != Direction.left) {
        _player.flipHorizontallyAroundCenter();
      }
      _player.direction = Direction.left;
    }
  }
}
