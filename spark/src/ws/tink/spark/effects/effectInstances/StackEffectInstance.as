package ws.tink.spark.effects.effectInstances
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	
	import mx.effects.EffectInstance;
	import mx.events.EffectEvent;
	import mx.utils.UIDUtil;
	
	import spark.components.Group;
	import spark.components.Image;
	import spark.components.supportClasses.GroupBase;
	import spark.effects.animation.Animation;
	import spark.effects.animation.MotionPath;
	import spark.effects.animation.SimpleMotionPath;
	import spark.effects.interpolation.NumberInterpolator;
	
	import ws.tink.spark.controls.supportClasses.AnimationTarget;
	
	public class StackEffectInstance extends EffectInstance
	{
		public function StackEffectInstance(target:Object)
		{
			super( target );
			
			_element = GroupBase( target ); 
			_uid = UIDUtil.createUID();
			
		}
		private var _uid:String;
		private var _animation:Animation;
		private var _animationTarget:AnimationTarget;
		private var _numUpdateListeners:int;
		private var _imageFrom:Image;
		
		private var _toDiff:Number;
		private var _fromDiff:Number;
		private var _element:GroupBase;
		
		public function get element():GroupBase 
		{
			return _element;
		}
		public function get imageFrom():Image 
		{
			return _imageFrom;
		}
		
		private var _imageTo:Image;
		public function get imageTo():Image 
		{
			return _imageTo;
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
			display.clipAndEnableScrolling = true;
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
		
		
		//----------------------------------
		//  quality
		//----------------------------------
		
		/**
		 *  @private
		 *  Storage for the quality property.
		 */
		private var _quality:uint;
		
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
		 *  @private
		 *  Interrupts an effect that is currently playing,
		 *  and immediately jumps to the end of the effect.
		 *  Calls the <code>Tween.endTween()</code> method
		 *  on the <code>tween</code> property. 
		 *  This method implements the method of the superclass. 
		 *
		 *  <p>If you create a subclass of TweenEffectInstance,
		 *  you can optionally override this method.</p>
		 *
		 *  <p>The effect dispatches the <code>effectEnd</code> event.</p>
		 *
		 *  @see mx.effects.EffectInstance#end()
		 *  
		 *  @langversion 3.0
		 *  @playerversion Flash 10
		 *  @playerversion AIR 1.5
		 *  @productversion Flex 4
		 */
		override public function end():void
		{
			// Jump to the end of the animation.
			if (_animation)
			{
				_animation.end();
				//				_animation = null;
			}
			
			super.end();
		}
		
		override public function play():void
		{
			super.play();
			
			_animationTarget = new AnimationTarget();
			_animationTarget.updateFunction = animationUpdate;
			_animationTarget.endFunction = animationEnd;
			
			_animation = new Animation( duration );
			_animation.animationTarget = _animationTarget;
			
			display.visible = false;
			
			if( !_imageFrom )
				_imageFrom = new Image();
			
			if( !_imageTo )
				_imageTo = new Image();
			
			display.scaleX = display.scaleY = 1 / quality;
			display.addElement( _imageFrom );
			display.addElement( _imageTo );
			
			display.x = element.x;
			display.y = element.y;
			
			_imageFrom.source = _bitmapFrom;
			_imageFrom.validateNow();
			
			_imageTo.source = _bitmapTo;
			_imageTo.validateNow();
			
			initialize();
			update( 0, 0 );
			
			display.visible = true;
			target.visible = false;
			
			_animation.currentValue = 0;
			_animation.motionPaths = Vector.<MotionPath>( [ new SimpleMotionPath( "value", 0, 1 ) ] )
			_animation.play();
		}
		
		private function animationUpdate( animation:Animation ):void
		{
			const from:Number = Math.max( 0, Math.min( 1, ( animation.cycleFraction - fromStartFraction ) / _fromDiff ) );
			const to:Number = Math.max( 0, Math.min( 1, ( animation.cycleFraction - toStartFraction ) / _toDiff ) );
			
			update( from, to );
			
			if (_numUpdateListeners > 0)
			{
				// Only bother dispatching this event if there are listeners. This avoids
				// unnecessary overhead for the common case of no listeners on this frequent
				// event
				var event:EffectEvent = new EffectEvent(EffectEvent.EFFECT_UPDATE);
				event.effectInstance = this;
				dispatchEvent(event);
			}
		}
		
		private function animationEnd( animation:Animation ):void
		{
			finishEffect();
		}
		
		/**
		 *  @private
		 *  
		 *  @langversion 3.0
		 *  @playerversion Flash 10
		 *  @playerversion AIR 1.5
		 *  @productversion Flex 4
		 */
		override public function finishEffect():void
		{
			_animation.stop();
			
			target.visible = true;
			display.visible = false;
			display.removeAllElements();
			super.finishEffect();
		}
		
		protected function initialize():void
		{
			_fromDiff = fromEndFraction - fromStartFraction;
			_toDiff = toEndFraction - toStartFraction;
		}
		
		protected function update( from:Number, to:Number ):void
		{
		}
		
		
		/**
		 * @private
		 * Track number of listeners to update event for optimization purposes
		 */
		override public function addEventListener(type:String, listener:Function, 
												  useCapture:Boolean=false, priority:int=0, 
												  useWeakReference:Boolean=false):void
		{
			super.addEventListener(type, listener, useCapture, priority, 
				useWeakReference);
			if (type == EffectEvent.EFFECT_UPDATE)
				++_numUpdateListeners;
		}
		
		/**
		 * @private
		 * Track number of listeners to update event for optimization purposes
		 */
		override public function removeEventListener(type:String, listener:Function, 
													 useCapture:Boolean=false):void
		{
			super.removeEventListener(type, listener, useCapture);
			if (type == EffectEvent.EFFECT_UPDATE)
				--_numUpdateListeners;
		}
	}
}