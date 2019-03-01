package entities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Spritemap;
import com.haxepunk.HXP;
import com.haxepunk.Sfx;


class Coin extends BaseEntity
{
	private var coinSound:Sfx;
	private var coinSpeed:Int;
	private var coinSprite:Spritemap;
	private var value:Int;
	
	private static inline var imagePath:String = "graphics/coins.png";
    #if flash
	private static inline var soundPath:String = "audio/coin7.mp3";
    #else
	private static inline var soundPath:String = "audio/coin7.wav";
    #end
	
	public function new(x:Float, y:Float, speed:Int = 4) {
		super(x, y);
		
		coinSpeed = speed;
		
		coinSprite = new Spritemap(imagePath,40,42);
		coinSprite.add("rotate",[0,1,2,3],10);
		
		graphic = coinSprite;
		setHitboxTo(coinSprite);
		
		value = 100;
		coinSound = new Sfx(soundPath);
		
		type = "coin";
	}
	
	public override function update() {
		coinSprite.play("rotate");
		
		if(this.y > HXP.height) {
			HXP.scene.remove(this);
			scenes.MainScene.addToScore(value/2 * -1);
		}
		
		var collobj:Entity = collide("robot", this.x, this.y);
		if(collobj != null)
		{
			coinSound.play();
			scenes.MainScene.addToScore(value);
			HXP.scene.remove(this);
		}
		
		moveBy(0,coinSpeed);
		
		super.update();
	}
}
