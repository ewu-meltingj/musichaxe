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

	public function new(sound:String, soundEvent:String) {
		_sound = sound;
		_soundEvent = soundEvent;
	}

	override public function onAdded () {
		var manifest = Manifest.fromAssets("audio");
		var loader = System.loadAssetPack(manifest);
		loader.get(onSuccess);
	}

	override public function onStart() {
		_light = owner.getFromParents(Light);
		var heartBeat = owner.getFromParents(HeartBeat);
		_connection = heartBeat.beat.changed.connect(onBeatChanged);
	}

	function onBeatChanged(to:Int, from:Int) {
	}
	 
	override public function dispose() {
		_connection.dispose();
		super.dispose();
	}

	private function onSuccess (pack :AssetPack) {
		_pack = pack;
	}

	public function playSoundEvent () {
		_pack.getSound(_soundEvent).play(0.35);
	}
}