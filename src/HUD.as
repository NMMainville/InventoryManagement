package
{
	import org.flixel.*;
 
	public class HUD extends FlxGroup
	{	
		//------------------------------------------DECLARATIONS---------------------------------------------
		//TODO: Add functions to change data instead of calling from playstate
		private var itemText:FlxText = new FlxText(2 * 16, 2 * 16, 6 * 16, "Mouse over an item to view its description");
		private var instructions:FlxText = new FlxText(2 * 16, 9 * 16, 6 * 16, "Press numbers 1 through 6 to sort in terms of a specific attribute. Press 7 to remove the last paramater.");
		private var filterText:FlxText = new FlxText(2 * 16, 7 * 16, 6 * 16, "Current filters:\nnull");
		//----------------------------------------CREATE FUNCTION--------------------------------------------
		public function HUD():void //X and Y define starting position of the player
		{
			super();
			
			add(itemText);
			add(instructions);
			add(filterText);
		}
		
		override public function update():void //update function
		{
			super.update();
		}
		
		public function updateFilterText(i:Array):void
		{
			filterText.text = "Current filters:\n" + String(i);
		}
		
		public function viewAttributes(i:Item):void
		{
			itemText.text = "Item #" + i.identifier +
							"\n1.STR:\t" + i.strength +
							"\n2.AGI:\t" + i.agility +
							"\n3.INT:\t" + i.intelligence +
							"\n4.ATK:\t" + i.attack +
							"\n5.DEF:\t" + i.defense +
							"\n6.SPD:\t" + i.moveSpeed;
		}
	}
}