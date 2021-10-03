package com.sulake.core.assets.loaders
{
   import flash.events.Event;
   import flash.events.HTTPStatusEvent;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLRequest;
   import flash.net.URLStream;
   
   public class ZipFileLoader extends AssetLoaderEventBroker implements IAssetLoader
   {
       
      
      protected var var_106:URLStream;
      
      protected var var_935:String;
      
      protected var _type:String;
      
      public function ZipFileLoader(param1:String, param2:URLRequest = null)
      {
         super();
         var_935 = param2 == null ? "" : param2.url;
         _type = param1;
         var_106 = new URLStream();
         var_106.addEventListener(Event.COMPLETE,loadEventHandler);
         var_106.addEventListener(HTTPStatusEvent.HTTP_STATUS,loadEventHandler);
         var_106.addEventListener(IOErrorEvent.IO_ERROR,loadEventHandler);
         var_106.addEventListener(Event.OPEN,loadEventHandler);
         var_106.addEventListener(ProgressEvent.PROGRESS,loadEventHandler);
         var_106.addEventListener(SecurityErrorEvent.SECURITY_ERROR,loadEventHandler);
         if(param2 != null)
         {
            this.load(param2);
         }
      }
      
      public function get bytesTotal() : uint
      {
         return var_106.bytesAvailable;
      }
      
      override public function dispose() : void
      {
         if(!_disposed)
         {
            super.dispose();
            var_106.removeEventListener(Event.COMPLETE,loadEventHandler);
            var_106.removeEventListener(HTTPStatusEvent.HTTP_STATUS,loadEventHandler);
            var_106.removeEventListener(IOErrorEvent.IO_ERROR,loadEventHandler);
            var_106.removeEventListener(Event.OPEN,loadEventHandler);
            var_106.removeEventListener(ProgressEvent.PROGRESS,loadEventHandler);
            var_106.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,loadEventHandler);
            var_106.close();
            var_106 = null;
            _type = null;
            var_935 = null;
         }
      }
      
      public function load(param1:URLRequest) : void
      {
         var_935 = param1.url;
         var_106.load(param1);
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
         return var_106.bytesAvailable;
      }
      
      public function get content() : Object
      {
         return var_106;
      }
   }
}
