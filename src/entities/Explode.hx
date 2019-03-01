package entities;

import com.haxepunk.HXP;
import com.haxepunk.graphics.Spritemap;

class Explode extends BaseEntity
{
	private var explodeSprite:Spritemap;
	
	private static inline var imagePath:String = "graphics/explosion.png";
	
	public function new(x:Float, y:Float)
	{
		super(x, y);
		
		explodeSprite = new Spritemap(imagePath,64,64,
			function() { 
				scene.remove(this); 
				HXP.scene = new scenes.EndScene();
			});
		explodeSprite.add("explode",[0,1,2,3,4],10);
		
		graphic = explodeSprite;
		setHitboxTo(explodeSprite);
		
		type = "explosion";
	}
	
	public override function update()
	{
		explodeSprite.play("explode");		
		super.update();
	}

}
