package entities;

import com.haxepunk.HXP;
import com.haxepunk.graphics.Image;

class City extends BaseEntity
{
	private var img:Image;
	
	private static inline var imagePath:String = "graphics/CityBG.png";
	
	public function new(x:Float, y:Float) {
		super(x, y);
		
		img = new Image(imagePath);
		graphic = img;
	}
	
	public override function update() {
		
		if(this.y > HXP.height) {
			HXP.scene.remove(this);
		}
		
		super.update();
	}

}
