package com.sulake.habbo.catalog.viewer
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.room.IGetImageListener;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.room.ISelectedRoomObjectData;
   import com.sulake.habbo.room.ImageResult;
   import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
   import com.sulake.habbo.room.object.RoomObjectOperationEnum;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   
   public class CatalogObjectMover implements IGetImageListener
   {
      
      private static const const_340:String = "CatalogOverlaySprite";
       
      
      private var _mainContainer:IWindowContainer;
      
      private var var_35:Boolean = false;
      
      private var _roomEngine:IRoomEngine;
      
      public function CatalogObjectMover()
      {
         super();
      }
      
      public function onMainContainerEvent(param1:WindowEvent, param2:IWindow, param3:ISelectedRoomObjectData) : void
      {
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:* = null;
         if(_roomEngine == null)
         {
            return;
         }
         _loc4_ = param1 as WindowMouseEvent;
         switch(param1.type)
         {
            case WindowMouseEvent.const_260:
               if(param3 == null || param3.operation != RoomObjectOperationEnum.OBJECT_PLACE)
               {
                  return;
               }
               _loc5_ = _loc4_.stageX;
               _loc6_ = _loc4_.stageY;
               if(getIconSprite() == null)
               {
                  _loc7_ = getFurniImageResult(param3);
                  if(_loc7_ == null)
                  {
                     return;
                  }
                  createOverlaySprite(_loc7_.data.clone());
               }
               var_35 = true;
               moveOverlaySprite(_loc5_,_loc6_);
               break;
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK:
            case WindowMouseEvent.const_90:
            case WindowMouseEvent.const_454:
            case WindowMouseEvent.const_29:
               releaseOverlaySprite();
               var_35 = false;
         }
      }
      
      public function imageReady(param1:int, param2:BitmapData) : void
      {
      }
      
      private function moveOverlaySprite(param1:int, param2:int) : void
      {
         var _loc3_:Sprite = getIconSprite();
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.x = param1;
         _loc3_.y = param2;
      }
      
      private function releaseOverlaySprite() : void
      {
         if(_mainContainer == null || true || getIconSprite() == null)
         {
            return;
         }
         var _loc1_:Sprite = _mainContainer.desktop.getDisplayObject() as Sprite;
         var _loc2_:Sprite = _loc1_.getChildByName(const_340) as Sprite;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.removeChildAt(0);
         _loc1_.removeChild(_loc1_.getChildByName(const_340));
      }
      
      public function set mainContainer(param1:IWindowContainer) : void
      {
         _mainContainer = param1;
      }
      
      public function get state() : Boolean
      {
         return var_35;
      }
      
      private function getIconSprite() : Sprite
      {
         if(_mainContainer == null || true)
         {
            return null;
         }
         var _loc1_:Sprite = _mainContainer.desktop.getDisplayObject() as Sprite;
         return _loc1_.getChildByName(const_340) as Sprite;
      }
      
      private function getFurniImageResult(param1:ISelectedRoomObjectData) : ImageResult
      {
         if(param1 == null || _roomEngine == null)
         {
            return null;
         }
         if(param1.category == RoomObjectCategoryEnum.const_31)
         {
            return _roomEngine.getFurnitureIcon(param1.typeId,this);
         }
         if(param1.category == RoomObjectCategoryEnum.const_30)
         {
            return _roomEngine.getWallItemIcon(param1.typeId,this,param1.instanceData);
         }
         return null;
      }
      
      public function set roomEngine(param1:IRoomEngine) : void
      {
         _roomEngine = param1;
      }
      
      private function createOverlaySprite(param1:BitmapData) : void
      {
         if(param1 == null || _mainContainer == null || true || getIconSprite() != null)
         {
            return;
         }
         var _loc2_:Sprite = _mainContainer.desktop.getDisplayObject() as Sprite;
         var _loc3_:Sprite = new Sprite();
         _loc3_.name = const_340;
         _loc3_.mouseEnabled = true;
         _loc3_.visible = true;
         var _loc4_:Bitmap = new Bitmap(param1);
         _loc3_.addChild(_loc4_);
         _loc2_.addChild(_loc3_);
      }
      
      public function dispose() : void
      {
         releaseOverlaySprite();
         _mainContainer = null;
         _roomEngine = null;
         var_35 = false;
      }
   }
}
