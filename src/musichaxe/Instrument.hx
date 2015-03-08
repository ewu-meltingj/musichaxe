package musichaxe;

import flambe.Component;
import flambe.System;
import flambe.asset.AssetPack;
import flambe.asset.Manifest;
import flambe.util.SignalConnection;
import flambe.util.Value;


class Instrument extends Component {
	private var _connection:SignalConnection;
	private var _ctx:Context;
	private var _sound:String;
	private var _rhythmFunc:Int->Bool;
	private var _velocity:Float;
	private var _light:Light;	

	public function new(ctx:Context, sound:String, func:Int->Bool, velocity:Float) {
		_ctx = ctx;
		_sound = sound;
		_rhythmFunc = func;
		_velocity = velocity;
	}

	override public function onStart() {
		var heartBeat = owner.getFromParents(HeartBeat);
		_connection = heartBeat.beat.changed.connect(onBeatChanged);
		_light = owner.get(Light);
	}

	private function onBeatChanged(to:Int, from:Int) {
		if(_rhythmFunc(from)) {
			_ctx.pack.getSound(_sound).play(_velocity);
			_light.fullBrightness();
		}
	}
	 
	override public function dispose() {
		_connection.dispose();
		super.dispose();
	}
}