package urgame;

import flambe.Component;
import flambe.System;
import flambe.asset.AssetPack;
import flambe.asset.Manifest;
import flambe.Entity;
import flambe.display.PatternSprite;


class Background extends Component {
	private var _pack :AssetPack;
	private var _width:Float;
	private var _height:Float;
	private var _background :PatternSprite;

	public function new(width:Float, height:Float) {
		_width = width;
		_height = height;
	}

	override public function onAdded () {
		var manifest = Manifest.fromAssets("image");
		var loader = System.loadAssetPack(manifest);
		loader.get(onSuccess);
	}

	private function onSuccess (pack :AssetPack) {
		_pack = pack;
		_background = new PatternSprite(_pack.getTexture("stardust"), _width, _height);
		owner.addChild(new Entity().add(_background));
	}
}