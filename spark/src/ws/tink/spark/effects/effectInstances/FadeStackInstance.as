package ws.tink.spark.effects.effectInstances
{
	
	public class FadeStackInstance extends StackEffectInstance
	{
		public function FadeStackInstance(target:Object)
		{
			super(target);
		}
		
		override protected function initialize():void
		{
			super.initialize();
			
			imageFrom.x = imageTo.x = element.x;
			imageFrom.y = imageTo.y = element.y;
			
			imageFrom.alpha = 1;
			imageTo.alpha = 0;
		}
		
		override protected function update( from:Number, to:Number ):void
		{
			super.update( from, to );
			imageFrom.alpha = 1 - from;
			imageTo.alpha = to;
		}
	}
}