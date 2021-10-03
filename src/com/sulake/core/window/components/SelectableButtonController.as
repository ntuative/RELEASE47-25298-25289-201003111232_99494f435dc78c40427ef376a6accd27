package com.sulake.core.window.components
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.WindowContext;
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.enum.WindowState;
   import com.sulake.core.window.events.WindowNotifyEvent;
   import flash.events.Event;
   import flash.geom.Rectangle;
   
   public class SelectableButtonController extends ButtonController implements ISelectableWindow
   {
       
      
      public function SelectableButtonController(param1:String, param2:uint, param3:uint, param4:uint, param5:WindowContext, param6:Rectangle, param7:IWindow, param8:Function, param9:Array = null, param10:Array = null, param11:uint = 0)
      {
         super(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11);
      }
      
      public function set isSelected(param1:Boolean) : void
      {
         setStateFlag(WindowState.const_48,param1);
      }
      
      public function get selector() : ISelectorWindow
      {
         var _loc1_:* = null;
         if(var_8)
         {
            _loc1_ = var_8 as WindowController;
            while(_loc1_)
            {
               if(_loc1_ is ISelectorWindow)
               {
                  return _loc1_ as ISelectorWindow;
               }
               _loc1_ = _loc1_.parent;
            }
         }
         return null;
      }
      
      override public function update(param1:WindowController, param2:Event) : Boolean
      {
         var _loc3_:* = null;
         if(param2.type == WindowNotifyEvent.const_282)
         {
            if(var_8)
            {
               if(!(var_8 is ISelectorWindow))
               {
                  _loc3_ = var_8.parent as WindowController;
                  while(_loc3_)
                  {
                     if(_loc3_ is ISelectorWindow)
                     {
                        _loc3_.update(this,new WindowNotifyEvent(WindowNotifyEvent.const_198,this,null));
                        break;
                     }
                     _loc3_ = _loc3_.parent as WindowController;
                  }
               }
            }
         }
         return super.update(param1,param2);
      }
      
      public function select() : Boolean
      {
         if(getStateFlag(WindowState.const_48))
         {
            return true;
         }
         var _loc1_:WindowNotifyEvent = new WindowNotifyEvent(WindowNotifyEvent.const_370,this,null);
         update(this,_loc1_);
         if(_loc1_.isDefaultPrevented())
         {
            return false;
         }
         setStateFlag(WindowState.const_48,true);
         _loc1_.type = WindowNotifyEvent.const_333;
         update(this,_loc1_);
         return true;
      }
      
      public function get isSelected() : Boolean
      {
         return testStateFlag(WindowState.const_48);
      }
      
      public function unselect() : Boolean
      {
         if(!getStateFlag(WindowState.const_48))
         {
            return true;
         }
         var _loc1_:WindowNotifyEvent = new WindowNotifyEvent(WindowNotifyEvent.const_508,this,null);
         update(this,_loc1_);
         if(_loc1_.isDefaultPrevented())
         {
            return false;
         }
         setStateFlag(WindowState.const_48,false);
         _loc1_.type = WindowNotifyEvent.const_550;
         update(this,_loc1_);
         return true;
      }
   }
}
