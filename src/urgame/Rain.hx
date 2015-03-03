package urgame;


class Rain extends Instrument {
	override function onBeatChanged(to:Int, from:Int) {
		if (from%16 == 0 && from != 0) {
			_pack.getSound(_sound).play(1);
			_light.maxLight();
		}
	}
}