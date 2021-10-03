package com.sulake.core.utils
{
   import deng.fzip.FZip;
   import flash.display.LoaderInfo;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.net.URLRequest;
   import flash.system.LoaderContext;
   import flash.utils.getQualifiedClassName;
   
   public class ZipLoader extends LibraryLoader
   {
       
      
      private var var_412:FZip;
      
      private var var_1288:Array;
      
      private var var_2098:uint = 0;
      
      private var var_877:int = 0;
      
      private var var_2379:Array;
      
      public function ZipLoader(param1:Boolean)
      {
         super(param1);
         var_1288 = new Array();
      }
      
      private function onIOError(param1:IOErrorEvent) : void
      {
         Logger.log(param1.text);
         dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,0));
      }
      
      public function get resources() : Array
      {
         return var_1288;
      }
      
      private function onLoaderComplete(param1:Event) : void
      {
         var _loc2_:LoaderInfo = param1.target as LoaderInfo;
         var _loc3_:String = getQualifiedClassName(var_17.content);
         var_1288.push(var_17.contentLoaderInfo.applicationDomain.getDefinition(_loc3_));
         ++var_877;
         if(var_1288.length == var_2098)
         {
            var_17.contentLoaderInfo.removeEventListener(Event.COMPLETE,onLoaderComplete);
            var_17.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,onIOError);
            dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,0));
         }
         else
         {
            var_17.loadBytes(var_412.getFileAt(var_877).content);
         }
      }
      
      override public function load(param1:URLRequest, param2:LoaderContext = null, param3:int = 1) : void
      {
         var_324 = param1;
         if(var_412)
         {
            var_412.close();
         }
         var_412 = new FZip();
         var_412.addEventListener(Event.COMPLETE,onComplete);
         var_412.addEventListener(IOErrorEvent.IO_ERROR,onIOError);
         var_412.addEventListener(ProgressEvent.PROGRESS,onProgress);
         var_412.load(var_324);
      }
      
      private function onProgress(param1:ProgressEvent) : void
      {
         dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_PROGRESS,0));
      }
      
      private function onComplete(param1:Event) : void
      {
         var_877 = 0;
         var_2098 = var_412.getFileCount();
         removeEventListeners();
         var_17.contentLoaderInfo.addEventListener(Event.COMPLETE,onLoaderComplete);
         var_17.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,onIOError);
         var_17.loadBytes(var_412.getFileAt(var_877).content);
      }
   }
}
