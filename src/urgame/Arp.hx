package urgame;


class Arp extends Instrument {
	override function onBeatChanged(to:Int, from:Int) {
		if (from == 0) {
			_pack.getSound(_sound).play(1);
		}
		if (from%8 == 0) {
			_light.maxLight();
		}
	}
}