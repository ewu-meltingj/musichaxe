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
		var bpm:Int = 80;

		// Load up the compiled pack in the assets directory named "bootstrap"
		var background = new FillSprite(0x222222, width, height);
		System.root.addChild(new Entity().add(background));

		//floor
		System.root.addChild(new Entity()
			.add(new Floor())
			);

		//first
		System.root.addChild(new Entity()
			.add(new HeartBeat(bpm))
			.add(new Light(width/2 - 400, height - 60, 0.002, "circlePurple"))
			.add(new Rain("rainStick", "mindFive"))
			);

		//second
		System.root.addChild(new Entity()
			.add(new HeartBeat(bpm))
			.add(new Light(width/2 - 200, height - 60, .005, "circlePurple"))
			.add(new Bass("kickElectro02", "mindOne"))
			);

		//third
		System.root.addChild(new Entity()
			.add(new HeartBeat(bpm))
			.add(new Light(width/2, height - 60, .005, "circlePurple"))
			.add(new Snare("snareBlock", "mindThree"))
			);

		//fourth
		System.root.addChild(new Entity()
			.add(new HeartBeat(bpm))
			.add(new Light(width/2 + 200, height - 60, 0.015, "circlePurple"))
			.add(new Hats("hihatClip", "mindTwo"))
			);

		//fifth
		System.root.addChild(new Entity()
			.add(new HeartBeat(bpm))
			.add(new Light(width/2 + 400, height - 60, 0.005, "circlePurple"))
			.add(new Arp("arp", "mindFour"))
			);

		
	}
}