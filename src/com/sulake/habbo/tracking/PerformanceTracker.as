package com.sulake.habbo.tracking
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.utils.debug.GarbageMonitor;
   import com.sulake.habbo.communication.messages.outgoing.tracking.PerformanceLogMessageComposer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import flash.external.ExternalInterface;
   import flash.system.Capabilities;
   import flash.system.System;
   import flash.utils.getTimer;
   
   public class PerformanceTracker
   {
       
      
      private var var_1463:GarbageMonitor = null;
      
      private var var_1211:int = 0;
      
      private var var_1214:Boolean = false;
      
      private var var_1872:String = "";
      
      private var var_1462:String = "";
      
      private var var_340:Number = 0;
      
      private var var_1207:int = 10;
      
      private var var_2305:Array;
      
      private var var_626:int = 0;
      
      private var var_1209:int = 60;
      
      private var var_999:int = 0;
      
      private var var_1000:int = 0;
      
      private var var_1885:String = "";
      
      private var var_1873:Number = 0;
      
      private var var_1210:int = 1000;
      
      private var var_1870:Boolean = true;
      
      private var var_1874:Number = 0.15;
      
      private var var_155:IHabboConfigurationManager = null;
      
      private var var_1871:String = "";
      
      private var var_1208:int = 0;
      
      private var _connection:IConnection = null;
      
      public function PerformanceTracker()
      {
         var_2305 = [];
         super();
         var_1462 = Capabilities.version;
         var_1872 = Capabilities.os;
         var_1214 = Capabilities.isDebugger;
         var_1871 = !true ? ExternalInterface.call("window.navigator.userAgent.toString") : "unknown";
         var_1463 = new GarbageMonitor();
         updateGarbageMonitor();
         var_1211 = getTimer();
      }
      
      private function updateGarbageMonitor() : Object
      {
         var _loc2_:* = null;
         var _loc1_:Array = var_1463.list;
         if(_loc1_ == null || _loc1_.length == 0)
         {
            _loc2_ = new GarbageTester("tester");
            var_1463.insert(_loc2_,"tester");
            return _loc2_;
         }
         return null;
      }
      
      public function dispose() : void
      {
      }
      
      public function get averageUpdateInterval() : int
      {
         return var_340;
      }
      
      private function differenceInPercents(param1:Number, param2:Number) : Number
      {
         if(param1 == param2)
         {
            return 0;
         }
         var _loc3_:Number = param1;
         var _loc4_:Number = param2;
         if(param2 > param1)
         {
            _loc3_ = param2;
            _loc4_ = param1;
         }
         return 100 * (1 - _loc4_ / _loc3_);
      }
      
      public function set reportInterval(param1:int) : void
      {
         var_1209 = param1;
      }
      
      public function set connection(param1:IConnection) : void
      {
         _connection = param1;
      }
      
      public function get flashVersion() : String
      {
         return var_1462;
      }
      
      public function update(param1:uint) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Boolean = false;
         var _loc6_:Number = NaN;
         var _loc2_:Object = updateGarbageMonitor();
         if(_loc2_ != null)
         {
            ++var_1000;
            Logger.log("Garbage collection");
         }
         var _loc3_:Boolean = false;
         if(param1 > var_1210)
         {
            ++var_999;
            _loc3_ = true;
         }
         else
         {
            ++var_626;
            if(var_626 <= 1)
            {
               var_340 = param1;
            }
            else
            {
               _loc4_ = Number(var_626);
               var_340 = var_340 * (_loc4_ - 1) / _loc4_ + Number(param1) / _loc4_;
            }
         }
         if(getTimer() - var_1211 > var_1209 * 1000 && var_1208 < var_1207)
         {
            Logger.log("*** Performance tracker: average frame rate " + 1000 / var_340);
            _loc5_ = true;
            if(var_1870 && var_1208 > 0)
            {
               _loc6_ = differenceInPercents(var_1873,var_340);
               if(_loc6_ < var_1874)
               {
                  _loc5_ = false;
               }
            }
            var_1211 = getTimer();
            if(_loc5_ || _loc3_)
            {
               var_1873 = var_340;
               if(sendReport())
               {
                  ++var_1208;
               }
            }
         }
      }
      
      public function set reportLimit(param1:int) : void
      {
         var_1207 = param1;
      }
      
      public function set slowUpdateLimit(param1:int) : void
      {
         var_1210 = param1;
      }
      
      private function sendReport() : Boolean
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(_connection != null)
         {
            _loc1_ = null;
            _loc2_ = getTimer() / 1000;
            _loc3_ = -1;
            _loc4_ = 0;
            _loc1_ = new PerformanceLogMessageComposer(_loc2_,var_1871,var_1462,var_1872,var_1885,var_1214,_loc4_,_loc3_,var_1000,var_340,var_999);
            _connection.send(_loc1_);
            var_1000 = 0;
            var_340 = 0;
            var_626 = 0;
            var_999 = 0;
            return true;
         }
         return false;
      }
      
      public function set configuration(param1:IHabboConfigurationManager) : void
      {
         var_155 = param1;
         var_1209 = int(var_155.getKey("performancetest.interval","60"));
         var_1210 = int(var_155.getKey("performancetest.slowupdatelimit","1000"));
         var_1207 = int(var_155.getKey("performancetest.reportlimit","10"));
         var_1874 = Number(var_155.getKey("performancetest.distribution.deviancelimit.percent","10"));
         var_1870 = Boolean(int(var_155.getKey("performancetest.distribution.enabled","1")));
      }
   }
}
