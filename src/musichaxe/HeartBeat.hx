package musichaxe;

import flambe.Component;
import flambe.util.Value;
import flambe.script.Delay;


/**
* @author Mark Knol [http://blog.stroep.nl]
* based off of Mark's HeartBeat.
* Updating to keep a steadier rhythm with delta
*/
class HeartBeat extends Component {
	public var beat:Value<Int>;
	public var ticksPerBeat:Int = 32;
	
	private var _current:Float = 0; // seconds
	private var _seconds:Float = 0; // seconds
	private var _beat:Float = 60; // seconds
	
	public function new(beatsPerMinute:Int) {
		_beat /= beatsPerMinute;
		this.beat = new Value<Int>(0);
	}
	
	override public function onUpdate(dt:Float) {
		_current += dt;

		if (_current >= _beat) {
			_current = _current - _beat;
			_seconds += 1;
			new Delay(_current);
			beat._ = Std.int(_seconds) % ticksPerBeat;
		}
	}
}

		