package urgame;

import flambe.Component;
import flambe.System;
import flambe.asset.AssetPack;
import flambe.display.ImageSprite;
import flambe.asset.Manifest;
import flambe.animation.AnimatedFloat;


class Light extends Component {
	private var _pack :AssetPack;
	private var _lightPad :ImageSprite;
	private var _xCoord :Float;
	private var _yCoord :Float;
	private var _dimSpeed :Float;
	private var _image :String;

	public function new(xCoord:Float, yCoord:Float, dimSpeed:Float, image:String) {
		_xCoord = xCoord;
		_yCoord = yCoord;
		_dimSpeed = dimSpeed;
		_image = image;
	}

	override public function onAdded () {
		var manifest = Manifest.fromAssets("image");
		var loader = System.loadAssetPack(manifest);
		loader.get(onSuccess);
    }

    private function onSuccess (pack :AssetPack) {
    	_pack = pack;
    	addLight();
	}

	private function addLight() {
		_lightPad = new ImageSprite(_pack.getTexture(_image));
		_lightPad.setXY(
			_xCoord - _lightPad.getNaturalWidth()/2, 
			_yCoord - _lightPad.getNaturalHeight()/2);
		owner.add(_lightPad);
	}

	override public function onUpdate(dt:Float) {
		if(_lightPad.alpha._ > 0)
			dimLight();
	}

	public function maxLight() {
		_lightPad.alpha._ = 1;
	}

	public function dimLight() {
		_lightPad.alpha._ -= _dimSpeed; // half transparent
	}
}