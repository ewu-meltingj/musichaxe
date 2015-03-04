package urgame;

import flambe.Entity;
import flambe.System;

class Main {
	private static function main () {
		System.init();
		var width:Int = System.stage.width;
		var height:Int = System.stage.height;
		var bpm:Int = 80;

		//heatbeat
		System.root.add(new HeartBeat(bpm));
		System.root.add(new Collision());


		//background
		System.root.addChild(new Entity().add(new Background(width, height)));

		//floor
		System.root.addChild(new Entity().add(new Floor()));

		//first
		System.root.addChild(new Entity()
			.add(new Light(width/2 - 400, height - 60, 0.002, "circleBlue"))
			.add(new Instrument("rainStick", "mindOne", Rhythms.seventeen_32, 1))
			.add(new Collidable())
		);

		//second
		System.root.addChild(new Entity()
			.add(new Light(width/2 - 200, height - 60, .005, "circleBlue"))
			.add(new Instrument("kickElectro02", "mindTwo", Rhythms.one_4, 1))
			.add(new Collidable())
		);

		//third
		System.root.addChild(new Entity()
			.add(new Light(width/2, height - 60, .005, "circleBlue"))
			.add(new Instrument("snareBlock", "mindThree", Rhythms.three_4, 0.6))
			.add(new Collidable())
		);

		//fourth
		System.root.addChild(new Entity()
			.add(new Light(width/2 + 200, height - 60, 0.015, "circleBlue"))
			.add(new Instrument("hihatClip", "mindFour", Rhythms.twoAndFour_4, 0.3))
			.add(new Collidable())
		);

		//fifth
		System.root.addChild(new Entity()
			.add(new Light(width/2 + 400, height - 60, 0.005, "circleBlue"))
			.add(new Instrument("arp", "mindFive", Rhythms.one_16, 1))
			.add(new Collidable())
		);

		//man
		System.root.addChild(new Entity()
			.add(new Man())
		);

		
	}
}