package com.sulake.core.runtime
{
   import com.sulake.core.Core;
   import com.sulake.core.assets.AssetLibrary;
   import com.sulake.core.assets.AssetTypeDeclaration;
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.runtime.events.ErrorEvent;
   import com.sulake.core.runtime.exceptions.InvalidComponentException;
   import com.sulake.core.utils.LibraryLoader;
   import com.sulake.core.utils.LibraryLoaderEvent;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.net.URLRequest;
   import flash.system.ApplicationDomain;
   import flash.system.LoaderContext;
   import flash.utils.ByteArray;
   import flash.utils.getDefinitionByName;
   import flash.utils.getQualifiedClassName;
   
   public class ComponentContext extends Component implements IContext
   {
       
      
      protected var var_242:Array;
      
      protected var var_370:Array;
      
      protected var _debug:Boolean = false;
      
      protected var var_287:Array;
      
      protected var var_207:DisplayObjectContainer;
      
      public function ComponentContext(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         super(this,param2 | 0,param3);
         var_207 = new Sprite();
         var_287 = new Array();
         var_370 = new Array();
      }
      
      public function error(param1:String, param2:Boolean, param3:int = -1, param4:Error = null) : void
      {
         var_930 = param1;
         if(events == null)
         {
            trace("Failed to dispatch an error because events was null. Message: " + param1);
         }
         else
         {
            events.dispatchEvent(new ErrorEvent(Component.COMPONENT_EVENT_ERROR,param1,param2));
         }
      }
      
      protected function removeLibraryLoader(param1:LibraryLoader) : void
      {
         param1.removeEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,loadReadyHandler,false);
         param1.removeEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,loadReadyHandler,false);
         var _loc2_:int = 0;
         while(_loc2_ < var_242.length)
         {
            if(var_242[_loc2_] == param1)
            {
               var_242.splice(_loc2_,1);
               break;
            }
            _loc2_++;
         }
      }
      
      protected final function announceInterfaceAvailability(param1:IID, param2:Component) : void
      {
         var _loc4_:* = null;
         var _loc3_:ComponentInterfaceQueue = this.getQueueForInterface(param1);
         if(_loc3_ == null)
         {
            return;
         }
         var _loc5_:uint = _loc3_.receivers.length;
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            _loc4_ = param2.queueInterface(param1);
            if(_loc4_ == null)
            {
               error("Interface " + param1 + " still unavailabe!",true,Core.const_1230);
            }
            _loc3_.receivers.pop()(param1,_loc4_);
            _loc6_++;
         }
      }
      
      public function prepareAssetLibrary(param1:XML, param2:Class) : Boolean
      {
         return _assets.loadFromResource(param1,param2);
      }
      
      public final function loadFromFile(param1:URLRequest, param2:LoaderContext) : LibraryLoader
      {
         if(var_242 == null)
         {
            var_242 = new Array();
         }
         var _loc3_:int = 0;
         while(_loc3_ < var_242.length)
         {
            if(var_242[_loc3_].url == param1.url)
            {
               return var_242[_loc3_].loadFromFile(param1);
            }
            _loc3_++;
         }
         var _loc4_:LibraryLoader = new LibraryLoader(_debug);
         _loc4_.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,loadReadyHandler,false);
         _loc4_.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,loadErrorHandler,false);
         _loc4_.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_DEBUG,loadDebugHandler,false);
         _loc4_.load(param1,param2);
         var_242.push(_loc4_);
         return _loc4_;
      }
      
      protected function debug(param1:String) : void
      {
         var_2268 = param1;
         if(_debug)
         {
            _events.dispatchEvent(new Event(Component.COMPONENT_EVENT_DEBUG));
         }
      }
      
      override public function toXMLString(param1:uint = 0) : String
      {
         var _loc6_:* = null;
         var _loc10_:* = null;
         var _loc2_:* = "";
         var _loc3_:int = 0;
         while(_loc3_ < param1)
         {
            _loc2_ += "\t";
            _loc3_++;
         }
         var _loc4_:String = getQualifiedClassName(this);
         var _loc5_:String = "";
         _loc5_ += _loc2_ + "<context class=\"" + _loc4_ + "\" >\n";
         var _loc7_:Array = new Array();
         var _loc8_:uint = var_179.mapStructsByImplementor(this,_loc7_);
         var _loc9_:int = 0;
         while(_loc9_ < _loc8_)
         {
            _loc6_ = _loc7_[_loc9_];
            _loc5_ += _loc2_ + "\t<interface iid=\"" + _loc6_.iis + "\" refs=\"" + _loc6_.references + "\"/>\n";
            _loc9_++;
         }
         var _loc11_:int = 0;
         while(_loc11_ < var_287.length)
         {
            _loc10_ = var_287[_loc11_] as Component;
            if(_loc10_ != this)
            {
               _loc5_ += _loc10_.toXMLString(param1 + 1);
            }
            _loc11_++;
         }
         return _loc5_ + (_loc2_ + "</context>\n");
      }
      
      protected final function addQueueeForInterface(param1:IID, param2:Function) : void
      {
         var _loc3_:* = null;
         if(hasQueueForInterface(param1))
         {
            _loc3_ = getQueueForInterface(param1);
         }
         else
         {
            _loc3_ = new ComponentInterfaceQueue(param1);
            var_370.push(_loc3_);
         }
         _loc3_.receivers.splice(0,0,param2);
      }
      
      override public function dispose() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         if(!disposed)
         {
            super.dispose();
            if(var_287 != null)
            {
               _loc1_ = 0;
               while(_loc1_-- > 0)
               {
                  IUnknown(var_287.pop()).dispose();
               }
               var_287 = null;
            }
            if(var_370 != null)
            {
               _loc1_ = 0;
               while(_loc1_-- > 0)
               {
                  IDisposable(var_370.pop()).dispose();
               }
               var_370 = null;
            }
            if(var_242 != null)
            {
               _loc1_ = 0;
               while(_loc1_-- > 0)
               {
                  _loc2_ = var_242[0];
                  removeLibraryLoader(_loc2_);
                  _loc2_.dispose();
               }
               var_242 = null;
            }
         }
      }
      
      public function get displayObjectContainer() : DisplayObjectContainer
      {
         return var_207;
      }
      
      protected final function getQueueForInterface(param1:IID) : ComponentInterfaceQueue
      {
         var _loc3_:* = null;
         var _loc2_:String = getQualifiedClassName(param1);
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = var_370[_loc5_];
            if(getQualifiedClassName(_loc3_.identifier) == _loc2_)
            {
               return _loc3_;
            }
            _loc5_++;
         }
         return null;
      }
      
      protected final function loadReadyHandler(param1:LibraryLoaderEvent) : void
      {
         var _loc2_:LibraryLoader = param1.target as LibraryLoader;
         removeLibraryLoader(_loc2_);
         prepareComponent(_loc2_.resource,Component.COMPONENT_FLAG_NULL,_loc2_.domain);
      }
      
      protected final function hasQueueForInterface(param1:IID) : Boolean
      {
         var _loc2_:String = getQualifiedClassName(param1);
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if(getQualifiedClassName(var_370[_loc4_].identifier) == _loc2_)
            {
               return true;
            }
            _loc4_++;
         }
         return false;
      }
      
      protected function loadErrorHandler(param1:LibraryLoaderEvent) : void
      {
         var _loc2_:LibraryLoader = param1.target as LibraryLoader;
         var _loc3_:String = _loc2_.getLastErrorMessage();
         removeLibraryLoader(_loc2_);
         error("Failed to download component resource \"" + _loc2_.url + "\"!" + "\r" + _loc3_,true,Core.const_1155);
      }
      
      public final function detachComponent(param1:Component) : void
      {
         var _loc2_:* = null;
         var _loc3_:int = var_179.getIndexByImplementor(param1);
         while(_loc3_ > -1)
         {
            _loc2_ = var_179.remove(_loc3_);
            _loc3_ = var_179.getIndexByImplementor(param1);
         }
         var _loc4_:int = 0;
         while(_loc4_ < var_287.length)
         {
            if(var_287[_loc4_] == param1)
            {
               var_287.splice(_loc4_,1);
               return;
            }
            _loc4_++;
         }
      }
      
      public final function prepareComponent(param1:Class, param2:uint = 0, param3:ApplicationDomain = null) : Boolean
      {
         var manifest:XML = null;
         var component:Component = null;
         var componentClass:Class = null;
         var componentString:String = null;
         var interfaceList:XMLList = null;
         var interfaceClass:Class = null;
         var interfaceString:String = null;
         var iid:IID = null;
         var iidList:Array = null;
         var iidClass:Class = null;
         var iidString:String = null;
         var item:XML = null;
         var version:String = null;
         var unknown:IUnknown = null;
         var source:Object = null;
         var bytes:ByteArray = null;
         var assetList:XMLList = null;
         var assetNode:XML = null;
         var assetName:String = null;
         var assetType:AssetTypeDeclaration = null;
         var asset:IAsset = null;
         var assetCount:uint = 0;
         var assetLibrary:IAssetLibrary = null;
         var k:uint = 0;
         var j:uint = 0;
         var resource:Class = param1;
         var flags:uint = param2;
         var domain:ApplicationDomain = param3;
         if(domain == null)
         {
            domain = ApplicationDomain.currentDomain;
         }
         try
         {
            source = (resource as Object).manifest;
            if(source is XML)
            {
               manifest = source as XML;
            }
            else if(source is Class)
            {
               bytes = new (source as Class)() as ByteArray;
               manifest = new XML(bytes.readUTFBytes(bytes.length));
            }
         }
         catch(e:Error)
         {
            manifest = null;
         }
         if(manifest == null)
         {
            Logger.log("Failed to find embedded manifest.xml in " + resource + "!");
            return false;
         }
         var componentList:XMLList = manifest.child("component");
         var i:uint = 0;
         while(i < componentList.length())
         {
            item = componentList[i];
            version = item.attribute("version");
            assetList = item.child("assets");
            assetCount = assetList.length();
            assetLibrary = null;
            if(assetCount > 0)
            {
               assetList = assetList.child("asset");
               assetCount = assetList.length();
               assetLibrary = new AssetLibrary("_assets@" + componentString);
               k = 0;
               while(k < assetCount)
               {
                  assetNode = assetList[k];
                  assetName = assetNode.attribute("name");
                  assetType = assetLibrary.getAssetTypeDeclarationByMimeType(assetNode.attribute("mimeType"));
                  asset = new assetType.assetClass(assetType);
                  asset.setUnknownContent(resource[assetName]);
                  if(!assetLibrary.setAsset(assetName,asset))
                  {
                     error("Manifest for component " + componentString + " contains broken asset \"" + assetName + "\"!",true,Core.const_730);
                  }
                  k++;
               }
            }
            componentString = item.attribute("class");
            componentClass = domain.getDefinition(componentString) as Class;
            if(componentClass == null)
            {
               componentClass = getDefinitionByName(componentString) as Class;
            }
            if(componentClass == null)
            {
               error("Invalid component class " + componentString + "!",true,Core.const_730);
               return false;
            }
            component = assetLibrary == null ? new componentClass(this,flags) : new componentClass(this,flags,assetLibrary);
            if(component != null)
            {
               if(assetLibrary != null)
               {
                  if(component.assets != assetLibrary)
                  {
                     assetLibrary.dispose();
                     error("Component \"" + componentString + "\" did not save provided asset library!",true,Core.const_730);
                  }
               }
               interfaceList = item.child("interface");
               iidList = new Array();
               j = 0;
               while(j < interfaceList.length())
               {
                  iidString = interfaceList[j].attribute("iid");
                  iidClass = domain.getDefinition(iidString) as Class;
                  if(iidClass == null)
                  {
                     iidClass = getDefinitionByName(iidString) as Class;
                  }
                  if(iidClass == null)
                  {
                     throw new InvalidComponentException("Identifier class defined in manifest not found: " + iidString);
                  }
                  iid = new iidClass();
                  unknown = component as IUnknown;
                  component.iids.insert(new InterfaceStruct(iid,component));
                  iidList.push(iid);
                  j++;
               }
               attachComponent(component,iidList);
            }
            i++;
         }
         return true;
      }
      
      override public function queueInterface(param1:IID, param2:Function = null) : IUnknown
      {
         var _loc3_:InterfaceStruct = var_179.getStructByInterface(param1);
         if(_loc3_ != null)
         {
            return _loc3_.unknown.queueInterface(param1,param2);
         }
         if(param2 != null)
         {
            addQueueeForInterface(param1,param2);
         }
         return null;
      }
      
      public final function attachComponent(param1:Component, param2:Array) : void
      {
         var _loc3_:int = 0;
         var _loc5_:* = null;
         var _loc6_:* = null;
         if(var_287.indexOf(param1) > -1)
         {
            error("Component " + param1 + " already attached to context!",false);
            return;
         }
         var_287.push(param1);
         var _loc4_:uint = param2.length;
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            _loc5_ = param2[_loc3_];
            if(param1.iids.find(_loc5_) == null)
            {
               param1.iids.insert(new InterfaceStruct(_loc5_,param1));
            }
            var_179.insert(new InterfaceStruct(_loc5_,param1));
            _loc3_++;
         }
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            _loc6_ = param2[_loc3_];
            if(hasQueueForInterface(_loc6_))
            {
               announceInterfaceAvailability(_loc6_,param1);
            }
            _loc3_++;
         }
      }
      
      protected function loadDebugHandler(param1:LibraryLoaderEvent) : void
      {
         var _loc2_:LibraryLoader = param1.target as LibraryLoader;
         var _loc3_:String = _loc2_.getLastDebugMessage();
         debug(_loc3_);
      }
   }
}
