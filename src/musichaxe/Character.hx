package musichaxe;

import flambe.Component;
import flambe.System;
import flambe.display.FillSprite;



class Character extends Component {
	private var _ctx:Context;
	private var _Character :FillSprite;

	public function new(ctx:Context) {
		_ctx = ctx;
	}

	override public function onAdded() {
		var mainHeight = 75;
		var shadowHeight = 10;
		
		owner.add(_Character = new FillSprite(0xFFFFFF, 30, 30));

	    _Character.setXY(20, 20);
	}

	override public function onUpdate(dt:Float) {
		
	}

}