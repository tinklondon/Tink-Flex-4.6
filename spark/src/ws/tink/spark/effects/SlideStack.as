package ws.tink.spark.effects
{
	import flash.display.BitmapData;
	
	import mx.effects.IEffectInstance;
	
	import ws.tink.spark.effects.effectInstances.SlideStackInstance;
	
	public class SlideStack extends StackEffect
	{
		public function SlideStack()
		{
			super();
			
			instanceClass = SlideStackInstance;
		}
		
		
		//----------------------------------
		//  direction
		//----------------------------------
		
		/**
		 *  @private
		 *  Storage for the direction property.
		 */
		private var _direction:String = "left";
		
		[Inspectable(category="General", 
			enumeration="bottom,left,right,top,bottom:left,bottom:right,bottom:top,left:bottom,left:right,left:top,right:bottom,right:left,right:top,top:bottom,top:left,top:right", defaultValue="left")]
		/**
		 *  
		 *
		 *  @default "left"
		 *  
		 *  @langversion 3.0
		 *  @playerversion Flash 10
		 *  @playerversion AIR 1.5
		 *  @productversion Flex 4
		 */
		public function get direction():String
		{
			return _direction;
		}
		
		/**
		 *  @private
		 */
		public function set direction( value:String ):void
		{
			if( value == _direction ) return;     
			
			_direction = value; 
		}
		
		
		
		override protected function initInstance(instance:IEffectInstance):void
		{
			super.initInstance( instance );
			const s:SlideStackInstance = instance as SlideStackInstance;
			s.direction = direction;
		}
		
	}
}