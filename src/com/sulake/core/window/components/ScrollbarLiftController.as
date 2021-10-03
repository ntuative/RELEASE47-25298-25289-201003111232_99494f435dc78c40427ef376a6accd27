package com.sulake.core.window.components
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.WindowContext;
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.events.WindowNotifyEvent;
   import flash.events.Event;
   import flash.geom.Rectangle;
   
   public class ScrollbarLiftController extends InteractiveController implements IDragBarWindow
   {
       
      
      protected var var_813:Number;
      
      protected var _offsetX:Number;
      
      protected var _scrollBar:ScrollbarController;
      
      public function ScrollbarLiftController(param1:String, param2:uint, param3:uint, param4:uint, param5:WindowContext, param6:Rectangle, param7:IWindow, param8:Function, param9:Array = null, param10:Array = null, param11:uint = 0)
      {
         _offsetX = 0;
         var_813 = 0;
         param4 |= 0;
         param4 |= 0;
         param4 |= 0;
         super(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11);
         var _loc12_:* = param7;
         while(_loc12_ != null)
         {
            if(_loc12_ is IScrollbarWindow)
            {
               _scrollBar = ScrollbarController(_loc12_);
               _loc12_ = null;
            }
            else
            {
               _loc12_ = _loc12_.parent;
            }
         }
         if(false)
         {
            setMinWidth(width);
         }
         else
         {
            setMinHeight(height);
         }
      }
      
      override public function update(param1:WindowController, param2:Event) : Boolean
      {
         if(param2.type == WindowNotifyEvent.const_451)
         {
            _offsetX = x != 0 ? Number(x / Number(0 - width)) : Number(0);
            var_813 = y != 0 ? Number(y / Number(0 - height)) : Number(0);
            if(var_8 != _scrollBar)
            {
               _scrollBar.update(this,new WindowNotifyEvent(WindowNotifyEvent.const_251,this,null));
            }
         }
         return super.update(param1,param2);
      }
      
      public function set offsetX(param1:Number) : void
      {
      }
      
      public function set offsetY(param1:Number) : void
      {
      }
      
      public function get offsetY() : Number
      {
         return var_813;
      }
      
      public function get offsetX() : Number
      {
         return _offsetX;
      }
   }
}
