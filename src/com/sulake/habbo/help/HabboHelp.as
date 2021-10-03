package com.sulake.habbo.help
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.help.cfh.data.CallForHelpData;
   import com.sulake.habbo.help.cfh.data.UserRegistry;
   import com.sulake.habbo.help.enum.HabboHelpViewEnum;
   import com.sulake.habbo.help.help.HelpUI;
   import com.sulake.habbo.help.help.data.FaqIndex;
   import com.sulake.habbo.help.hotelmerge.HotelMergeUI;
   import com.sulake.habbo.help.tutorial.TutorialUI;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.session.IRoomSessionManager;
   import com.sulake.habbo.session.events.RoomSessionEvent;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarSetIconEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboRoomSessionManager;
   import com.sulake.iid.IIDHabboToolbar;
   import flash.utils.Dictionary;
   import iid.IIDHabboWindowManager;
   
   public class HabboHelp extends Component implements IHabboHelp
   {
       
      
      private var var_1929:UserRegistry;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var var_129:TutorialUI;
      
      private var var_678:IHabboLocalizationManager;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_57:HelpUI;
      
      private var var_679:IHabboConfigurationManager;
      
      private var var_190:IHabboToolbar;
      
      private var var_570:HotelMergeUI;
      
      private var var_306:IHabboCommunicationManager;
      
      private var var_823:FaqIndex;
      
      private var var_1775:String = "";
      
      private var var_1045:IncomingMessages;
      
      private var var_1224:CallForHelpData;
      
      public function HabboHelp(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         var_1224 = new CallForHelpData();
         var_1929 = new UserRegistry();
         super(param1,param2,param3);
         _assetLibrary = param3;
         var_823 = new FaqIndex();
         queueInterface(new IIDHabboWindowManager(),onWindowManagerReady);
      }
      
      public function get toolbar() : IHabboToolbar
      {
         return var_190;
      }
      
      public function tellUI(param1:String, param2:* = null) : void
      {
         if(var_57 != null)
         {
            var_57.tellUI(param1,param2);
         }
      }
      
      private function toggleHelpUI() : void
      {
         if(var_57 == null)
         {
            if(!createHelpUI())
            {
               return;
            }
         }
         var_57.toggleUI();
      }
      
      private function removeTutorialUI() : void
      {
         if(var_129 != null)
         {
            var_129.dispose();
            var_129 = null;
         }
      }
      
      public function get ownUserName() : String
      {
         return var_1775;
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         return _windowManager;
      }
      
      override public function dispose() : void
      {
         if(var_57 != null)
         {
            var_57.dispose();
            var_57 = null;
         }
         if(var_129 != null)
         {
            var_129.dispose();
            var_129 = null;
         }
         if(var_570)
         {
            var_570.dispose();
            var_570 = null;
         }
         if(var_823 != null)
         {
            var_823.dispose();
            var_823 = null;
         }
         var_1045 = null;
         if(var_190)
         {
            var_190.release(new IIDHabboToolbar());
            var_190 = null;
         }
         if(var_678)
         {
            var_678.release(new IIDHabboLocalizationManager());
            var_678 = null;
         }
         if(var_306)
         {
            var_306.release(new IIDHabboCommunicationManager());
            var_306 = null;
         }
         if(var_679)
         {
            var_679.release(new IIDHabboConfigurationManager());
            var_679 = null;
         }
         if(_windowManager)
         {
            _windowManager.release(new IIDHabboWindowManager());
            _windowManager = null;
         }
         super.dispose();
      }
      
      public function get localization() : IHabboLocalizationManager
      {
         return var_678;
      }
      
      private function onRoomSessionEvent(param1:RoomSessionEvent) : void
      {
         switch(param1.type)
         {
            case RoomSessionEvent.const_96:
               if(var_57 != null)
               {
                  var_57.setRoomSessionStatus(true);
               }
               if(var_129 != null)
               {
                  var_129.setRoomSessionStatus(true);
               }
               break;
            case RoomSessionEvent.const_101:
               if(var_57 != null)
               {
                  var_57.setRoomSessionStatus(false);
               }
               if(var_129 != null)
               {
                  var_129.setRoomSessionStatus(false);
               }
               userRegistry.unregisterRoom();
         }
      }
      
      public function enableCallForGuideBotUI() : void
      {
         if(var_57 != null)
         {
            var_57.updateCallForGuideBotUI(true);
         }
      }
      
      public function get userRegistry() : UserRegistry
      {
         return var_1929;
      }
      
      public function showCallForHelpResult(param1:String) : void
      {
         if(var_57 != null)
         {
            var_57.showCallForHelpResult(param1);
         }
      }
      
      public function initHotelMergeUI() : void
      {
         if(!var_570)
         {
            var_570 = new HotelMergeUI(this);
         }
         var_570.startNameChange();
      }
      
      private function createTutorialUI() : Boolean
      {
         if(var_129 == null && _assetLibrary != null && _windowManager != null)
         {
            var_129 = new TutorialUI(this);
         }
         return var_129 != null;
      }
      
      private function createHelpUI() : Boolean
      {
         if(var_57 == null && _assetLibrary != null && _windowManager != null)
         {
            var_57 = new HelpUI(this,_assetLibrary,_windowManager,var_678,var_190);
         }
         return var_57 != null;
      }
      
      public function get callForHelpData() : CallForHelpData
      {
         return var_1224;
      }
      
      public function reportUser(param1:int, param2:String) : void
      {
         var_1224.reportedUserId = param1;
         var_1224.reportedUserName = param2;
         var_57.showUI(HabboHelpViewEnum.const_325);
      }
      
      public function set ownUserName(param1:String) : void
      {
         var_1775 = param1;
      }
      
      private function setHabboToolbarIcon() : void
      {
         if(var_190 != null)
         {
            var_190.events.dispatchEvent(new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_124,HabboToolbarIconEnum.HELP));
         }
      }
      
      private function onWindowManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         _windowManager = IHabboWindowManager(param2);
         queueInterface(new IIDHabboCommunicationManager(),onCommunicationManagerReady);
      }
      
      private function onLocalizationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var_678 = IHabboLocalizationManager(param2);
         queueInterface(new IIDHabboConfigurationManager(),onConfigurationManagerReady);
      }
      
      public function updateTutorial(param1:Boolean, param2:Boolean, param3:Boolean) : void
      {
         if(param1 && param2 && param3)
         {
            removeTutorialUI();
            return;
         }
         if(var_129 == null)
         {
            if(!createTutorialUI())
            {
               return;
            }
         }
         var_129.update(param1,param2,param3);
      }
      
      private function onCommunicationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var_306 = IHabboCommunicationManager(param2);
         var_1045 = new IncomingMessages(this,var_306);
         queueInterface(new IIDHabboToolbar(),onToolbarReady);
      }
      
      public function showUI(param1:String = null) : void
      {
         if(var_57 != null)
         {
            var_57.showUI(param1);
         }
      }
      
      public function hideUI() : void
      {
         if(var_57 != null)
         {
            var_57.hideUI();
         }
      }
      
      public function sendMessage(param1:IMessageComposer) : void
      {
         if(var_306 != null && param1 != null)
         {
            var_306.getHabboMainConnection(null).send(param1);
         }
      }
      
      public function getFaq() : FaqIndex
      {
         return var_823;
      }
      
      public function disableCallForGuideBotUI() : void
      {
         if(var_57 != null)
         {
            var_57.updateCallForGuideBotUI(false);
         }
      }
      
      private function onToolbarReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var_190 = IHabboToolbar(param2);
         queueInterface(new IIDHabboLocalizationManager(),onLocalizationManagerReady);
      }
      
      private function onConfigurationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var_679 = IHabboConfigurationManager(param2);
         queueInterface(new IIDHabboRoomSessionManager(),onRoomSessionManagerReady);
      }
      
      public function get tutorialUI() : TutorialUI
      {
         return var_129;
      }
      
      private function onHabboToolbarEvent(param1:HabboToolbarEvent) : void
      {
         if(param1.type == HabboToolbarEvent.const_85)
         {
            setHabboToolbarIcon();
            return;
         }
         if(param1.type == HabboToolbarEvent.const_59)
         {
            if(param1.iconId == HabboToolbarIconEnum.HELP)
            {
               toggleHelpUI();
               return;
            }
         }
      }
      
      public function get hotelMergeUI() : HotelMergeUI
      {
         return var_570;
      }
      
      private function onRoomSessionManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var _loc3_:IRoomSessionManager = IRoomSessionManager(param2);
         _loc3_.events.addEventListener(RoomSessionEvent.const_96,onRoomSessionEvent);
         _loc3_.events.addEventListener(RoomSessionEvent.const_101,onRoomSessionEvent);
         var_190.events.addEventListener(HabboToolbarEvent.const_85,onHabboToolbarEvent);
         var_190.events.addEventListener(HabboToolbarEvent.const_59,onHabboToolbarEvent);
         createHelpUI();
         setHabboToolbarIcon();
      }
      
      public function showCallForHelpReply(param1:String) : void
      {
         if(var_57 != null)
         {
            var_57.showCallForHelpReply(param1);
         }
      }
      
      public function getConfigurationKey(param1:String, param2:String = null, param3:Dictionary = null) : String
      {
         if(var_679 == null)
         {
            return param1;
         }
         return var_679.getKey(param1,param2,param3);
      }
   }
}
