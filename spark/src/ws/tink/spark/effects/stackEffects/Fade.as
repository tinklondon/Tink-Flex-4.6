package ws.tink.spark.effects.stackEffects
{
	import ws.tink.spark.effects.stackEffects.effectInstances.FadeInstance;

	public class Fade extends StackEffect
	{
		public function Fade()
		{
			super();
			
			instanceClass = FadeInstance;
		}
		
		
	}
}