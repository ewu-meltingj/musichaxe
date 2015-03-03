package urgame;

import flambe.Component;
import flambe.System;
import flambe.asset.AssetPack;
import flambe.display.ImageSprite;
import flambe.asset.Manifest;
import flambe.script.Delay;
import flambe.display.EmitterMold;
import flambe.display.EmitterSprite;
import flambe.input.PointerEvent;


class Light extends Component {
	private var _pack :AssetPack;
	private var _lightPad :ImageSprite;
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
    	addLight();
	}

	private function addLight() {
		_lightPad = new ImageSprite(_pack.getTexture(_image));
		_lightPad.setXY(
			_xCoord - _lightPad.getNaturalWidth()/2, 
			_yCoord - _lightPad.getNaturalHeight()/2
		);

		_lightPad.pointerDown.connect(function (_) modifyLight());
		owner.add(_lightPad);
	}

	private function modifyLight() {
		_instrument.playSoundEvent();
		maxLight();
	}

	override public function onUpdate(dt:Float) {
		if(_lightPad.alpha._ > 0 && _isDown) {
			dimLight(-1);
		}
		else if(_lightPad.alpha._ < 1) {
			_isDown = false;
			dimLight(1);
		}
		else
			_isDown = true;
	}

	public function maxLight() {
		_lightPad.alpha._ = 1;
	}

	public function dimLight(direction:Int) {
		_lightPad.alpha._ += _dimSpeed*direction;
	}

	private function getRad(angle:Float) : Float{
		return angle * Math.PI / 180;
	};
}