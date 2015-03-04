package urgame;

import flambe.Component;
import flambe.display.Sprite;
import flambe.System;
import flambe.Entity;

import hxcollision.shapes.Circle;


class Collision extends Component {
	private var _child:Component;

	public function new() {
	}

	override public function onAdded () {
		_child = owner.firstComponent;
	}
	
	override public function onUpdate(dt:Float) {
		while (_child != null) {
		var next = _child.next; 



		_child = next;
		}
	}
}