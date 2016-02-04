package ws.tink.spark.effects.stackEffects
{
	import flash.display.BitmapData;
	
	import mx.effects.IEffect;
	
	import spark.components.Group;

	public interface IStackEffect extends IEffect
	{
		function get bitmapFrom():BitmapData;
		
		function set bitmapFrom(value:BitmapData):void;
		
		function get bitmapTo():BitmapData;
		
		function set bitmapTo(value:BitmapData):void;
		
		function get display():Group
		
		function set display(value:Group):void;
	}
}