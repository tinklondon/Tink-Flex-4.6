package ws.tink.spark.effects.stackEffects
{
	import flash.display.BitmapData;
	
	import mx.effects.IEffectInstance;
	
	import ws.tink.spark.effects.stackEffects.effectInstances.SlideInstance;
	import ws.tink.spark.effects.stackEffects.effectInstances.StackEffectInstance;

	public class Slide extends StackEffect
	{
		public function Slide()
		{
			super();
			
			instanceClass = SlideInstance;
		}
		
		
		private var _direction:String;
		public function get direction():String { return _direction; }
		
		public function set direction(value:String):void
		{
			if (_direction == value)
				return;
			_direction = value;
		}
		
		
		
		override protected function initInstance(instance:IEffectInstance):void
		{
			super.initInstance( instance );
			const s:SlideInstance = instance as SlideInstance;
			s.direction = direction;
		}
		
	}
}