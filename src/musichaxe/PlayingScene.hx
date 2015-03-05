package musichaxe;

import flambe.Entity;
import flambe.System;
import flambe.display.ImageSprite;
import flambe.display.TextSprite;

class PlayingScene {
	public static function create (ctx :Context) {
		var scene = new Entity();
		var level = new M_Level(ctx);
		ctx._level = level;
		scene.add(level);
		return scene;
	}
}