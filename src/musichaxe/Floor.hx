package musichaxe;

import flambe.Component;
import flambe.System;
import flambe.asset.AssetPack;
import flambe.display.FillSprite;
import flambe.asset.Manifest;
import flambe.Entity;


class Floor extends Component {
	private var _floorMain :FillSprite;
	private var _width:Float;
	private var _height:Float;
	private var _ctx:Context;

	public function new(ctx:Context) {
		_ctx = ctx;
		_width = System.stage.width;
		_height = System.stage.height;
	}

	override public function onAdded () {
		_floorMain = owner.get(FillSprite);
		var mainHeight = 75;
		
		if (_floorMain == null) {
			owner.add(_floorMain = new FillSprite(0x555555, _width, mainHeight));
		}
	    _floorMain.setXY(0, _height - mainHeight - 10);
		_floorMain = new FillSprite(0x555555, _width, mainHeight);	    
	}
}