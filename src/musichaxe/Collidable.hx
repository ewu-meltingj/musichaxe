package musichaxe;

import flambe.Component;
import flambe.System;
import flambe.Entity;
import flambe.display.Sprite;
import hxcollision.shapes.Polygon;
import hxcollision.Collision;


class Collidable extends Component {
	private var _ctx:Context;
	private var _sprite :Sprite;
	public var polygon :Polygon;


	public function new(ctx:Context) {
		_ctx = ctx;
	}

	override public function onAdded() {
		_sprite = owner.get(Sprite);
		polygon = Polygon.rectangle( _sprite.x._, _sprite.y._, _sprite.getNaturalWidth(), _sprite.getNaturalHeight());
	}

	public function Collides(entity:Entity) {
		var collision = entity.get(Collidable);
		var poly = collision.polygon;
		Collision.test(polygon, poly);
	}
}