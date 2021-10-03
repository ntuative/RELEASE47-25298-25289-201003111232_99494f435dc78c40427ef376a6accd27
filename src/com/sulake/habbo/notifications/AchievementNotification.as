package com.sulake.habbo.notifications
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.session.events.BadgeImageReadyEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.display.BitmapData;
   import flash.external.ExternalInterface;
   import flash.geom.Matrix;
   
   public class AchievementNotification
   {
       
      
      private var var_1627:int;
      
      private var var_723:String;
      
      private var var_356:ISessionDataManager;
      
      private var _window:IFrameWindow;
      
      private var var_2158:String;
      
      private var var_189:String;
      
      private var _localizations:IHabboLocalizationManager;
      
      public function AchievementNotification(param1:String, param2:int, param3:IAssetLibrary, param4:IHabboWindowManager, param5:IHabboLocalizationManager, param6:IHabboConfigurationManager, param7:ISessionDataManager)
      {
         var _loc9_:* = null;
         super();
         if(!param3 || !param4 || !param5 || !param6 || !param7)
         {
            return;
         }
         var_723 = param1;
         var_1627 = param2;
         var_356 = param7;
         param7.events.addEventListener(BadgeImageReadyEvent.const_132,onBadgeImageReady);
         var _loc8_:XmlAsset = param3.getAssetByName("achievement_notification_xml") as XmlAsset;
         if(_loc8_ == null)
         {
            return;
         }
         _window = param4.buildFromXML(_loc8_.content as XML) as IFrameWindow;
         if(_window == null)
         {
            return;
         }
         _window.procedure = eventHandler;
         _window.center();
         _localizations = param5;
         registerBadgeParameters("notifications.text.achievement");
         var_189 = param5.getKey("notifications.text.achievement");
         registerBadgeParameters("notifications.text.achievement_facebook");
         var_2158 = param5.getKey("notifications.text.achievement_facebook");
         setText("achievement_info",var_189);
         setImage("badge_image",param7.getBadgeImage(param1));
         if(!param6.keyExists("facebook.user"))
         {
            _loc9_ = _window.findChildByName("post_to_facebook");
            if(_loc9_ != null)
            {
               _loc9_.visible = false;
            }
         }
      }
      
      private function setImage(param1:String, param2:BitmapData) : void
      {
         if(_window == null)
         {
            return;
         }
         var _loc3_:IBitmapWrapperWindow = _window.findChildByName(param1) as IBitmapWrapperWindow;
         if(_loc3_ == null)
         {
            return;
         }
         var _loc4_:BitmapData = new BitmapData(_loc3_.width,_loc3_.height,true,0);
         var _loc5_:int = _loc4_.width * 0.5 - param2.width;
         var _loc6_:int = _loc4_.height * 0.5 - param2.height;
         _loc4_.draw(param2,new Matrix(2,0,0,2,_loc5_,_loc6_));
         _loc3_.bitmap = _loc4_;
      }
      
      private function onBadgeImageReady(param1:BadgeImageReadyEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(param1.badgeId != var_723)
         {
            return;
         }
         setImage("badge_image",param1.badgeImage);
      }
      
      private function setText(param1:String, param2:String) : void
      {
         if(_window == null)
         {
            return;
         }
         var _loc3_:ITextWindow = _window.findChildByName(param1) as ITextWindow;
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.text = param2;
      }
      
      public function dispose() : void
      {
         if(var_356 != null)
         {
            var_356.events.removeEventListener(BadgeImageReadyEvent.const_132,onBadgeImageReady);
            var_356 = null;
         }
         if(_window != null)
         {
            _window.dispose();
            _window = null;
         }
      }
      
      private function eventHandler(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         switch(param2.name)
         {
            case "post_to_facebook":
               if(false)
               {
                  ExternalInterface.call("FlashExternalInterface.postAchievement",var_723,var_2158);
               }
               dispose();
               break;
            case "header_button_close":
            case "close":
               dispose();
               return;
         }
      }
      
      private function registerBadgeParameters(param1:String) : void
      {
         _localizations.registerParameter(param1,"badge_name",_localizations.getKey("badge_name_" + var_723,var_723));
         _localizations.registerParameter(param1,"badge_desc",_localizations.getKey("badge_desc_" + var_723,var_723));
         _localizations.registerParameter(param1,"level",var_1627.toString());
         _localizations.registerParameter(param1,"name",var_356.userName);
         _localizations.registerParameter(param1,"realname",var_356.realName);
      }
   }
}
