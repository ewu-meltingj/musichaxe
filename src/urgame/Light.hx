package urgame;

import flambe.Component;
import flambe.Entity;
import flambe.System;
import flambe.asset.AssetPack;
import flambe.display.ImageSprite;
import flambe.display.Texture;
import flambe.asset.Manifest;



class Light extends Component {
	private var _pack :AssetPack;
	private var _lightPad :ImageSprite;
	private var _lightMask :ImageSprite;
	private var _xCoord :Float;
	private var _yCoord :Float;
	private var _dimSpeed :Float;
	private var _image :String;
	private var _isDown:Bool;
	private var _instrument:Instrument;

	public function new(xCoord:Float, yCoord:Float, dimSpeed:Float, image:String) {
		_xCoord = xCoord;
		_yCoord = yCoord;
		_dimSpeed = dimSpeed;
		_image = image;
		_isDown = true;
	}

	override public function onAdded () {
		var manifest = Manifest.fromAssets("image");
		var loader = System.loadAssetPack(manifest);
		loader.get(onSuccess);
	}

	private function onSuccess (pack :AssetPack) {
		_pack = pack;
		_instrument = owner.getFromParents(Instrument);
		addMask();
		addLight();
	}

	private function addLight() {
		_lightPad = new ImageSprite(_pack.getTexture(_image));
		_lightPad.scaleY._ *= 1/2;
		_lightPad.anchorY._ = _lightPad.getNaturalHeight()/2;
		_lightPad.anchorX._ = _lightPad.getNaturalWidth()/2;
		_lightPad.setXY(_xCoord, _yCoord);
		owner.addChild(new Entity().add(_lightPad));

		_lightPad.pointerDown.connect(function (_) modifyLight());
	}

	private function addMask() {
		_lightMask = new ImageSprite(_pack.getTexture("whiteLight"));
		_lightMask.anchorY._ = _lightMask.getNaturalHeight()/2;
		_lightMask.anchorX._ = _lightMask.getNaturalWidth()/2;
		_lightMask.setXY(_xCoord + 2, _yCoord - 14);
		_lightMask.alpha._ = 0.1;
		_lightMask.setBlendMode(Screen);
		owner.addChild(new Entity().add(_lightMask));
	}

	private function modifyLight() {
		_instrument.playSoundEvent();
		onMaxLight();
	}

	override public function onUpdate(dt:Float) {
		if(_lightPad.alpha._ > 0.3 && _isDown) {
			onDimLight(-1);
		}
		else if(_lightPad.alpha._ < 1) {
			_isDown = false;
			onDimLight(1);
		}
		else
			_isDown = true;
	}

	public function onMaxLight() {
		_lightPad.alpha._ = 1;
		_lightMask.alpha._ = 0.6;
	}

	public function onDimLight(direction:Int) {
		_lightPad.alpha._ += _dimSpeed*direction;
		_lightMask.alpha._ += _dimSpeed*direction;

	}
}