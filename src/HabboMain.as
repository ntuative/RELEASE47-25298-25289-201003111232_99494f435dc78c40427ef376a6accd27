package
{
   import com.sulake.core.Core;
   import com.sulake.core.assets.AssetLoaderStruct;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.assets.loaders.AssetLoaderEvent;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.ICore;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.ProgressEvent;
   import flash.external.ExternalInterface;
   import flash.net.URLRequest;
   
   public class HabboMain extends Sprite
   {
      
      private static const const_6:Number = 0.29;
      
      private static const const_24:Number = 0.71;
       
      
      private var var_1110:Boolean = false;
      
      private var var_1:DisplayObjectContainer;
      
      private var var_34:ICore;
      
      public function HabboMain(param1:DisplayObjectContainer)
      {
         super();
         var_1 = param1;
         var_1.addEventListener(Event.COMPLETE,onCompleteEvent);
         var_1.addEventListener(ProgressEvent.PROGRESS,onProgressEvent);
         addEventListener(Event.ADDED_TO_STAGE,onAddedToStage);
         addEventListener(Event.ENTER_FRAME,onEnterFrame);
         Logger.log("Core version: undefined");
      }
      
      private function updateLoadingBar(param1:DisplayObjectContainer, param2:Number) : void
      {
         var _loc7_:Sprite = param1.getChildByName(Habbo.LOADING_BAR) as Sprite;
         var _loc8_:Sprite = _loc7_.getChildByName(Habbo.const_5) as Sprite;
         _loc8_.x = 1 + 1;
         _loc8_.y = 1 + 1;
         _loc8_.graphics.clear();
         var _loc9_:int = 16;
         var _loc10_:int = 196 * param2;
         _loc8_.graphics.beginFill(12241619);
         _loc8_.graphics.drawRect(0,0,_loc10_,_loc9_ / 2);
         _loc8_.graphics.endFill();
         _loc8_.graphics.beginFill(9216429);
         _loc8_.graphics.drawRect(0,_loc9_ / 2,_loc10_,_loc9_ / 2 + 1);
         _loc8_.graphics.endFill();
      }
      
      private function configLoadedHandler(param1:AssetLoaderEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         _loc2_ = param1.target as AssetLoaderStruct;
         _loc2_.removeEventListener(AssetLoaderEvent.const_33,configLoadedHandler);
         _loc2_.removeEventListener(AssetLoaderEvent.const_45,configLoadedHandler);
         if(param1.type == AssetLoaderEvent.const_33)
         {
            _loc3_ = var_34.assets.getAssetByName(_loc2_.assetName) as XmlAsset;
            _loc4_ = _loc3_.content as XML;
            var_34.readConfigDocument(_loc4_,var_1);
         }
         else
         {
            var_34.error("Failed to download external configuration document " + _loc2_.assetLoader.url + "!",true,Core.const_805);
            var_34.events.dispatchEvent(new Event(Component.COMPONENT_EVENT_ERROR));
         }
      }
      
      private function prepareCore() : void
      {
         trackLoginStep(Habbo.const_25);
         var_34 = Core.instantiate(stage,0);
         var_34.prepareComponent(CoreCommunicationFrameworkLib);
         var_34.prepareComponent(HabboRoomObjectLogicLib);
         var_34.prepareComponent(HabboRoomObjectVisualizationLib);
         var_34.prepareComponent(RoomManagerLib);
         var_34.prepareComponent(RoomSpriteRendererLib);
         var_34.prepareComponent(HabboRoomSessionManagerLib);
         var_34.prepareComponent(HabboAvatarRenderLib);
         var_34.prepareComponent(HabboRoomWidgetLib);
         var_34.prepareComponent(HabboSessionDataManagerLib);
         var_34.prepareComponent(HabboTrackingLib);
         var_34.prepareComponent(HabboConfigurationCom);
         var_34.prepareComponent(HabboLocalizationCom);
         var_34.prepareComponent(HabboWindowManagerCom);
         var_34.prepareComponent(HabboCommunicationCom);
         var_34.prepareComponent(HabboCommunicationDemoCom);
         var_34.prepareComponent(HabboNavigatorCom);
         var_34.prepareComponent(HabboFriendListCom);
         var_34.prepareComponent(HabboMessengerCom);
         var_34.prepareComponent(HabboInventoryCom);
         var_34.prepareComponent(HabboToolbarCom);
         var_34.prepareComponent(HabboCatalogCom);
         var_34.prepareComponent(HabboRoomEngineCom);
         var_34.prepareComponent(HabboRoomUICom);
         var_34.prepareComponent(HabboAvatarEditorCom);
         var_34.prepareComponent(HabboNotificationsCom);
         var_34.prepareComponent(HabboHelpCom);
         var_34.prepareComponent(HabboAdManagerCom);
         var_34.prepareComponent(HabboModerationCom);
         Logger.log("Sound manager embed...");
         Logger.log("Trying to embed Flash 9 version");
         var_34.prepareComponent(HabboSoundManagerCom);
         var_34.events.addEventListener(Component.COMPONENT_EVENT_ERROR,onCoreError);
         var _loc1_:AssetLoaderStruct = var_34.assets.loadAssetFromFile("config.xml",new URLRequest("config_habbo.xml"));
         _loc1_.addEventListener(AssetLoaderEvent.const_33,configLoadedHandler);
         _loc1_.addEventListener(AssetLoaderEvent.const_45,configLoadedHandler);
      }
      
      public function onCoreError(param1:Event) : void
      {
         trackLoginStep(Habbo.const_26);
      }
      
      private function onProgressEvent(param1:ProgressEvent) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:* = null;
         if(var_1)
         {
            _loc2_ = param1.bytesLoaded / param1.bytesTotal;
            _loc3_ = 1 - const_24 + _loc2_ * const_24;
            updateLoadingBar(var_1,_loc3_);
            _loc4_ = var_1.getChildByName("background") as Sprite;
            if(_loc4_)
            {
               _loc4_.alpha = Math.min(1 - _loc3_,_loc4_.alpha);
            }
         }
      }
      
      private function initializeCore() : void
      {
         try
         {
            var_34.initialize();
         }
         catch(error:Error)
         {
            trackLoginStep(Habbo.const_26);
            Core.crash("Failed to initialize the core: " + error.message,Core.const_792,error);
         }
      }
      
      protected function onAddedToStage(param1:Event = null) : void
      {
         var event:Event = param1;
         try
         {
            prepareCore();
         }
         catch(error:Error)
         {
            trackLoginStep(Habbo.const_26);
            Habbo.reportCrash("Failed to prepare the core: " + error.message,Core.const_792,error);
            Core.dispose();
         }
      }
      
      private function onEnterFrame(param1:Event) : void
      {
         var _loc2_:* = null;
         if(var_1)
         {
            _loc2_ = var_1.getChildByName("background") as Sprite;
            if(_loc2_)
            {
               _loc2_.alpha -= 0.01;
               if(_loc2_.alpha <= 0)
               {
               }
            }
            if(var_1110)
            {
               if(true)
               {
                  dispose();
                  var_1110 = false;
               }
               else
               {
                  var_1.alpha = -0.1;
               }
            }
         }
      }
      
      private function trackLoginStep(param1:String) : void
      {
         if(loaderInfo)
         {
            if(loaderInfo.parameters["processlog.enabled"] == "1")
            {
               Logger.log("* HabboMain Login Step: " + param1);
               if(false)
               {
                  ExternalInterface.call("FlashExternalInterface.logLoginStep",param1);
               }
               else
               {
                  Logger.log("HabboMain: ExternalInterface is not available, tracking is disabled");
               }
            }
         }
      }
      
      private function onCompleteEvent(param1:Event) : void
      {
         updateLoadingBar(var_1,1);
         initializeCore();
         var_1110 = true;
      }
      
      private function dispose() : void
      {
         removeEventListener(Event.ADDED_TO_STAGE,onAddedToStage);
         removeEventListener(Event.ENTER_FRAME,onEnterFrame);
         if(var_1)
         {
            var_1.removeEventListener(Event.COMPLETE,onCompleteEvent);
            var_1.removeEventListener(ProgressEvent.PROGRESS,onProgressEvent);
            var_1 = null;
         }
         if(parent)
         {
            parent.removeChild(this);
         }
      }
   }
}
