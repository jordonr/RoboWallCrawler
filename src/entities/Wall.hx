package entities;

import com.haxepunk.graphics.Image;

class Wall extends BaseEntity
{
	private var img:Image;
	
	public function new(x:Float, y:Float, imagePath:String) {
		super(x, y);
		
		img = new Image(imagePath);
		graphic = img;
		
		setHitboxTo(img);
		
		type = "Wall";
	}
	
	public override function update() {
		super.update();
	}

}
