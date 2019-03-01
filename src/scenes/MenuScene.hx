package scenes;

import com.haxepunk.Scene;
import com.haxepunk.HXP;
import com.haxepunk.graphics.Backdrop;
import com.haxepunk.graphics.Image;
import com.haxepunk.graphics.Text;

import utils.Defs;
import entities.City;
import entities.Button;

class MenuScene extends Scene
{
	private var background:Backdrop;
	private var leftWall:Backdrop;
	private var rightWall:Backdrop;
	private var menuWindow:Backdrop;
	
	private var cityBg:City;
	private var startButton:Button;
	private var highScoreButton:Button;
	
	public function new() {
		super();
		
		background = new Backdrop(Defs.bgPath);
		cityBg = new entities.City(0,0);
		leftWall = new Backdrop(Defs.leftWallPath);
		rightWall = new Backdrop(Defs.rightWallPath);
		menuWindow = new Backdrop(Defs.menuPath);
		
		startButton = new entities.Button(0,0,"graphics/buttonStart.png", new scenes.MainScene());
		highScoreButton = new entities.Button(0,0,"graphics/buttonHighScore.png", new scenes.HighscoreScene());
	}

	public override function begin()
	{
		addGraphic(background);
		add(cityBg);
		
		addGraphic(leftWall);
		addGraphic(rightWall);
		addGraphic(menuWindow);
		
		startButton.x = HXP.halfWidth - startButton.halfWidth;
		startButton.y = HXP.halfHeight - 100;
		add(startButton);
		
		highScoreButton.x = HXP.halfWidth - highScoreButton.halfWidth;
		highScoreButton.y = HXP.halfHeight;
		add(highScoreButton);
	}
}
