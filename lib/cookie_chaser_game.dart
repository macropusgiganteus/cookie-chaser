import 'package:flame/game.dart';
import 'components/player.dart';
import 'helpers/direction.dart';
import 'package:flame/input.dart';

class CookieChaserGame extends FlameGame with TapDetector {
  final Player _player = Player();
  var direction = 0;

  @override
  Future<void> onLoad() async {
    print('loading...');
    add(_player);
  }

  @override
  void onTapUp(TapUpInfo info) {
    if (_player.direction == Direction.none) {
      _player.flipHorizontally();
      _player.direction = Direction.left;
    } else if (_player.direction == Direction.left) {
      _player.direction = Direction.up;
    } else if (_player.direction == Direction.up) {
      _player.direction = Direction.right;
    } else {
      _player.direction = Direction.none;
    }
  }
}
