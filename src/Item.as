package
{
	import org.flixel.*;
 
	public class Item extends FlxSprite
	{	
		//------------------------------------------DECLARATIONS---------------------------------------------
		[Embed(source = "../data/itemsprites.png")] public var itemSprites:Class; //item sprites
		public var strength:int = 0;
		public var agility:int = 0;
		public var intelligence:int = 0;
		public var attack:int = 0;
		public var moveSpeed:int = 0;
		public var defense:int = 0;
		public var identifier:int = 0; //Official "number" of the item, used for default sorting
		//----------------------------------------CREATE FUNCTION--------------------------------------------
		public function Item(X: int, Y: int, i:int):void //X and Y define starting position of the item
		{
			super(X, Y); //starting position
			//Load graphics
			loadGraphic(itemSprites, true, false, 16, 16, false);
			
			maxVelocity.x = 0; //maximum speed in the x direction
			maxVelocity.y = 0; //maximum speed in the y direction
			
			//Animations
			addAnimation("0", [0]);
			addAnimation("1", [1]);
			addAnimation("2", [2]);
			addAnimation("3", [3]);
			addAnimation("4", [4]);
			addAnimation("5", [5]);
			addAnimation("6", [6]);
			addAnimation("7", [7]);
			
			identifier = i;
			
			reRoll();
		}
		
		override public function update():void //update function
		{
			//------------------------------------------ANIMATIONS-----------------------------------------------
			//-------------------------------------------MOVEMENT------------------------------------------------
			if (FlxG.mouse.x > x && FlxG.mouse.x < x + width && FlxG.mouse.y > y && FlxG.mouse.y < y + width && visible)
			{
				alpha = 0.5;
				Registry.hud.viewAttributes(this);
			}
			else alpha = 1;
			
			
			super.update();
		}
		
		public function reRoll():void
		{
			agility = Math.floor(Math.random() * 11);
			strength = Math.floor(Math.random() * 11);
			intelligence = Math.floor(Math.random() * 11);
			attack = Math.floor(Math.random() * 11);
			moveSpeed = Math.floor(Math.random() * 11);
			defense = Math.floor(Math.random() * 11);
			play(String(Math.floor((Math.random() * 8) - 1)));
		}
	}
}