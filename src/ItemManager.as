package
{
	import org.flixel.*;

	public class ItemManager extends FlxGroup
	{
		public var placeHolder:Object = new Object;
		
		public function ItemManager()
		{
			super();
			//	There are 104 items in our pool
			for (var i:int = 0; i < 104; i++)
			{
				add(new Item(-100, -100, i));
			}
			rearrange();
		}
		
		
		public function rearrange():void
		{
			for (var i:int = 0; i < members.length; i++)
			{
				if (Item(members[i]))
				{
					Item(members[i]).x = ((i % 8) + 11) * 16;
					Item(members[i]).y = (Math.floor(i/8) + 1) * 16;
				}
			}
		}
		
		public function reorder(i:Array):void
		{
			
			if (i.length == 0)
			{
				for (var k:int = 0; k < members.length; k++) //sort according to identifier
				{
					for (var l:int = 0; l < members.length; l++)
					{
						if (Item(members[l]) && Item(members[l+1]) && Item(members[l]).identifier > Item(members[l+1]).identifier)
						{
							placeHolder = members[l];
							members[l] = members[l + 1];
							members[l + 1] = placeHolder;
						}
						
						if (Item(members[l])) Item(members[l]).visible = true;
					}
				}
			}
			else
			{
				//for (var j:int = 0; j < i.length; j++) //loop through array
				//{
					for (var m:int = 0; m < members.length; m++) //sort according to priority
					{
						for (var n:int = 0; n < members.length; n++)
						{
							
							switch(i[0]) //tier 1 sort
							{
								case 1: //strength
								if (Item(members[n]) && Item(members[n+1]) && Item(members[n]).strength < Item(members[n+1]).strength)
								{
									placeHolder = members[n];
									members[n] = members[n + 1];
									members[n + 1] = placeHolder;
								}
								break;
								
								case 2: //agility
								if (Item(members[n]) && Item(members[n+1]) && Item(members[n]).agility < Item(members[n+1]).agility)
								{
									placeHolder = members[n];
									members[n] = members[n + 1];
									members[n + 1] = placeHolder;
								}
								break;
								
								case 3: //intelligence
								if (Item(members[n]) && Item(members[n+1]) && Item(members[n]).intelligence < Item(members[n+1]).intelligence)
								{
									placeHolder = members[n];
									members[n] = members[n + 1];
									members[n + 1] = placeHolder;
								}
								break;
								
								case 4: //attack
								if (Item(members[n]) && Item(members[n+1]) && Item(members[n]).attack < Item(members[n+1]).attack)
								{
									placeHolder = members[n];
									members[n] = members[n + 1];
									members[n + 1] = placeHolder;
								}
								break;
								
								case 5: //defense
								if (Item(members[n]) && Item(members[n+1]) && Item(members[n]).defense < Item(members[n+1]).defense)
								{
									placeHolder = members[n];
									members[n] = members[n + 1];
									members[n + 1] = placeHolder;
								}
								break;
								
								case 6: //speed
								if (Item(members[n]) && Item(members[n+1]) && Item(members[n]).moveSpeed < Item(members[n+1]).moveSpeed)
								{
									placeHolder = members[n];
									members[n] = members[n + 1];
									members[n + 1] = placeHolder;
								}
								break;
								
								default: break;
							}
						}
					}
				//}
			}
			rearrange();
		}
	}
}