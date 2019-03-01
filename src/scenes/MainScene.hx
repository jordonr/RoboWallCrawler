package scenes;

import com.haxepunk.Scene;
import com.haxepunk.HXP;
import com.haxepunk.graphics.Backdrop;
import com.haxepunk.graphics.Image;
import com.haxepunk.graphics.Text;

import utils.Defs;
import entities.City;
import entities.Robot;

class MainScene extends Scene
{
	private var background:Backdrop;
	private var leftWall:Backdrop;
	private var rightWall:Backdrop;
	
	private var cityBg:City;
	private var robot:Robot;
	
	private var coinTimer:Float;
	private var planeTimer:Float;
	private var scrollSpeed:Float;
	
	private var distanceBoard:Text;
	private var scoreBoard:Text;
	
	public static var _distance:Float;
	public static var _score:Float;
	
	private static inline var fontSize:Int = 24;
	
	public function new() {
		super();
		
		background = new Backdrop(Defs.bgPath);
		cityBg = new entities.City(0,0);
		leftWall = new Backdrop(Defs.leftWallPath);
		rightWall = new Backdrop(Defs.rightWallPath);
		
		coinTimer = 0;
		planeTimer = 0;
		scrollSpeed = 240;
		_score = 0;
		_distance = 0;
		
		distanceBoard = new Text("Distance: " + _distance);
		distanceBoard.font = Defs.computerFont;
		distanceBoard.size = fontSize;
		scoreBoard = new Text("Score: " + _score);
		scoreBoard.font = Defs.computerFont;
		scoreBoard.size = fontSize;
		
		robot = new entities.Robot(20,550);
	}

	public override function begin()
	{
		addGraphic(background);
		add(cityBg);
		
		addGraphic(leftWall);
		addGraphic(rightWall);
		
		addGraphic(new Image(Defs.hudPath),-1,0,740);
		addGraphic(scoreBoard,-1,20,755);
		addGraphic(distanceBoard,-1,HXP.width - (distanceBoard.width * 2) + 20,755);
		
		add(robot);
	}
	
	public override function update()
	{
		spawnCoin();
		spawnPlane();
		
		background.y = background.y + (scrollSpeed / 4 * HXP.elapsed);
		
		cityBg.y = cityBg.y + (scrollSpeed / 10 * HXP.elapsed);
		
		leftWall.y = leftWall.y + (scrollSpeed * HXP.elapsed);
		rightWall.y = rightWall.y + (scrollSpeed * HXP.elapsed);
		
		distanceBoard.text = "Distance: " + HXP.round(_distance,2);
		scoreBoard.text = "Score: " + _score;
		
		_distance += HXP.elapsed;
		
		super.update();
	}
	
	private function spawnCoin()
	{
		if(coinTimer > Defs.coinSpawnTime) {
			add(new entities.Coin(HXP.rand(400)+20,-40));
			coinTimer = 0;
		}
		
		coinTimer = coinTimer + HXP.elapsed;
	}
	
	private function spawnPlane()
	{
		if(planeTimer > Defs.planeSpawnTime) {
			add(new entities.Plane(4, HXP.rand(2)));
			planeTimer = 0;
		}
		
		planeTimer = planeTimer + HXP.elapsed;
	}
	
	public static function addToScore(v:Float) {
		_score += v;
	}
	
	public static function getScore():Float {
		return _score;
	}

	public static function getDistance():Float {
		return HXP.round(_distance,2);
	}	
}
