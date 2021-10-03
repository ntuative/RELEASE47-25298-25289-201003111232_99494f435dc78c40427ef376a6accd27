package com.sulake.habbo.help.help
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.ICoreWindowManager;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.utils.Dictionary;
   
   public class HelpViewController implements IHelpViewController
   {
       
      
      private var _container:IWindowContainer;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var _disposed:Boolean = true;
      
      private var _main:HelpUI;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_1896:Boolean = false;
      
      public function HelpViewController(param1:HelpUI, param2:IHabboWindowManager, param3:IAssetLibrary)
      {
         super();
         _main = param1;
         _windowManager = param2;
         _assetLibrary = param3;
      }
      
      public function get container() : IWindowContainer
      {
         return _container;
      }
      
      public function windowProcedure(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         _main.windowProcedure(param1,param2);
      }
      
      public function update(param1:* = null) : void
      {
      }
      
      public function set container(param1:IWindowContainer) : void
      {
         _container = param1;
      }
      
      public function render() : void
      {
         _disposed = false;
      }
      
      public function set disposed(param1:Boolean) : void
      {
         _disposed = param1;
      }
      
      public function set roomSessionActive(param1:Boolean) : void
      {
         var_1896 = param1;
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         return _windowManager;
      }
      
      public function method_1(param1:String) : IWindow
      {
         var _loc2_:XmlAsset = XmlAsset(_assetLibrary.getAssetByName(param1 + "_xml"));
         if(_loc2_ == null || _windowManager == null)
         {
            return null;
         }
         var _loc3_:ICoreWindowManager = ICoreWindowManager(_windowManager);
         return _loc3_.buildFromXML(XML(_loc2_.content));
      }
      
      public function get roomSessionActive() : Boolean
      {
         return var_1896;
      }
      
      public function getText(param1:String) : String
      {
         if(_main == null)
         {
            return null;
         }
         return _main.getText(param1);
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         if(_container != null)
         {
            _container.dispose();
            _container = null;
         }
         _disposed = true;
      }
      
      public function get assetLibrary() : IAssetLibrary
      {
         return _assetLibrary;
      }
      
      public function get main() : HelpUI
      {
         return _main;
      }
      
      public function getWindowContainer() : IWindowContainer
      {
         return _container;
      }
      
      public function getConfigurationKey(param1:String, param2:String = null, param3:Dictionary = null) : String
      {
         if(_main == null)
         {
            return null;
         }
         return _main.getConfigurationKey(param1,param2,param3);
      }
   }
}
