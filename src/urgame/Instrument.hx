package urgame;

import flambe.Component;
import flambe.System;
import flambe.asset.AssetPack;
import flambe.asset.Manifest;
import flambe.util.SignalConnection;


class Instrument extends Component {
	private var _connection:SignalConnection;
	private var _pack :AssetPack;
	private var _light :Light;
	private var _sound:String;
	private var _soundEvent:String;
	private var _rhythmFunc:Int->Bool;
	private var _velocity:Float;

	public function new(sound:String, soundEvent:String, func:Int->Bool, velocity:Float) {
		_sound = sound;
		_soundEvent = soundEvent;
		_rhythmFunc = func;
		_velocity = velocity;
	}

	override public function onStart() {
		_light = owner.getFromParents(Light);
		var heartBeat = owner.getFromParents(HeartBeat);
		_connection = heartBeat.beat.changed.connect(onBeatChanged);
	}

	override public function onAdded () {
		var manifest = Manifest.fromAssets("audio");
		var loader = System.loadAssetPack(manifest);
		loader.get(onSuccess);
	}

	private function onSuccess (pack :AssetPack) {
		_pack = pack;
	}

	private function onBeatChanged(to:Int, from:Int) {
		if(_rhythmFunc(from)) {
			_pack.getSound(_sound).play(_velocity);
			_light.onMaxLight();
		}
	}

	public function playSoundEvent () {
		_pack.getSound(_soundEvent).play(0.45);
	}
	 
	override public function dispose() {
		_connection.dispose();
		super.dispose();
	}
}