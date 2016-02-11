package ws.tink.spark.effects
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.events.EventDispatcher;
	
	import mx.effects.Effect;
	import mx.effects.IEffectInstance;
	import mx.events.EffectEvent;
	
	import spark.components.Group;
	
	import ws.tink.spark.effects.effectInstances.StackEffectInstance;
	
	
	public class StackEffect extends Effect
	{
		
		private var _instance:StackEffectInstance;
		
		
		
		public function StackEffect()
		{
			super();
		}
		
		private var _bitmapFrom:BitmapData;
		public function get bitmapFrom():BitmapData { return _bitmapFrom; }
		
		public function set bitmapFrom(value:BitmapData):void
		{
			if (_bitmapFrom == value)
				return;
			_bitmapFrom = value;
		}
		
		private var _bitmapTo:BitmapData;
		public function get bitmapTo():BitmapData { return _bitmapTo; }
		
		public function set bitmapTo(value:BitmapData):void
		{
			if (_bitmapTo == value)
				return;
			_bitmapTo = value;
		}
		
		
		private var _display:Group;
		public function get display():Group { return _display; }
		
		public function set display(value:Group):void
		{
			if (_display == value)
				return;
			_display = value;
		}
		
		
		//----------------------------------
		//  quality
		//----------------------------------
		
		/**
		 *  @private
		 *  Storage for the quality property.
		 */
		private var _quality:uint = 1;
		
		/**
		 *  The scale of the bitmap when the snapshot is taken. The bitmap is then scalled
		 *  down to the original size.
		 *
		 *  @default 1
		 *  
		 *  @langversion 3.0
		 *  @playerversion Flash 10
		 *  @playerversion AIR 1.5
		 *  @productversion Flex 4
		 */
		public function get quality():uint
		{
			return _quality;
		}
		
		/**
		 *  @private
		 */
		public function set quality( value:uint ):void
		{
			if( value == _quality ) return;     
			
			_quality = value; 
		}
		
		
		
		/**
		 *  Copies properties of the effect to the effect instance. 
		 *
		 *  <p>Flex calls this method from the <code>Effect.createInstance()</code>
		 *  method; you do not have to call it yourself. </p>
		 *
		 *  <p>When you create a custom effect, override this method to 
		 *  copy properties from the Effect class to the effect instance class. 
		 *  In your override, call <code>super.initInstance()</code>. </p>
		 *
		 *  @param EffectInstance The effect instance to initialize.
		 *  
		 *  @langversion 3.0
		 *  @playerversion Flash 9
		 *  @playerversion AIR 1.1
		 *  @productversion Flex 3
		 */
		override protected function initInstance( instance:IEffectInstance ):void
		{
			super.initInstance( instance );
			
			const stackInstance:StackEffectInstance = StackEffectInstance( instance );
			stackInstance.display = display;
			
			stackInstance.bitmapFrom = bitmapFrom;
			stackInstance.bitmapTo = bitmapTo;
			
			stackInstance.quality = quality;
			
			stackInstance.fromStartFraction = fromStartFraction;
			stackInstance.fromEndFraction = fromEndFraction;
			
			stackInstance.toStartFraction = toStartFraction;
			stackInstance.toEndFraction = toEndFraction;
		}
		
		
		
		//----------------------------------
		//  fromStartFraction
		//----------------------------------
		
		/**
		 *  @private
		 *  Storage for the fromStartFraction property.
		 */
		private var _fromStartFraction:Number = 0;
		
		/**
		 *  
		 *
		 *  @default
		 *  
		 *  @langversion 3.0
		 *  @playerversion Flash 10
		 *  @playerversion AIR 1.5
		 *  @productversion Flex 4
		 */
		public function get fromStartFraction():Number
		{
			return _fromStartFraction;
		}
		
		/**
		 *  @private
		 */
		public function set fromStartFraction( value:Number ):void
		{
			if( value == _fromStartFraction ) return;     
			
			_fromStartFraction = value; 
		}
		
		
		//----------------------------------
		//  fromEndFraction
		//----------------------------------
		
		/**
		 *  @private
		 *  Storage for the fromEndFraction property.
		 */
		private var _fromEndFraction:Number = 1;
		
		/**
		 *  
		 *
		 *  @default
		 *  
		 *  @langversion 3.0
		 *  @playerversion Flash 10
		 *  @playerversion AIR 1.5
		 *  @productversion Flex 4
		 */
		public function get fromEndFraction():Number
		{
			return _fromEndFraction;
		}
		
		/**
		 *  @private
		 */
		public function set fromEndFraction( value:Number ):void
		{
			if( value == _fromEndFraction ) return;     
			
			_fromEndFraction = value; 
		}
		
		//----------------------------------
		//  toStartFraction
		//----------------------------------
		
		/**
		 *  @private
		 *  Storage for the toStartFraction property.
		 */
		private var _toStartFraction:Number = 0;
		
		/**
		 *  
		 *
		 *  @default 1
		 *  
		 *  @langversion 3.0
		 *  @playerversion Flash 10
		 *  @playerversion AIR 1.5
		 *  @productversion Flex 4
		 */
		public function get toStartFraction():Number
		{
			return _toStartFraction;
		}
		
		/**
		 *  @private
		 */
		public function set toStartFraction( value:Number ):void
		{
			if( value == _toStartFraction ) return;     
			
			_toStartFraction = value; 
		}
		
		
		//----------------------------------
		//  toEndFraction
		//----------------------------------
		
		/**
		 *  @private
		 *  Storage for the toEndFraction property.
		 */
		private var _toEndFraction:Number = 1;
		
		/**
		 *  
		 *
		 *  @default 1
		 *  
		 *  @langversion 3.0
		 *  @playerversion Flash 10
		 *  @playerversion AIR 1.5
		 *  @productversion Flex 4
		 */
		public function get toEndFraction():Number
		{
			return _toEndFraction;
		}
		
		/**
		 *  @private
		 */
		public function set toEndFraction( value:Number ):void
		{
			if( value == _toEndFraction ) return;     
			
			_toEndFraction = value; 
		}
		
		
		
		//--------------------------------------------------------------------------
		//
		//  Event handlers
		//
		//--------------------------------------------------------------------------
	}
}