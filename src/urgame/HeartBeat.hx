package urgame;


import flambe.animation.AnimatedFloat;
import flambe.Component;
import flambe.util.Value;
import flambe.script.Delay;


/**
* @author Mark Knol [http://blog.stroep.nl]
*/
class HeartBeat extends Component {
	public var beat:Value<Int>;
	public var beatsPerMinute:AnimatedFloat;
	public var ticksPerBeat:Int;
	
	var _current:Float = 0; // seconds
	var _seconds:Float = 0; // seconds
	var _beat:Float = 1; // seconds
	
	public function new(beatsPerMinute:Int, ticksPerBeat:Int) {
		this.ticksPerBeat = ticksPerBeat;
		this.beatsPerMinute = new AnimatedFloat(beatsPerMinute);
		this.beat = new Value<Int>(0);
	}
	
	override public function onUpdate(dt:Float) {
		_current += dt;
		beatsPerMinute.update(dt);

		if (_current >= _beat) {
			_current = _current - _beat;
			_seconds += 1;
			new Delay(_current);
			beat._ = Std.int(_seconds) % ticksPerBeat;
		}
	}
}

		