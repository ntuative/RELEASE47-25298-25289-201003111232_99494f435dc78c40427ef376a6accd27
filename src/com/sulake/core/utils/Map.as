package com.sulake.core.utils
{
   import com.sulake.core.runtime.IDisposable;
   import flash.utils.Dictionary;
   import flash.utils.Proxy;
   import flash.utils.flash_proxy;
   
   public class Map extends Proxy implements IDisposable
   {
       
      
      private var _length:uint;
      
      private var var_209:Array;
      
      private var var_30:Array;
      
      private var var_121:Dictionary;
      
      public function Map()
      {
         super();
         _length = 0;
         var_121 = new Dictionary();
         var_30 = [];
         var_209 = [];
      }
      
      public function remove(param1:*) : *
      {
         var _loc2_:Object = var_121[param1];
         if(_loc2_ == null)
         {
            return null;
         }
         var _loc3_:int = var_30.indexOf(_loc2_);
         if(_loc3_ >= 0)
         {
            var_30.splice(_loc3_,1);
            var_209.splice(_loc3_,1);
            --_length;
         }
         delete var_121[param1];
         return _loc2_;
      }
      
      public function unshift(param1:*, param2:*) : Boolean
      {
         if(false)
         {
            return false;
         }
         var_121[param1] = param2;
         var_30.unshift(param2);
         var_209.unshift(param1);
         ++_length;
         return true;
      }
      
      override flash_proxy function getProperty(param1:*) : *
      {
         if(param1 is QName)
         {
            param1 = QName(param1).localName;
         }
         return var_121[param1];
      }
      
      public function reset() : void
      {
         var _loc1_:* = null;
         for(_loc1_ in var_121)
         {
            delete var_121[_loc1_];
         }
         _length = 0;
         var_30 = [];
         var_209 = [];
      }
      
      override flash_proxy function nextNameIndex(param1:int) : int
      {
         if(param1 < var_209.length)
         {
            return param1 + 1;
         }
         return 0;
      }
      
      override flash_proxy function setProperty(param1:*, param2:*) : void
      {
         if(param1 is QName)
         {
            param1 = QName(param1).localName;
         }
         var_121[param1] = param2;
         var _loc3_:int = var_209.indexOf(param1);
         if(_loc3_ == -1)
         {
            var_30[_length] = param2;
            var_209[_length] = param1;
            ++_length;
         }
         else
         {
            var_30.splice(_loc3_,1,param2);
         }
      }
      
      public function getValues() : Array
      {
         return var_30.slice();
      }
      
      override flash_proxy function nextName(param1:int) : String
      {
         return var_209[param1 - 1];
      }
      
      public function add(param1:*, param2:*) : Boolean
      {
         if(false)
         {
            return false;
         }
         var_121[param1] = param2;
         var_30[_length] = param2;
         var_209[_length] = param1;
         ++_length;
         return true;
      }
      
      override flash_proxy function callProperty(param1:*, ... rest) : *
      {
         var _loc3_:* = null;
         if(param1.localName == "toString")
         {
            return "Map";
         }
         return null;
      }
      
      public function get disposed() : Boolean
      {
         return var_121 == null;
      }
      
      public function get length() : uint
      {
         return _length;
      }
      
      public function getKey(param1:int) : *
      {
         if(param1 < 0 || param1 >= _length)
         {
            return null;
         }
         return var_209[param1];
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         if(var_121 != null)
         {
            for(_loc1_ in var_121)
            {
               delete var_121[_loc1_];
            }
            var_121 = null;
         }
         _length = 0;
         var_30 = null;
         var_209 = null;
      }
      
      public function getKeys() : Array
      {
         return var_209.slice();
      }
      
      public function getWithIndex(param1:int) : *
      {
         if(param1 < 0 || param1 >= _length)
         {
            return null;
         }
         return var_30[param1];
      }
      
      public function getValue(param1:*) : *
      {
         return var_121[param1];
      }
      
      override flash_proxy function nextValue(param1:int) : *
      {
         return var_30[param1 - 1];
      }
   }
}
