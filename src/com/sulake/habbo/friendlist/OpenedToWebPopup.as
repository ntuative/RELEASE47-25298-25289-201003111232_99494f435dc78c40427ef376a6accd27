package com.sulake.habbo.friendlist
{
   import com.sulake.core.window.IWindowContainer;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class OpenedToWebPopup
   {
       
      
      private var var_166:Timer;
      
      private var _friendList:HabboFriendList;
      
      private var var_284:IWindowContainer;
      
      public function OpenedToWebPopup(param1:HabboFriendList)
      {
         super();
         _friendList = param1;
      }
      
      private function getOpenedToWebAlert() : IWindowContainer
      {
         var _loc1_:IWindowContainer = IWindowContainer(_friendList.getXmlWindow("opened_to_web_popup"));
         _friendList.refreshButton(_loc1_,"opened_to_web",true,null,0);
         return _loc1_;
      }
      
      public function show(param1:int, param2:int) : void
      {
         if(var_284 != null)
         {
            close(null);
         }
         var_284 = getOpenedToWebAlert();
         if(var_166 != null)
         {
            var_166.stop();
         }
         var_166 = new Timer(2000,1);
         var_166.addEventListener(TimerEvent.TIMER,close);
         var_166.start();
         var_284.x = param1;
         var_284.y = param2;
      }
      
      private function close(param1:Event) : void
      {
         var_284.destroy();
         var_284 = null;
      }
   }
}
