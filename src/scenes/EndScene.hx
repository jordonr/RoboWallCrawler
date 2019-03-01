package scenes;

import com.haxepunk.Scene;
import com.haxepunk.HXP;
import com.haxepunk.graphics.Backdrop;
import com.haxepunk.graphics.Text;

import utils.Defs;
import utils.HighScore;
import entities.Button;

class EndScene extends Scene
{
	private var background:Backdrop;
	private var leftWall:Backdrop;
	private var rightWall:Backdrop;
	private var menuWindow:Backdrop;
	
	private var distanceText:Text;
	private var highscoreText:Text;
	private var scoreText:Text;
	
	private var startButton:Button;
	private var highScoreButton:Button;
	
	private var userScore:Float;
	private var userDistance:Float;

	public function new() {
		super();
		
		userScore = scenes.MainScene.getScore();
		userDistance = scenes.MainScene.getDistance();
		
		background = new Backdrop(Defs.bgPath);
		leftWall = new Backdrop(Defs.leftWallPath);
		rightWall = new Backdrop(Defs.rightWallPath);
		menuWindow = new Backdrop(Defs.menuPath);
		
		highscoreText = new Text("NEW HIGH SCORE!", {color: 0xFF0000, font: Defs.computerFont, size: 58});
		scoreText = new Text("Score: " + userScore, {font: Defs.computerFont, size: 64});
		distanceText = new Text("Distance: " + userDistance, {font: Defs.computerFont, size: 48});
		
		startButton = new entities.Button(0,0,"graphics/buttonStart.png", new scenes.MainScene());
		highScoreButton = new entities.Button(0,0,"graphics/buttonHighScore.png", new scenes.HighscoreScene());
	}

	public override function begin()
	{
		var scores = new utils.HighScore();
		scores.setNewScore([userScore,userDistance,DateTools.format(Date.now(), '%F')]);
		
		addGraphic(background);
		
		addGraphic(leftWall);
		addGraphic(rightWall);
		addGraphic(menuWindow);
	
		if(scores.isHighScore()) {
			addGraphic(highscoreText,-1,HXP.halfWidth - highscoreText.width/2,100);
		}

		addGraphic(scoreText,-1,HXP.halfWidth - scoreText.width/2,200);
		addGraphic(distanceText,-1,HXP.halfWidth - distanceText.width/2,300);
		
		startButton.x = HXP.halfWidth - startButton.halfWidth;
		startButton.y = HXP.halfHeight;
		add(startButton);
		
		highScoreButton.x = HXP.halfWidth - highScoreButton.halfWidth;
		highScoreButton.y = HXP.halfHeight + 100;
		add(highScoreButton);
	}
	
}
