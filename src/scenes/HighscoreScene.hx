package scenes;

import com.haxepunk.Scene;
import com.haxepunk.HXP;
import com.haxepunk.graphics.Backdrop;
import com.haxepunk.graphics.Text;

import utils.Defs;
import utils.HighScore;
import entities.Button;

class HighscoreScene extends Scene
{
	private var background:Backdrop;
	private var leftWall:Backdrop;
	private var rightWall:Backdrop;
	private var menuWindow:Backdrop;
	
	public var highScores:Array<Array<Dynamic>>;
	
	private var startButton:Button;
	
	public function new() {
		super();
		
		background = new Backdrop(Defs.bgPath);
		leftWall = new Backdrop(Defs.leftWallPath);
		rightWall = new Backdrop(Defs.rightWallPath);
		menuWindow = new Backdrop(Defs.menuPath);
		
		startButton = new entities.Button(0,0,"graphics/buttonStart.png", new scenes.MainScene());
		
		var hs = new HighScore();
		highScores = hs.getHighScores();
	}

	public override function begin()
	{
		addGraphic(background);
		addGraphic(leftWall);
		addGraphic(rightWall);
		addGraphic(menuWindow);
		
		displayHighScores();
		
		startButton.x = HXP.halfWidth - startButton.halfWidth;
		startButton.y = HXP.height - 100;
		add(startButton);
	}
	
	private function displayHighScores()
	{
		var scores = new HighScore();
		var displayScores:Array<Dynamic> = scores.getHighScores();
		
		var t = new Text("SCORE DISTANCE DATE", {font: Defs.computerFont, size: 36});
		addGraphic(t,-1,HXP.halfWidth - t.width/2, 100);
		
		for(i in 0...displayScores.length) {
			t = new Text(displayScores[i][0] + " " + displayScores[i][1] + " " + displayScores[i][2], {font: Defs.computerFont, size: 32});
			if(i%2 == 0) { t.color = 0xADD8E6; }
			
			addGraphic(t,-1,HXP.halfWidth - t.width/2, 150 + (50 * i));
		}
	}
	
}
