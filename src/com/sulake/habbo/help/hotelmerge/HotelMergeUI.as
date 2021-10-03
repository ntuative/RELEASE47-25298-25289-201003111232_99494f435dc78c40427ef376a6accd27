package com.sulake.habbo.help.hotelmerge
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.ICoreWindowManager;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.avatar.ChangeUserNameResultMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.avatar.CheckUserNameResultMessageEvent;
   import com.sulake.habbo.communication.messages.outgoing.avatar.ChangeUserNameMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.avatar.CheckUserNameMessageComposer;
   import com.sulake.habbo.communication.messages.parser.avatar.ChangeUserNameResultMessageParser;
   import com.sulake.habbo.communication.messages.parser.avatar.CheckUserNameResultMessageParser;
   import com.sulake.habbo.help.HabboHelp;
   import com.sulake.habbo.help.INameChangeUI;
   import com.sulake.habbo.help.tutorial.TutorialNameChangeView;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import flash.display.BitmapData;
   import flash.events.Event;
   
   public class HotelMergeUI implements INameChangeUI
   {
      
      private static const const_766:String = "tutorial_button_changename";
      
      private static const const_767:String = "hotel_merge_name_change_view";
      
      private static const const_1076:String = "tutorial_button_changename_over";
       
      
      private var var_304:TutorialNameChangeView;
      
      private var _window:IFrameWindow;
      
      private var _button:IBitmapWrapperWindow;
      
      private var var_130:HabboHelp;
      
      private var var_1025:IWindow;
      
      public function HotelMergeUI(param1:HabboHelp)
      {
         super();
         var_130 = param1;
      }
      
      public function checkName(param1:String) : void
      {
         _window.visible = false;
         var_130.sendMessage(new CheckUserNameMessageComposer(param1));
      }
      
      public function get assets() : IAssetLibrary
      {
         return var_130.assets;
      }
      
      private function setButtonImage(param1:String) : void
      {
         if(!_button || !var_130 || true)
         {
            return;
         }
         var _loc2_:BitmapDataAsset = var_130.assets.getAssetByName(param1) as BitmapDataAsset;
         if(!_loc2_)
         {
            return;
         }
         var _loc3_:BitmapData = _loc2_.content as BitmapData;
         if(!_loc3_)
         {
            return;
         }
         if(false)
         {
            _button.bitmap.dispose();
         }
         _button.bitmap = new BitmapData(_button.width,_button.height,true,0);
         _button.bitmap.draw(_loc3_);
      }
      
      public function onChangeUserNameResult(param1:ChangeUserNameResultMessageEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:ChangeUserNameResultMessageParser = param1.getParser();
         if(_loc2_.resultCode == ChangeUserNameResultMessageEvent.var_616)
         {
            var_304.dispose();
            disposeWindow();
         }
         else
         {
            _window.visible = true;
            var_304.setNameNotAvailableView(_loc2_.resultCode,_loc2_.name,_loc2_.nameSuggestions);
         }
      }
      
      public function get myName() : String
      {
         return var_130.ownUserName;
      }
      
      public function get localization() : IHabboLocalizationManager
      {
         return var_130.localization;
      }
      
      public function showView(param1:String) : void
      {
         if(param1 == const_767)
         {
            if(var_304)
            {
               var_304.dispose();
            }
            var_304 = new TutorialNameChangeView(this);
            if(var_1025)
            {
               var_1025.visible = false;
            }
            _window.content.addChild(var_304.view);
            _window.resizeToFitContent();
         }
         else
         {
            disposeWindow();
         }
      }
      
      public function startNameChange() : void
      {
         _window = method_1("hotel_merge_name_change") as IFrameWindow;
         if(!_window)
         {
            return;
         }
         _window.center();
         _window.procedure = windowEventHandler;
         var_1025 = _window.findChildByName("main_border");
         _button = _window.findChildByName("button_image") as IBitmapWrapperWindow;
         setButtonImage(const_766);
      }
      
      public function dispose() : void
      {
         if(var_304)
         {
            var_304.dispose();
            var_304 = null;
         }
         var_1025 = null;
         _button = null;
         disposeWindow();
         var_130 = null;
      }
      
      private function windowEventHandler(param1:WindowEvent, param2:IWindow) : void
      {
         if(!param1 || !param2)
         {
            return;
         }
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            switch(param2.name)
            {
               case "header_button_close":
                  disposeWindow();
                  break;
               case "button_image":
                  showView(const_767);
            }
         }
         if(param2.name == "button_image")
         {
            if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
            {
               setButtonImage(const_1076);
            }
            else if(param1.type == WindowMouseEvent.const_29)
            {
               setButtonImage(const_766);
            }
         }
      }
      
      public function changeName(param1:String) : void
      {
         _window.visible = false;
         var_130.sendMessage(new ChangeUserNameMessageComposer(param1));
      }
      
      private function disposeWindow(param1:WindowEvent = null) : void
      {
         if(_window != null)
         {
            _window.dispose();
            _window = null;
         }
      }
      
      public function method_1(param1:String, param2:uint = 1) : IWindow
      {
         if(var_130 == null || true)
         {
            return null;
         }
         var _loc3_:XmlAsset = XmlAsset(var_130.assets.getAssetByName(param1 + "_xml"));
         if(_loc3_ == null || true)
         {
            return null;
         }
         var _loc4_:ICoreWindowManager = ICoreWindowManager(var_130.windowManager);
         return _loc4_.buildFromXML(XML(_loc3_.content),param2);
      }
      
      public function onCheckUserNameResult(param1:CheckUserNameResultMessageEvent) : void
      {
         if(!param1 || !_window)
         {
            return;
         }
         _window.visible = true;
         var _loc2_:CheckUserNameResultMessageParser = param1.getParser();
         if(_loc2_.resultCode == ChangeUserNameResultMessageEvent.var_616)
         {
            var_304.checkedName = _loc2_.name;
         }
         else
         {
            var_304.setNameNotAvailableView(_loc2_.resultCode,_loc2_.name,_loc2_.nameSuggestions);
         }
      }
      
      public function onUserNameChanged(param1:String) : void
      {
         var name:String = param1;
         var_130.localization.registerParameter("help.tutorial.name.changed","name",name);
         var_130.windowManager.alert("${generic.notice}","${help.tutorial.name.changed}",0,function(param1:IAlertDialog, param2:Event):void
         {
            param1.dispose();
         });
      }
   }
}
