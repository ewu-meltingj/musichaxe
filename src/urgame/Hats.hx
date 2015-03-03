package urgame;


class Hats extends Instrument {
	override function onBeatChanged(to:Int, from:Int) {
		if (from%4 != 0 || from%4 != 2) {
			_pack.getSound(_sound).play(0.4);
			_light.maxLight();
		}
	}
}