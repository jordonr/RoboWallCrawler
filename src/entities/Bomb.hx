package entities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Spritemap;
import com.haxepunk.HXP;
import com.haxepunk.Sfx;

class Bomb extends BaseEntity
{
	private var bombArray:Array<String> = ['Blue','Black','Green','Yellow'];
	private var bombColor:String;
	private var bombSound:Sfx;
	private var bombSpeed:Int;
	private var bombSprite:Spritemap;
	
	private var side:Int;
	private var xMove:Int;
	
	private static inline var imagePath:String = "graphics/bombs.png";
    #if flash
	private static inline var soundPath:String = "audio/bomb.mp3";
    #else
	private static inline var soundPath:String = "audio/bomb.ogg";
    #end
	
	public function new(x:Float, y:Float, side:Int = 0) {
		super(x,y);
		
		this.side = side;
		
		bombSprite = new Spritemap(imagePath,16,32);
		
		graphic = bombSprite;
		setHitboxTo(bombSprite);
		
		setupBomb();
		
		bombSound = new Sfx(soundPath);
		
		type = "bomb";
	}
	
	public override function update() {
		bombSprite.play("fly");
		
		move();
		
		super.update();
	}
	
	private function move()
	{
		if(this.y > HXP.height) {
			HXP.scene.remove(this);
		}
		
		var collobj:Entity = collide("robot", this.x, this.y);
		if(collobj != null)
		{
			bombSound.play();
			HXP.scene.remove(this);
			scene.add(new Explode(collobj.x, collobj.y));
			HXP.scene.remove(collobj);
		}
		
		if(side == 1) {
			moveBy(xMove,bombSpeed);
		} else {
			moveBy((-1 * xMove),bombSpeed);
		}
		
	}
	
	private function setupBomb()
	{
		bombColor = HXP.choose(bombArray);
		
		switch(bombColor) {
			case 'Blue':
				bombSprite.add("fly",[0,1,2,3],10);
				bombSpeed = 4;
				xMove = 1;
			case 'Black':
				bombSprite.add("fly",[4,5,6,7],10);
				bombSpeed = 4;
				xMove = 0;
			case 'Green':
				bombSprite.add("fly",[8,9,10,11],10);
				bombSpeed = 5;
				xMove = 0;
			case 'Yellow':
				bombSprite.add("fly",[12,13,14,15],10);
				bombSpeed = 4;
				xMove = 2;
			default:
				bombSprite.add("fly",[12,13,14,15],10);
		}
		
	}
}
