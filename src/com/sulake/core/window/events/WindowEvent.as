package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowEvent extends Event
   {
      
      public static const const_290:String = "WE_CHILD_RESIZED";
      
      public static const const_1330:String = "WE_CLOSE";
      
      public static const const_1381:String = "WE_DESTROY";
      
      public static const const_135:String = "WE_CHANGE";
      
      public static const const_1266:String = "WE_RESIZE";
      
      public static const WINDOW_EVENT_MESSAGE:String = "WE_MESSAGE";
      
      public static const const_1508:String = "WE_PARENT_RESIZE";
      
      public static const const_97:String = "WE_UPDATE";
      
      public static const const_1349:String = "WE_MAXIMIZE";
      
      public static const const_436:String = "WE_DESTROYED";
      
      public static const const_865:String = "WE_UNSELECT";
      
      public static const const_1307:String = "WE_MAXIMIZED";
      
      public static const const_1563:String = "WE_UNLOCKED";
      
      public static const const_447:String = "WE_CHILD_REMOVED";
      
      public static const const_174:String = "WE_OK";
      
      public static const const_44:String = "WE_RESIZED";
      
      public static const const_1236:String = "WE_ACTIVATE";
      
      public static const const_237:String = "WE_ENABLED";
      
      public static const const_469:String = "WE_CHILD_RELOCATED";
      
      public static const const_1315:String = "WE_CREATE";
      
      public static const const_649:String = "WE_SELECT";
      
      public static const const_167:String = "";
      
      public static const const_1472:String = "WE_LOCKED";
      
      public static const const_1572:String = "WE_PARENT_RELOCATE";
      
      public static const const_1475:String = "WE_CHILD_REMOVE";
      
      public static const const_1483:String = "WE_CHILD_RELOCATE";
      
      public static const const_1480:String = "WE_LOCK";
      
      public static const const_215:String = "WE_FOCUSED";
      
      public static const const_721:String = "WE_UNSELECTED";
      
      public static const const_896:String = "WE_DEACTIVATED";
      
      public static const const_1355:String = "WE_MINIMIZED";
      
      public static const const_1534:String = "WE_ARRANGED";
      
      public static const const_1490:String = "WE_UNLOCK";
      
      public static const const_1577:String = "WE_ATTACH";
      
      public static const const_1339:String = "WE_OPEN";
      
      public static const const_1212:String = "WE_RESTORE";
      
      public static const const_1551:String = "WE_PARENT_RELOCATED";
      
      public static const const_1295:String = "WE_RELOCATE";
      
      public static const const_1455:String = "WE_CHILD_RESIZE";
      
      public static const const_1574:String = "WE_ARRANGE";
      
      public static const const_1364:String = "WE_OPENED";
      
      public static const const_1173:String = "WE_CLOSED";
      
      public static const const_1597:String = "WE_DETACHED";
      
      public static const const_1549:String = "WE_UPDATED";
      
      public static const const_1357:String = "WE_UNFOCUSED";
      
      public static const const_413:String = "WE_RELOCATED";
      
      public static const const_1186:String = "WE_DEACTIVATE";
      
      public static const const_231:String = "WE_DISABLED";
      
      public static const const_715:String = "WE_CANCEL";
      
      public static const const_578:String = "WE_ENABLE";
      
      public static const const_1338:String = "WE_ACTIVATED";
      
      public static const const_1190:String = "WE_FOCUS";
      
      public static const const_1569:String = "WE_DETACH";
      
      public static const const_1224:String = "WE_RESTORED";
      
      public static const const_1365:String = "WE_UNFOCUS";
      
      public static const const_53:String = "WE_SELECTED";
      
      public static const const_1301:String = "WE_PARENT_RESIZED";
      
      public static const const_1273:String = "WE_CREATED";
      
      public static const const_1541:String = "WE_ATTACHED";
      
      public static const const_1231:String = "WE_MINIMIZE";
      
      public static const WINDOW_EVENT_DISABLE:String = "WE_DISABLE";
       
      
      protected var _type:String = "";
      
      protected var var_1597:IWindow;
      
      protected var _window:IWindow;
      
      protected var var_1376:Boolean;
      
      public function WindowEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false, param5:Boolean = false)
      {
         _type = param1;
         _window = param2;
         var_1597 = param3;
         var_1376 = false;
         super(param1,param4,param5);
      }
      
      public function isWindowOperationPrevented() : Boolean
      {
         return var_1376;
      }
      
      public function get related() : IWindow
      {
         return var_1597;
      }
      
      public function get window() : IWindow
      {
         return _window;
      }
      
      public function set type(param1:String) : void
      {
         _type = param1;
      }
      
      override public function get type() : String
      {
         return _type;
      }
      
      override public function toString() : String
      {
         return formatToString("WindowEvent","type","bubbles","cancelable","window");
      }
      
      override public function clone() : Event
      {
         return new WindowEvent(_type,window,related,bubbles,cancelable);
      }
      
      public function preventWindowOperation() : void
      {
         if(cancelable)
         {
            var_1376 = true;
            stopImmediatePropagation();
            return;
         }
         throw new Error("Attempted to prevent window operation that is not canceable!");
      }
   }
}
