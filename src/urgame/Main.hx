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

		//left
		System.root.addChild(new Entity()
			.add(new HeartBeat(bpm))
			.add(new Light(width/2 - 200, height/2, .005, "circleBlue"))
			.add(new Bass("kickElectro02", "mindOne"))
			);

		//center
		System.root.addChild(new Entity()
			.add(new HeartBeat(bpm))
			.add(new Light(width/2, height/2, .005, "circlePurple"))
			.add(new Snare("snareBlock", "mindThree"))
			);

		//right
		System.root.addChild(new Entity()
			.add(new HeartBeat(bpm))
			.add(new Light(width/2 + 200, height/2, 0.015, "circleYellow"))
			.add(new Hats("hihatClip", "mindTwo"))
			);

		//top
		System.root.addChild(new Entity()
			.add(new HeartBeat(bpm))
			.add(new Light(width/2, height/2 - 200, 0.005, "circleYellow"))
			.add(new Arp("arp", "mindFour"))
			);

		//bottom
		System.root.addChild(new Entity()
			.add(new HeartBeat(bpm))
			.add(new Light(width/2, height/2 + 200, 0.002, "circleYellow"))
			.add(new Rain("rainStick", "mindFive"))
			);
	}
}