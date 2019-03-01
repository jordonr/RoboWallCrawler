package entities;

import com.haxepunk.Entity; 
import com.haxepunk.utils.Input;
import com.haxepunk.graphics.Spritemap;

class Robot extends BaseEntity
{
	private var roboSprite:Spritemap;
	private var side:Int = 1;
	private var jumping:Bool = false;	
	
	private static inline var imagePath:String = "graphics/RobotSprite.png";
	
	public function new(x:Float, y:Float) {
		super(x, y);
		
		roboSprite = new Spritemap(imagePath, 64, 64);
		roboSprite.add("climb", [0,1,2,3], 10);
		roboSprite.add("jump", [4,5,6,7], 10);
		
		graphic = roboSprite;
		setHitboxTo(roboSprite);

		type = "robot";
	}
	
	public override function update() {
		if(Input.mousePressed) {
			jumping = true;
		}
 
		movement();
		
		super.update();
	}

	private function movement()
	{

	 	if(jumping) {
			if(side == 1) {
				roboSprite.flipped = true;
			} else {
				roboSprite.flipped = false;
			}
			
			roboSprite.play("jump");
			
			if(side == 1) {
				jump(396);
			} else {
				jump(20);
			}
			
		} else {
			roboSprite.play("climb");
		}
	}

	private function jump(destX) {
			
		moveTowards(destX, this.y, 5);
		
		if(this.x == destX) {
			jumping = false;
			side = side * (-1);
		}
	}
}
