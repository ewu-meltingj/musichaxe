package urgame;

import flambe.Component;
import flambe.System;
import flambe.asset.AssetPack;
import flambe.display.FillSprite;
import flambe.asset.Manifest;
import flambe.Entity;
import flambe.display.ImageSprite;
import flambe.display.Sprite;
import flambe.input.MouseCursor;
import flambe.swf.Library;
import flambe.swf.MoviePlayer;
import flambe.math.FMath;
import flambe.input.PointerEvent;

// Right now just veiwing how movie players work!


class Man extends Component {
	private var _pack :AssetPack;
	private var _monster :Entity;
	private var _targetX:Float;
	private var _targetY:Float;

	public function new() {
	}

	override public function onAdded () {
		var manifest = Manifest.fromAssets("image");
		var loader = System.loadAssetPack(manifest);
		loader.get(onSuccess);
	}

	private function onSuccess (pack :AssetPack) {
		_pack = pack;

		_monster = new Entity()
			.add(new MoviePlayer(new Library(_pack, "monster")).loop("idle"))
			.add(new Sprite().setXY(120, System.stage.height - 50));

		_monster.get(Sprite).pointerDown.connect(function (event) {
			_monster.get(MoviePlayer).play("attack");
		});

		_targetX = 120;
		_targetY = System.stage.height - 50;
		owner.addChild(_monster);


		System.pointer.down.connect(handlePointerDown);
	}

	public function handlePointerDown(event:PointerEvent) {
			_targetX = event.viewX;
			_targetY = event.viewY;
			
	}

	override public function onUpdate(dt:Float) {
		var sprite = _monster.get(Sprite);
        var walking = false;

        if (_targetX != sprite.x._) {
            var left = (_targetX < sprite.x._);

            sprite.x._ += dt*SPEED*(left ? -1 : 1);
            if (sprite.x._ < _targetX == left) {
                sprite.x._ = _targetX;
            }
            sprite.scaleX._ = (left ? 1 : -1) * Math.abs(sprite.scaleX._);
            walking = true;
        }

        if (_targetY < 150) {
            _targetY = 150;
        }

        if (_targetY != sprite.y._) {
            var up = (_targetY < sprite.y._);

            sprite.y._ += dt*SPEED*(up ? -1 : 1);
            if (sprite.y._ < _targetY == up) {
                sprite.y._ = _targetY;
            }

            var scale = 0.5 + 0.2*sprite.y._/System.stage.height;
            sprite.scaleX._ = scale*FMath.sign(sprite.scaleX._);
            sprite.scaleY._ = scale;
            walking = true;
        }

        var player = _monster.get(MoviePlayer);
        // Don't interrupt any currently playing oneshot animations
        if (player.looping) {
            player.loop(walking ? "walk" : "idle", false);
        }
	}

	private static inline var SPEED = 100; // pixels per second -ish

}