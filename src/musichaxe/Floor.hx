package musichaxe;

import flambe.Component;
import flambe.System;
import flambe.asset.AssetPack;
import flambe.display.FillSprite;
import flambe.asset.Manifest;
import flambe.Entity;


class Floor extends Component {
	private var _floorMain :FillSprite;
	private var _floorShadow :FillSprite;
	private var _width:Float;
	private var _height:Float;
	private var _ctx:Context;

	public function new(ctx:Context) {
		_ctx = ctx;
		_width = System.stage.width;
		_height = System.stage.height;
	}

	override public function onAdded () {
		var mainHeight = 75;
		var shadowHeight = 10;
		
		owner.add(_floorMain = new FillSprite(0x555555, _width, mainHeight));
		owner.addChild(new Entity()
			.add(_floorShadow = new FillSprite(0x656565, _width, shadowHeight))
		);

	    _floorMain.setXY(0, _height - mainHeight - 10);
	    _floorShadow.setXY(0, mainHeight - shadowHeight);
	}
}