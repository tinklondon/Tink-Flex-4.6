package ws.tink.spark.effects
{
	import ws.tink.spark.effects.effectInstances.FadeStackInstance;

	public class FadeStack extends StackEffect
	{
		public function FadeStack()
		{
			super();
			
			instanceClass = FadeStackInstance;
		}
		
		
	}
}