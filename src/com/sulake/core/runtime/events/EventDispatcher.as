package com.sulake.core.runtime.events
{
   import com.sulake.core.Core;
   import com.sulake.core.runtime.IDisposable;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.utils.Dictionary;
   
   public class EventDispatcher implements IEventDispatcher, IDisposable
   {
      
      private static const const_1057:uint = 1;
      
      private static const const_488:uint = 0;
      
      private static const const_756:uint = 2;
       
      
      private var var_660:Error;
      
      protected var _disposed:Boolean = false;
      
      private var var_256:Dictionary;
      
      private var _eventDispatcher:flash.events.EventDispatcher;
      
      private var _result:uint;
      
      public function EventDispatcher(param1:IEventDispatcher = null)
      {
         var_256 = new Dictionary();
         super();
         _eventDispatcher = new flash.events.EventDispatcher(!!param1 ? param1 : this);
      }
      
      public function dispatchEvent(param1:Event) : Boolean
      {
         if(!_disposed)
         {
            _result = const_488;
            _eventDispatcher.dispatchEvent(param1);
            if(_result == const_756)
            {
               if(var_660 != null)
               {
                  Core.crash("Error catched in EventDispatcher: undefined",var_660.errorID,var_660);
               }
               else
               {
                  Core.crash("Error catched in EventDispatcher. No error data available!",0,var_660);
               }
            }
            return _result == const_488;
         }
         return false;
      }
      
      public function willTrigger(param1:String) : Boolean
      {
         return !!_disposed ? false : false;
      }
      
      public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc6_:* = null;
         if(!_disposed)
         {
            _loc4_ = var_256[param1];
            if(_loc4_)
            {
               _loc5_ = 0;
               for each(_loc6_ in _loc4_)
               {
                  if(_loc6_.callback == param2 && _loc6_.var_2256 == param3)
                  {
                     _loc4_.splice(_loc5_,1);
                     _loc6_.callback = null;
                     if(_loc4_.length == 0)
                     {
                        delete var_256[param1];
                     }
                     return;
                  }
                  _loc5_++;
               }
            }
         }
      }
      
      public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         var _loc8_:* = null;
         var _loc6_:Array = var_256[param1];
         var _loc7_:EventListenerStruct = new EventListenerStruct(param2,param3,param4,param5);
         if(!_loc6_)
         {
            _loc6_ = [_loc7_];
            var_256[param1] = _loc6_;
            _eventDispatcher.addEventListener(param1,eventProcessor);
         }
         else
         {
            for each(_loc8_ in _loc6_)
            {
               if(_loc8_.callback == param2 && _loc8_.var_2256 == param3)
               {
                  return;
               }
               if(param4 > _loc8_.priority)
               {
                  _loc6_.splice(_loc6_.indexOf(_loc8_),0,_loc7_);
                  return;
               }
            }
            _loc6_.push(_loc7_);
         }
      }
      
      public function get error() : Error
      {
         return var_660;
      }
      
      private function eventProcessor(param1:Event) : void
      {
         var callbacks:Array = null;
         var callback:Function = null;
         var struct:EventListenerStruct = null;
         var event:Event = param1;
         var array:Array = var_256[event.type];
         if(array)
         {
            callbacks = [];
            for each(struct in array)
            {
               callbacks.push(struct.callback);
            }
            while(callbacks.length > 0)
            {
               try
               {
                  callback = callbacks.shift();
                  callback(event);
               }
               catch(e:Error)
               {
                  Logger.log(e.getStackTrace());
                  _result = const_756;
                  var_660 = e;
                  return;
               }
            }
         }
         _result = !!event.isDefaultPrevented() ? uint(const_1057) : uint(const_488);
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(!_disposed)
         {
            for(_loc1_ in var_256)
            {
               _loc2_ = var_256[_loc1_] as Array;
               for each(_loc3_ in _loc2_)
               {
                  _loc3_.callback = null;
               }
               delete var_256[_loc1_];
            }
            var_256 = null;
            _eventDispatcher = null;
            _disposed = true;
         }
      }
      
      public function hasEventListener(param1:String) : Boolean
      {
         return !!_disposed ? false : false;
      }
   }
}
