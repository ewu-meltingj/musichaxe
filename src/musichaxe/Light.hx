package musichaxe;

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
	private var _isDown:Bool;
	private var _ctx:Context;

	public function new(ctx:Context, xCoord:Float, yCoord:Float, dimSpeed:Float) {
		_ctx = ctx;
		_xCoord = xCoord;
		_yCoord = yCoord;
		_dimSpeed = dimSpeed;
		_isDown = true;
	}

	override public function onAdded () {
		var lightTexture = _ctx.pack.getTexture("image/circleBlue");
		var maskTexture = _ctx.pack.getTexture("image/whiteLight");

		owner.add(_lightPad = new ImageSprite(lightTexture));
		owner.addChild(new Entity()
			.add(_lightMask = new ImageSprite(maskTexture))
		);

		_lightMask.setBlendMode(Screen);
		_lightMask.setXY(-38, -40);
		_lightPad.texture = lightTexture;
		_lightPad.centerAnchor();
		_lightPad.scaleY._ *= 1/2;
		_lightPad.alpha._ = 0.5;
		_lightPad.setXY(_xCoord, _yCoord);
		_lightPad.pointerDown.connect(function (_) onTouchLight());
	}

	public function onTouchLight() {
		_ctx.pack.getSound("audio/lightPress").play(0.25);
		fullBrightness();
	}

	public function fullBrightness() {
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