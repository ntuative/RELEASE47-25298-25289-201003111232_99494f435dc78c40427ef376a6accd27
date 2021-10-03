package com.sulake.habbo.moderation
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import flash.events.Event;
   
   public class OpenRoomTool
   {
       
      
      private var var_1529:Boolean;
      
      private var _roomId:int;
      
      private var _main:ModerationManager;
      
      private var var_53:IFrameWindow;
      
      public function OpenRoomTool(param1:IFrameWindow, param2:ModerationManager, param3:IWindow, param4:Boolean, param5:int)
      {
         super();
         var_53 = param1;
         _main = param2;
         var_1529 = param4;
         _roomId = param5;
         param3.procedure = onClick;
      }
      
      private function onClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(var_1529)
         {
            _main.windowManager.alert("Alert","Room tool is not available for public spaces. Public spaces can be moderated using in-room chat moderation commands.",0,onAlertClose);
         }
         else
         {
            _main.windowTracker.show(new RoomToolCtrl(_main,_roomId),var_53,false,false,true);
         }
      }
      
      private function onAlertClose(param1:IAlertDialog, param2:Event) : void
      {
         param1.dispose();
      }
   }
}
