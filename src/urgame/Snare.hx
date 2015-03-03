package urgame;

class Snare extends Instrument {
	override function onBeatChanged(to:Int, from:Int) {
		if (to%4 == 2) {
			_pack.getSound(_sound).play(0.8);
			_light.maxLight();
		}
	}
}