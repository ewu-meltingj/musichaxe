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
	private var _soundEvent:String;
	private var _rhythmFunc:Int->Bool;
	private var _velocity:Float;
	public var hasStruck:Value<Bool>;

	public function new(ctx:Context, sound:String, soundEvent:String, func:Int->Bool, velocity:Float) {
		_ctx = ctx;
		_sound = sound;
		_soundEvent = soundEvent;
		_rhythmFunc = func;
		_velocity = velocity;
		hasStruck = new Value<Bool>(false);
	}

	override public function onStart() {
		var heartBeat = owner.getFromParents(HeartBeat);
		_connection = heartBeat.beat.changed.connect(onBeatChanged);
	}

	private function onBeatChanged(to:Int, from:Int) {
		if(_rhythmFunc(from)) {
			_ctx.pack.getSound(_sound).play(_velocity);
			if(hasStruck._)
				hasStruck._ = false;
			else
				hasStruck._ = true;
		}
	}

	public function playSoundEvent () {
		_ctx.pack.getSound(_soundEvent).play(0.45);
	}
	 
	override public function dispose() {
		_connection.dispose();
		super.dispose();
	}
}