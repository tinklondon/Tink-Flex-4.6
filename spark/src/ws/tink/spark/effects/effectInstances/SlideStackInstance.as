package ws.tink.spark.effects.effectInstances
{
	
	public class SlideStackInstance extends StackEffectInstance
	{
		
		public static const LEFT:String = "left";
		public static const TOP:String = "top";
		public static const BOTTOM:String = "bottom";
		public static const RIGHT:String = "right";
		
		public function SlideStackInstance(target:Object)
		{
			super(target);
		}
		
		private var _fromUpdate:Function;
		private var _toUpdate:Function;
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
			super.initialize();
			
			const d:Array = direction.split( ":" );
			
			_fromUpdate = getUpdateFunction( d[ 0 ], fromUpdateLeft, fromUpdateRight, fromUpdateTop, fromUpdateBottom );
			_toUpdate = getUpdateFunction( d[ d.length - 1 ], toUpdateLeft, toUpdateRight, toUpdateTop, toUpdateBottom );
			
			_fromUpdate( 0 );
			_toUpdate( 0 );
		}
		
		/**
		 *  @private
		 */	
		protected function getUpdateFunction( dir:String, left:Function, right:Function, top:Function, bottom:Function ):Function
		{
			switch( dir )
			{
				case LEFT :
				{
					return left;
				}
				case TOP :
				{
					return top;
				}
				case RIGHT :
				{
					return right;
				}
				case BOTTOM :
				{
					return bottom;
				}
			}
			
			throw new Error( dir + " direction is not supported." );
		}
		
		
		override protected function update( from:Number, to:Number ):void
		{
			super.update( from, to );
			
			_fromUpdate( from );
			_toUpdate( to );
		}
		
		/**
		 *  @private
		 */	
		private function fromUpdateLeft( value:Number ):void
		{
			imageFrom.x = -bitmapFrom.width * value;
		}
		
		/**
		 *  @private
		 */
		private function toUpdateLeft( value:Number ):void
		{
			imageTo.x = bitmapTo.width * ( value - 1 );
		}
		
		/**
		 *  @private
		 */
		private function fromUpdateTop( value:Number ):void
		{
			imageFrom.y = -bitmapFrom.height * value;
		}
		
		/**
		 *  @private
		 */
		private function toUpdateTop( value:Number ):void
		{
			imageTo.y = bitmapTo.height * ( value - 1 );
		}
		
		/**
		 *  @private
		 */
		private function fromUpdateRight( value:Number ):void
		{
			imageFrom.x = bitmapFrom.width * value;
		}
		
		/**
		 *  @private
		 */
		private function toUpdateRight( value:Number ):void
		{
			imageTo.x = bitmapTo.width - ( bitmapTo.width * value );
		}
		
		/**
		 *  @private
		 */
		private function fromUpdateBottom( value:Number ):void
		{
			imageFrom.y = bitmapFrom.height * value;
		}
		
		/**
		 *  @private
		 */
		private function toUpdateBottom( value:Number ):void
		{
			imageTo.y = bitmapTo.height - ( bitmapTo.height * value );
		}
	}
	
	
}