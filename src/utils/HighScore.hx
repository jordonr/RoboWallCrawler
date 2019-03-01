package utils;

import haxe.Serializer;
import haxe.Unserializer;

import com.haxepunk.utils.Data;

import utils.Defs;

class HighScore
{
	private var defaultScores:String;
	
	private var highScores:Array<Array<Dynamic>>;
	private var recentScore:Array<Dynamic>;
	
	private static inline var dataKey:String = 'scores';
	
	public function new()
	{
		setupDefaultScores();
		setupHighScores();
	}
	
	private function setupDefaultScores()
	{
		var serializer = new Serializer();
		//Score is place, score, distance, time
		serializer.serialize([
			[1000,100,'2014-08-06'],
			[900,100,'2014-08-06'],
			[800,100,'2014-08-06'],
			[700,100,'2014-08-06'],
			[600,100,'2014-08-06'],
			[500,100,'2014-08-06'],
			[400,100,'2014-08-06'],
			[300,100,'2014-08-06'],
			[200,100,'2014-08-06'],
			[100,100,'2014-08-06']
		]);
		
		defaultScores = serializer.toString();
	}
	
	private function setupHighScores()
	{
		Data.load(Defs.scorePath);
		
		var scores = Data.read(dataKey,defaultScores);
		
		var unserializer = new Unserializer(scores);
		highScores = unserializer.unserialize();
		
	}
	
	public function getDefaultScores()
	{
		return defaultScores;
	} 
	
	public function getHighScores()
	{
		return highScores;
	}
	
	public function setNewScore(newScore:Array<Dynamic>)
	{
		recentScore = newScore;
		highScores.unshift(newScore);
		sortScores();
		saveScores();
	}
	
	public function isHighScore():Bool
	{
		if(recentScore == highScores[0]) {
			return true;
		}
		
		return false;
	}
	
	private function sortScores()
	{
		highScores.sort(function(x,y):Int {
			if(x[0] > y[0]) {
				return -1;
			} else if(x[0] < y[0]) {
				return 1;
			} else if(x[0] == y[0]) {
				if(x[1] > y[1]) {
					return -1;
				} else if(x[1] < y[1]) {
					return 1;
				}
			} 
			return 0;
		});
		
		highScores = highScores.splice(0,10);
	}
	
	private function saveScores()
	{
		
		var serializer = new Serializer();
		serializer.serialize(highScores);
		
		Data.write(dataKey,serializer.toString());
		Data.save(Defs.scorePath);
	}
}
