package net.darkglass.FlxFrob
{
	import org.flixel.FlxBasic;
	import org.flixel.FlxG;

	CONFIG::debug
	{
		import net.darkglass.sacchar.FlxProfiler;
	}
	
	/**
	 * <p>Class that helps with tweaking variables during creation of game.</p>
	 * 
	 * <p>Extracted from sacchar, 5 December 2013</p>
	 * 
	 * @author greysondn
	 */
	public class FlxTweak extends FlxBasic 
	{
		/** whether or not tweaking is enabled via this object */
		public var enabled:Boolean;
		
		/** array of tweakable adjustment entries */
		public var tweakNodes:Vector.<_Node>;
		
		/**
		 * <p>Debug function - allows Zynathias to edit and test configurations
		 * without needing a recompile.</p>
		 *
		 * <p>Slightly more complicated... Whenever the _character is pressed,
		 * _object._var gets adjusted via key combinations using the number
		 * keys. This allows him to plug in and modify it himself after hooks
		 * are inserted. It may have broader use. I dunno.</p>
		 *
		 * @param	node	node containing object's modification data
		 *
		 * @since Sacchar b5r1
		 */
		private function doAdjustmentsNumber(node:_Node):void
		{
			CONFIG::debug
			{
				FlxProfiler.enter("FlxTweak:doAdjustmentsNumber()");
			}
			
			if (FlxG.keys.pressed(node.character))
			{
				if (FlxG.keys.justPressed("ONE"))
				{
					node.object[node.variable] -= 10;
				}
				else if (FlxG.keys.justPressed("TWO"))
				{
					node.object[node.variable] -= 1;
				}
				else if (FlxG.keys.justPressed("THREE"))
				{
					node.object[node.variable] -= 0.1;
				}
				else if (FlxG.keys.justPressed("FOUR"))
				{
					node.object[node.variable] -= 0.01;
				}
				else if (FlxG.keys.justPressed("FIVE"))
				{
					node.object[node.variable] += 0.01;
				}
				else if (FlxG.keys.justPressed("SIX"))
				{
					node.object[node.variable] += 0.1;
				}
				else if (FlxG.keys.justPressed("SEVEN"))
				{
					node.object[node.variable] += 1;
				}
				else if (FlxG.keys.justPressed("EIGHT"))
				{
					node.object[node.variable] += 10;
				}
			}
			
			CONFIG::debug
			{
				FlxProfiler.exit();
			}
			
		}
		
		public function FlxTweak() 
		{
			CONFIG::debug
			{
				FlxProfiler.enter("FlxTweak:*constructor");
			}
			
			super();
			
			// enable
			enabled = true;
			
			// init our vector
			tweakNodes = new Vector.<_Node>();
			
			CONFIG::debug
			{
				FlxProfiler.exit();
			}
		}
		
		override public function update():void 
		{
			CONFIG::debug
			{
				FlxProfiler.enter("FlxTweak:update()");
			}
			
			// parent first
			super.update();

			// iterate through the tweaknodes and do adjustments on each one
			for (var i:int = 0; i < tweakNodes.length; ++i)
			{
				doAdjustmentsNumber(tweakNodes[i]);
			}
			
			
			CONFIG::debug
			{
				FlxProfiler.exit();
			}
		}
		
		/**
		 * <p>Adds a new node to the tweak listing.</p>
		 * 
		 * @param	character	Character to use to adjust variable
		 * @param	object		Object to which the variable belongs
		 * @param	variable	Variable to enable tweaking upon
		 * @param	name		If not null, adds to flx debugger watchlist with name
		 */
		public function add(character:String, object:Object, variable:String, name:String = null):void
		{
			
			CONFIG::debug
			{
				FlxProfiler.enter("FlxTweak:add()");
			}
			
			// create a new node from the given entries
			var swap:_Node = new _Node(character, object, variable);
			
			// add to end of vector
			tweakNodes.push(swap);
			
			// if we need to add to watchlist...
			if (null != name)
			{
				FlxG.watch(object, variable, (character + ": " + name));
			}
			
			CONFIG::debug
			{
				FlxProfiler.exit();
			}
			
		}
	}
}

/**
 * Internal class, a single node for the tweaks.
 * In another language, this would be a simple struct.
 */
class _Node
{
	CONFIG::debug
	{
		import net.darkglass.sacchar.FlxProfiler;
	}
	
	/**
	 * <p>Character used to adjust variable.</p>
	 */
	public var character:String;
	
	/**
	 * <p>Object variable is in</p>
	 */
	public var object:Object;
	
	/**
	 * <p>Variable to adjust, in string format</p>
	 */
	public var variable:String;

	/**
	 * <p>Dead simple constructor. If I could, I'd use a struct here.</p>
	 * 
	 * @param	c	Character for variable adjustments
	 * @param	o	Object variable is a member of
	 * @param	v	Variable to adjust, in string format
	 * @param	n	public name for object in watchlist; null means not to watch
	 */
	public function _Node(c:String, o:Object, v:String)
	{
		
		CONFIG::debug
		{
			FlxProfiler.enter("FlxTweak:_Node:*constructor");
		}
		
		character = c;
		object    = o;
		variable  = v;
		
		CONFIG::debug
		{
			FlxProfiler.exit();
		}
	}
}
