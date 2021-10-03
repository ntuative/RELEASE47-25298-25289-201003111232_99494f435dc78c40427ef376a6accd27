package com.sulake.core.assets.loaders
{
   import flash.display.Loader;
   import flash.events.Event;
   import flash.events.HTTPStatusEvent;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLRequest;
   import flash.system.LoaderContext;
   
   public class BitmapFileLoader extends AssetLoaderEventBroker implements IAssetLoader
   {
       
      
      protected var var_17:Loader;
      
      protected var var_935:String;
      
      protected var _type:String;
      
      protected var var_1104:LoaderContext;
      
      public function BitmapFileLoader(param1:String, param2:URLRequest = null)
      {
         super();
         var_935 = param2 == null ? "" : param2.url;
         _type = param1;
         var_17 = new Loader();
         var_1104 = new LoaderContext();
         var_1104.checkPolicyFile = true;
         var_17.contentLoaderInfo.addEventListener(Event.COMPLETE,loadEventHandler);
         var_17.contentLoaderInfo.addEventListener(Event.UNLOAD,loadEventHandler);
         var_17.contentLoaderInfo.addEventListener(HTTPStatusEvent.HTTP_STATUS,loadEventHandler);
         var_17.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS,loadEventHandler);
         var_17.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,loadEventHandler);
         var_17.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR,loadEventHandler);
         if(param2 != null && param2.url != null)
         {
            var_17.load(param2,var_1104);
         }
      }
      
      public function get bytesTotal() : uint
      {
         return var_17.contentLoaderInfo.bytesTotal;
      }
      
      public function load(param1:URLRequest) : void
      {
         var_935 = param1.url;
         var_17.load(param1,var_1104);
      }
      
      override public function dispose() : void
      {
         if(!_disposed)
         {
            super.dispose();
            var_17.contentLoaderInfo.removeEventListener(Event.COMPLETE,loadEventHandler);
            var_17.contentLoaderInfo.removeEventListener(Event.UNLOAD,loadEventHandler);
            var_17.contentLoaderInfo.removeEventListener(HTTPStatusEvent.HTTP_STATUS,loadEventHandler);
            var_17.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS,loadEventHandler);
            var_17.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,loadEventHandler);
            var_17.contentLoaderInfo.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,loadEventHandler);
            try
            {
               var_17.close();
            }
            catch(e:*)
            {
            }
            var_17.unload();
            var_17 = null;
            _type = null;
            var_935 = null;
         }
      }
      
      public function get mimeType() : String
      {
         return _type;
      }
      
      public function get url() : String
      {
         return var_935;
      }
      
      public function get bytesLoaded() : uint
      {
         return var_17.contentLoaderInfo.bytesLoaded;
      }
      
      public function get content() : Object
      {
         return var_17.content;
      }
      
      public function get loaderContext() : LoaderContext
      {
         return var_1104;
      }
   }
}
