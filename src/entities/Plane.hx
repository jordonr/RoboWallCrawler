package entities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Spritemap;
import com.haxepunk.HXP;

class Plane extends BaseEntity
{
	private var bombTimer:Float;
	private var dropRate:Float;
	private var planeColor:String;
	private var planeSpeed:Int;
	private var planeSprite:Spritemap;
	private var side:Int;
	private var startCoords:Map<String,Float>;

	private var planeArray:Array<String> = ['Blue','Red','Green','Yellow'];
		
	private static inline var startDropRate:Float = 20;
	private static inline var imagePath:String = "graphics/planes.png";
	
	public function new(speed:Int = 2, side:Int = 0)
	{
		bombTimer = 0;
		dropRate = startDropRate;
		planeSpeed = speed;
		startCoords = new Map();
		
		this.side = side;
		
		planeSprite = new Spritemap(imagePath,89,73);
		
		graphic = planeSprite;
		setHitboxTo(planeSprite);
		
		setupPlane();
		
		super(startCoords['x'], startCoords['y']);
		
		type = "plane";
	}
	
	public override function update() {
		planeSprite.play("fly");
		
		move();
		
		dropBomb();
		
		super.update();
	}
	
	private function move()
	{
		if((x < (-100)) || (x > (HXP.width + 100)) ) {
			scene.remove(this);
		} 
		
		if(side == 1) {
			moveBy(planeSpeed,0);
		} else {
			moveBy((-1 * planeSpeed),0);
		}
		
	}
	
	private function setupPlane()
	{
		planeColor = HXP.choose(planeArray);
		
		switch(planeColor) {
			case 'Blue':
				planeSprite.add("fly",[0,2,10],10);
			case 'Red':
				planeSprite.add("fly",[1,9,11],10);
			case 'Green':
				planeSprite.add("fly",[3,5,7],10);
			case 'Yellow':
				planeSprite.add("fly",[4,6,8],10);
			default:
				planeSprite.add("fly",[0,2,10],10);
		}
		
		if(side == 1) {
			startCoords = ['x' => (0 - planeSprite.width), 'y' => 100];
		} else {
			planeSprite.flipped = true;
			startCoords = ['x' => (HXP.width + planeSprite.width), 'y' => 100];
		}
	}
	
	private function dropBomb()
	{
		var odds:Float = HXP.rand(1000) - HXP.round((scenes.MainScene._distance / 100),0);
		
		if((odds < dropRate) && (this.x > 0 || this.x < HXP.width) && (bombTimer <= 0)) {
			scene.add(new Bomb(centerX,centerY,side));
			bombTimer = 1;
		}
		
		bombTimer = bombTimer - HXP.elapsed;
	}
}
