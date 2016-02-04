package ws.tink.spark.effects.stackEffects
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.events.EventDispatcher;
	
	import mx.effects.Effect;
	import mx.effects.IEffectInstance;
	import mx.events.EffectEvent;
	
	import spark.components.Group;
	
	import ws.tink.spark.effects.stackEffects.effectInstances.StackEffectInstance;
	
	
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
	}
	
	
	//--------------------------------------------------------------------------
	//
	//  Event handlers
	//
	//--------------------------------------------------------------------------
	}
}