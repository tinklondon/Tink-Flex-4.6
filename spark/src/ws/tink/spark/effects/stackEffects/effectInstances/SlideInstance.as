package ws.tink.spark.effects.stackEffects.effectInstances
{

	public class SlideInstance extends StackEffectInstance
	{
		
		public static const LEFT:String = "left";
		
		public function SlideInstance(target:Object)
		{
			super(target);
		}
		
		private var _direction:String;
		public function get direction():String { return _direction; }
		
		public function set direction(value:String):void
		{
			if (_direction == value)
				return;
			_direction = value;
		}
		
		
		override protected function initialize():void
		{
			imageFrom.x = 0;
			imageTo.x = -bitmapTo.width;
		}
		
		override protected function update( value:Number ):void
		{
			super.update( value );
			
			switch( direction )
			{
				case LEFT :
				{
					imageFrom.x = 0 - ( bitmapFrom.width * value );
					imageTo.x = bitmapTo.width * ( value - 1 );
					break;
				}
			}
			
		}
	}
}