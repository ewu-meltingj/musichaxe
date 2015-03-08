package musichaxe;

import flambe.System;
import flambe.Component;
import flambe.Entity;
import flambe.display.PatternSprite;

class M_Level extends Component {

	private var _ctx:Context;
	private var _worldLayer:Entity;
	private var _lightLayer:Entity;
	private var _floorLayer:Entity;
	
	public function new(ctx :Context) {
		_ctx = ctx;
	}

	override public function onAdded () {
		var width =  System.stage.width;
		var height = System.stage.height;
		var bpm = 80;

		_worldLayer = new Entity();
		owner.addChild(_worldLayer);

		var background = new PatternSprite(_ctx.pack.getTexture("image/stardust"), width, height);
		_worldLayer.addChild(new Entity().add(background));
		_worldLayer.addChild(_floorLayer = new Entity());
		_worldLayer.addChild(_lightLayer = new Entity());

		_worldLayer.add(new HeartBeat(bpm));

		_floorLayer.addChild(new Entity()
			.add(new Floor(_ctx))
		);

		_lightLayer.addChild(new Entity()
			.add(new Light(_ctx, width/2 - 400, height - 60, 0.005))
			.add(new Instrument(_ctx, "audio/rainStick", Rhythms.seventeen_32, 1))
		);

		_lightLayer.addChild(new Entity()
			.add(new Light(_ctx, width/2 - 200, height - 60, .005))
			.add(new Instrument(_ctx, "audio/kickElectro02", Rhythms.one_4, 1))
		);

		_lightLayer.addChild(new Entity()
			.add(new Light(_ctx, width/2, height - 60, .005))
			.add(new Instrument(_ctx, "audio/snareBlock", Rhythms.three_4, 0.6))
		);

		_lightLayer.addChild(new Entity()
			.add(new Light(_ctx, width/2 + 200, height - 60, 0.005))
			.add(new Instrument(_ctx, "audio/hihatClip", Rhythms.twoAndFour_4, 0.3))
		);

		_lightLayer.addChild(new Entity()
			.add(new Light(_ctx, width/2 + 400, height - 60, 0.005))
			.add(new Instrument(_ctx, "audio/arp", Rhythms.one_16, 1))
		);
	}
}