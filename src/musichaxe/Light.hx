package musichaxe;

import flambe.Component;
import flambe.Entity;
import flambe.System;
import flambe.asset.AssetPack;
import flambe.display.ImageSprite;
import flambe.display.Texture;
import flambe.asset.Manifest;
import flambe.util.SignalConnection;

class Light extends Component {
	private var _pack :AssetPack;
	private var _lightPad :ImageMaskSprite;
	private var _lightMask :ImageMaskSprite;
	private var _xCoord :Float;
	private var _yCoord :Float;
	private var _dimSpeed :Float;
	private var _isDown:Bool;
	private var _ctx:Context;
	private var _connection:SignalConnection;

	public function new(ctx:Context, xCoord:Float, yCoord:Float, dimSpeed:Float) {
		_ctx = ctx;
		_xCoord = xCoord;
		_yCoord = yCoord;
		_dimSpeed = dimSpeed;
		_isDown = true;
	}

	override public function onStart() {
		var instrument = owner.get(Instrument);
		_connection = instrument.hasStruck.changed.connect(onStruckChanged);
	}

	override public function onAdded () {
		var lightTexture = _ctx.pack.getTexture("image/circleBlue");
		var maskTexture = _ctx.pack.getTexture("image/whiteLight");

		_lightPad = owner.get(ImageMaskSprite);
		if (_lightPad == null) {
			owner.add(_lightPad = new ImageMaskSprite(lightTexture, maskTexture));
		}
		_lightPad.texture = lightTexture;
		_lightPad.centerAnchor();
		_lightPad.scaleY._ *= 1/2;
		_lightPad.alpha._ = 0.5;
		_lightPad.setXY(_xCoord, _yCoord);
		_lightPad.pointerDown.connect(function (_) onModifyLight());
	}

	private function onStruckChanged(to:Bool, from:Bool) {
		onModifyLight();
	}

	private function onModifyLight() {
		_lightPad.alpha._ = 1;
	}

	override public function onUpdate(dt:Float) {
		if(_lightPad.alpha._ > 0.2 && _isDown) {
			_lightPad.alpha._ += _dimSpeed*-1;
		}
		else if(_lightPad.alpha._ < 0.5) {
			_isDown = false;
			_lightPad.alpha._ += _dimSpeed;
		}
		else
			_isDown = true;
	}
}