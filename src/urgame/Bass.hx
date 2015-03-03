package urgame;


class Bass extends Instrument {
	override function onBeatChanged(to:Int, from:Int) {
		if (to%4 == 0) {
			_pack.getSound(_sound).play(1);
			_light.maxLight();
		}
	}
}