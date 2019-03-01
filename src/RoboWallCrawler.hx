import com.haxepunk.Engine;
import com.haxepunk.HXP;

class RoboWallCrawler extends Engine
{
	var gameWidth = 480;
	var gameHeight = 800;

	override public function init()
	{
#if debug
		HXP.console.enable();
#end
		//HXP.scene = new scenes.MainScene();
		HXP.scene = new scenes.MenuScene();
	}
	
	override public function new(width:Int=0, height:Int=0, frameRate:Float=60, fixed:Bool=false) {
        super(this.gameWidth, this.gameHeight, frameRate, fixed);
    } 

	public static function main() { new RoboWallCrawler(); }

}
