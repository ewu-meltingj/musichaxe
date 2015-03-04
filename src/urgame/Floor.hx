package urgame;

import flambe.Component;
import flambe.System;
import flambe.asset.AssetPack;
import flambe.display.FillSprite;
import flambe.asset.Manifest;
import flambe.Entity;


class Floor extends Component {
	private var _pack :AssetPack;
	private var _floorMain :FillSprite;
	private var _floorShadow :FillSprite;
	private var _width:Float;
	private var _height:Float;

	public function new() {
		_width = System.stage.width;
		_height = System.stage.height;
	}

	override public function onAdded () {
		var manifest = Manifest.fromAssets("image");
		var loader = System.loadAssetPack(manifest);
		loader.get(onSuccess);
	}

	public function getFloor() : FillSprite {
		return _floorMain;
	}

	private function onSuccess (pack :AssetPack) {
		_pack = pack;
		var mainHeight = 75;
		var shadowHeight = 10;
	    _floorMain = new FillSprite(0x555555, _width, mainHeight);
	    _floorShadow = new FillSprite(0x777777, _width, shadowHeight);

	    _floorMain.setXY(0, _height - mainHeight - 10);
	    _floorShadow.setXY(0, _height - shadowHeight - 10);


		owner.addChild(new Entity().add(_floorMain));
		owner.addChild(new Entity().add(_floorShadow));
	}

	override public function onUpdate(dt:Float) {
	}

}