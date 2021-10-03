package com.sulake.core.assets.loaders
{
   import flash.events.Event;
   import flash.events.HTTPStatusEvent;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLLoader;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   
   public class BinaryFileLoader extends AssetLoaderEventBroker implements IAssetLoader
   {
       
      
      protected var var_17:URLLoader;
      
      protected var var_935:String;
      
      protected var _type:String;
      
      public function BinaryFileLoader(param1:String, param2:URLRequest = null)
      {
         super();
         var_935 = param2 == null ? "" : param2.url;
         _type = param1;
         var_17 = new URLLoader();
         var_17.addEventListener(Event.COMPLETE,loadEventHandler);
         var_17.addEventListener(Event.UNLOAD,loadEventHandler);
         var_17.addEventListener(HTTPStatusEvent.HTTP_STATUS,loadEventHandler);
         var_17.addEventListener(ProgressEvent.PROGRESS,loadEventHandler);
         var_17.addEventListener(IOErrorEvent.IO_ERROR,loadEventHandler);
         var_17.addEventListener(SecurityErrorEvent.SECURITY_ERROR,loadEventHandler);
         if(param2 != null)
         {
            this.load(param2);
         }
      }
      
      public function get bytesTotal() : uint
      {
         return var_17.bytesTotal;
      }
      
      public function load(param1:URLRequest) : void
      {
         var_935 = param1.url;
         var_17.dataFormat = _type == "application/octet-stream" ? "null" : URLLoaderDataFormat.TEXT;
         var_17.load(param1);
      }
      
      override public function dispose() : void
      {
         if(!_disposed)
         {
            super.dispose();
            var_17.removeEventListener(Event.COMPLETE,loadEventHandler);
            var_17.removeEventListener(Event.UNLOAD,loadEventHandler);
            var_17.removeEventListener(HTTPStatusEvent.HTTP_STATUS,loadEventHandler);
            var_17.removeEventListener(ProgressEvent.PROGRESS,loadEventHandler);
            var_17.removeEventListener(IOErrorEvent.IO_ERROR,loadEventHandler);
            var_17.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,loadEventHandler);
            var_17.close();
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
         return var_17.bytesLoaded;
      }
      
      public function get content() : Object
      {
         return var_17.data;
      }
   }
}
