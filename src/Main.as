package
{
	import org.flixel.*;
	
	import flash.events.Event;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	[SWF(width = "640", height = "480", backgroundColor = "#000000")] //Set the size and color of the Flash file
 
	public class Main extends FlxGame
	{
		public function Main():void
		{
			super(320, 240, PlayState, 2, 60, 60); //Create a new FlxGame object at 320x240 with 2x pixels, then loads PlayState class
		}
	}
}