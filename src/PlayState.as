package
{
	import flash.display.StageScaleMode;
	
	import org.flixel.*;
 
	public class PlayState extends FlxState
	{	
		//---------------------------------------CURRENT OBJECTIVES------------------------------------------
		//------------------------------------------DECLARATIONS---------------------------------------------
		private static var TIME_CONSTANT:int = 1;
		[Embed(source = "../data/backgroundsprites.png")] private var BG:Class; //the background sprites
		public var bgImage:FlxSprite; //background object
		
		public var sevenToggle:Boolean = false;
		public var strToggle:Boolean = false;
		public var agiToggle:Boolean = false;
		public var intToggle:Boolean = false;
		public var atkToggle:Boolean = false;
		public var defToggle:Boolean = false;
		public var spdToggle:Boolean = false;
		public var searchOrder:Array = new Array();
		//----------------------------------------CREATE FUNCTION--------------------------------------------
		override public function create():void
		{
			FlxG.mouse.show();
			FlxG.stage.scaleMode = StageScaleMode.SHOW_ALL; // scale the stage to the window size, but preserve aspect ratio.
			FlxG.stage.align = ""; // align the stage to the absolute center.
			
			FlxG.bgColor = 0x000000ff; //change bgcolour
			
			bgImage = new FlxSprite(0, 0);
			bgImage.loadGraphic(BG, false, false);
			
			Registry.items = new ItemManager();
			Registry.hud = new HUD();
			
			add(bgImage);
			add(Registry.hud);
			add(Registry.items);
		}
		
		override public function update():void //update function
		{
			//input logic, dictates which key toggles what filter
			if (FlxG.keys.ONE && !strToggle)
			{
				strToggle = true;
				searchOrder.push(1);
				Registry.items.reorder(searchOrder);
			}
			else if (FlxG.keys.TWO && !agiToggle)
			{
				agiToggle = true;
				searchOrder.push(2);
				Registry.items.reorder(searchOrder);
			}
			else if (FlxG.keys.THREE && !intToggle)
			{
				intToggle = true;
				searchOrder.push(3);
				Registry.items.reorder(searchOrder);
			}
			else if (FlxG.keys.FOUR && !atkToggle)
			{
				atkToggle = true;
				searchOrder.push(4);
				Registry.items.reorder(searchOrder);
			}
			else if (FlxG.keys.FIVE && !defToggle)
			{
				defToggle = true;
				searchOrder.push(5);
				Registry.items.reorder(searchOrder);
			}
			else if (FlxG.keys.SIX && !spdToggle)
			{
				spdToggle = true;
				searchOrder.push(6);
				Registry.items.reorder(searchOrder);
			}
			else if (!sevenToggle && FlxG.keys.SEVEN && searchOrder.length > 0)
			{
				sevenToggle = true;
				switch(searchOrder.pop())
				{
					case 1: strToggle = false; break;
					case 2: agiToggle = false; break;
					case 3: intToggle = false; break;
					case 4: atkToggle = false; break;
					case 5: defToggle = false; break;
					case 6: spdToggle = false; break;
					default: break;
				}
				Registry.items.reorder(searchOrder);
			}
			
			if (!FlxG.keys.SEVEN && sevenToggle) sevenToggle = false;
			
			Registry.hud.updateFilterText(searchOrder);
			
			super.update();			
			if (FlxG.keys.justPressed("B")) FlxG.visualDebug = !FlxG.visualDebug; //bounding box debug
		}
		
	}
}