package entities;

import com.haxepunk.Entity;
import com.haxepunk.utils.Input;
import com.haxepunk.HXP;

class BaseEntity extends Entity
{
	private var _clicked:Bool = false;
	private var _age:Float = 0;
	
	public function new(x:Float, y:Float) {
		super(x, y);
	}
	
	public override function update() {
		_age += HXP.elapsed;
		
		super.update();
	}
	
	private function clickedOn():Bool {
		var pressed = collidePoint(x, y, scene.mouseX, scene.mouseY) && Input.mousePressed;
		if (pressed) {
					return true;
		}
		
		return false;
	}
	
	
}
