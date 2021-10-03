package com.sulake.core.assets.loaders
{
   import flash.events.Event;
   
   public class AssetLoaderEvent extends Event
   {
      
      public static const const_966:String = "AssetLoaderEventUnload";
      
      public static const const_45:String = "AssetLoaderEventError";
      
      public static const const_978:String = "AssetLoaderEventOpen";
      
      public static const const_1007:String = "AssetLoaderEventProgress";
      
      public static const const_932:String = "AssetLoaderEventStatus";
      
      public static const const_33:String = "AssetLoaderEventComplete";
       
      
      private var var_368:int;
      
      public function AssetLoaderEvent(param1:String, param2:int)
      {
         var_368 = param2;
         super(param1,false,false);
      }
      
      public function get status() : int
      {
         return var_368;
      }
      
      override public function clone() : Event
      {
         return new AssetLoaderEvent(type,var_368);
      }
   }
}
