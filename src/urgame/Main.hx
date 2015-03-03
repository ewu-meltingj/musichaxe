package urgame;

import flambe.Entity;
import flambe.System;
import flambe.asset.AssetPack;
import flambe.asset.Manifest;
import flambe.display.FillSprite;
import flambe.display.ImageSprite;

class Main {
	private static function main () {
		// Wind up all platform-specific stuff
		System.init();
		var width:Int = System.stage.width;
		var height:Int = System.stage.height;
		var bpm:Int = 90;
		var tpb:Int = 32;

		// Load up the compiled pack in the assets directory named "bootstrap"
		var background = new FillSprite(0x333333, width, height);
		System.root.addChild(new Entity().add(background));

		System.root.addChild(new Entity()
			.add(new HeartBeat(bpm, tpb))
			.add(new Light(width/2 - 200, height/2, .0125, "circleBlue"))
			.add(new Bass("kickElectro02"))
			);

		System.root.addChild(new Entity()
			.add(new HeartBeat(bpm, tpb))
			.add(new Light(width/2, height/2, .0125, "circlePurple"))
			.add(new Snare("snareBlock"))
			);

		System.root.addChild(new Entity()
			.add(new HeartBeat(bpm, tpb))
			.add(new Light(width/2 + 200, height/2, 0.02, "circleYellow"))
			.add(new Hats("hihatDigital"))
			);
	}
}