package entities;

import com.haxepunk.Scene;
import com.haxepunk.graphics.Image;
import com.haxepunk.HXP;

class Button extends BaseEntity
{
	private var img:Image;
	private var nextScene:Scene;
	
	public function new(x:Float, y:Float, imagePath:String, newScene:Scene) {
		super(x, y);
		
		nextScene = newScene;
		img = new Image(imagePath);
		graphic = img;
		
		setHitboxTo(img);
		
		type = "startLogo";
	}
	
	public override function update() {
		if(clickedOn()) {
			HXP.scene = nextScene;
		}
		
		super.update();
	}
	
}
