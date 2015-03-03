package urgame;

import flambe.Component;
import flambe.System;
import flambe.asset.AssetPack;
import flambe.display.FillSprite;
import flambe.asset.Manifest;


class Floor extends Component {
	private var _pack :AssetPack;
	private var _fSprite :FillSprite;
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

	private function onSuccess (pack :AssetPack) {
		_pack = pack;
		var height = 100;
	    _fSprite = new FillSprite(0x555555, _width, height);
	    _fSprite.setXY(0, _height - height);

		owner.add(_fSprite);
	}

	override public function onUpdate(dt:Float) {
	}

}