package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowNotifyEvent extends WindowEvent
   {
      
      public static const const_1279:String = "WN_CREATED";
      
      public static const const_818:String = "WN_DISABLE";
      
      public static const const_975:String = "WN_DEACTIVATED";
      
      public static const const_982:String = "WN_OPENED";
      
      public static const const_942:String = "WN_CLOSED";
      
      public static const const_960:String = "WN_DESTROY";
      
      public static const const_1463:String = "WN_ARRANGED";
      
      public static const const_477:String = "WN_PARENT_RESIZED";
      
      public static const const_967:String = "WN_ENABLE";
      
      public static const const_917:String = "WN_RELOCATE";
      
      public static const const_970:String = "WN_FOCUS";
      
      public static const const_828:String = "WN_PARENT_RELOCATED";
      
      public static const const_396:String = "WN_PARAM_UPDATED";
      
      public static const const_670:String = "WN_PARENT_ACTIVATED";
      
      public static const const_223:String = "WN_RESIZED";
      
      public static const const_873:String = "WN_CLOSE";
      
      public static const const_814:String = "WN_PARENT_REMOVED";
      
      public static const const_251:String = "WN_CHILD_RELOCATED";
      
      public static const const_524:String = "WN_ENABLED";
      
      public static const const_275:String = "WN_CHILD_RESIZED";
      
      public static const const_990:String = "WN_MINIMIZED";
      
      public static const const_519:String = "WN_DISABLED";
      
      public static const const_198:String = "WN_CHILD_ACTIVATED";
      
      public static const const_457:String = "WN_STATE_UPDATED";
      
      public static const const_550:String = "WN_UNSELECTED";
      
      public static const const_354:String = "WN_STYLE_UPDATED";
      
      public static const const_1436:String = "WN_UPDATE";
      
      public static const const_443:String = "WN_PARENT_ADDED";
      
      public static const const_510:String = "WN_RESIZE";
      
      public static const const_704:String = "WN_CHILD_REMOVED";
      
      public static const const_1505:String = "";
      
      public static const const_821:String = "WN_RESTORED";
      
      public static const const_333:String = "WN_SELECTED";
      
      public static const const_955:String = "WN_MINIMIZE";
      
      public static const const_872:String = "WN_FOCUSED";
      
      public static const const_1356:String = "WN_LOCK";
      
      public static const const_326:String = "WN_CHILD_ADDED";
      
      public static const const_822:String = "WN_UNFOCUSED";
      
      public static const const_451:String = "WN_RELOCATED";
      
      public static const const_790:String = "WN_DEACTIVATE";
      
      public static const const_1164:String = "WN_CRETAE";
      
      public static const const_855:String = "WN_RESTORE";
      
      public static const const_282:String = "WN_ACTVATED";
      
      public static const const_1176:String = "WN_LOCKED";
      
      public static const const_370:String = "WN_SELECT";
      
      public static const const_836:String = "WN_MAXIMIZE";
      
      public static const const_889:String = "WN_OPEN";
      
      public static const const_508:String = "WN_UNSELECT";
      
      public static const const_1504:String = "WN_ARRANGE";
      
      public static const const_1385:String = "WN_UNLOCKED";
      
      public static const const_1499:String = "WN_UPDATED";
      
      public static const const_953:String = "WN_ACTIVATE";
      
      public static const const_1383:String = "WN_UNLOCK";
      
      public static const const_848:String = "WN_MAXIMIZED";
      
      public static const const_823:String = "WN_DESTROYED";
      
      public static const const_800:String = "WN_UNFOCUS";
       
      
      public function WindowNotifyEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false)
      {
         super(param1,param2,param3,false,param4);
      }
      
      override public function toString() : String
      {
         return formatToString("WindowNotifyEvent","type","cancelable");
      }
      
      override public function clone() : Event
      {
         return new WindowNotifyEvent(type,_window,var_1597,cancelable);
      }
   }
}
