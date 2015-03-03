package urgame;


class Hats extends Instrument {
	override function onBeatChanged(to:Int, from:Int) {
		if (to%4 != 0 || to%4 != 2) {
			_pack.getSound(_sound).play(0.2);
			_light.maxLight();
		}
	}
}