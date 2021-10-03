package com.sulake.core.assets.loaders
{
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.media.Sound;
   import flash.net.URLRequest;
   
   public class SoundFileLoader extends AssetLoaderEventBroker implements IAssetLoader
   {
       
      
      protected var var_17:Sound;
      
      protected var var_935:String;
      
      protected var _type:String;
      
      public function SoundFileLoader(param1:String, param2:URLRequest = null)
      {
         super();
         var_935 = param2 == null ? "" : param2.url;
         _type = param1;
         var_17 = new Sound(null,null);
         var_17.addEventListener(Event.ID3,loadEventHandler);
         var_17.addEventListener(Event.OPEN,loadEventHandler);
         var_17.addEventListener(Event.COMPLETE,loadEventHandler);
         var_17.addEventListener(IOErrorEvent.IO_ERROR,loadEventHandler);
         var_17.addEventListener(ProgressEvent.PROGRESS,loadEventHandler);
         if(param2 != null)
         {
            this.load(param2);
         }
      }
      
      public function get bytesTotal() : uint
      {
         return var_17.bytesTotal;
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            var_17.removeEventListener(Event.ID3,loadEventHandler);
            var_17.removeEventListener(Event.OPEN,loadEventHandler);
            var_17.removeEventListener(Event.COMPLETE,loadEventHandler);
            var_17.removeEventListener(IOErrorEvent.IO_ERROR,loadEventHandler);
            var_17.removeEventListener(ProgressEvent.PROGRESS,loadEventHandler);
            var_17 = null;
            _type = null;
            var_935 = null;
            super.dispose();
         }
      }
      
      public function load(param1:URLRequest) : void
      {
         var_935 = param1.url;
         var_17.load(param1,null);
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
         return var_17;
      }
   }
}
