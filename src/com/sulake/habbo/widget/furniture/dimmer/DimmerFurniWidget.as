package com.sulake.habbo.widget.furniture.dimmer
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.widget.RoomWidgetBase;
   import com.sulake.habbo.widget.events.RoomWidgetDimmerStateUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetDimmerUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetDimmerUpdateEventPresetItem;
   import com.sulake.habbo.widget.messages.RoomWidgetDimmerChangeStateMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetDimmerPreviewMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetDimmerSavePresetMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.events.IEventDispatcher;
   
   public class DimmerFurniWidget extends RoomWidgetBase
   {
      
      private static const const_1129:Array = new Array(int(76.5),int(76.5));
      
      private static const const_1130:Array = new Array(7665141,21495,15161822,15353138,15923281,8581961,0);
       
      
      private var _view:DimmerView;
      
      private var var_1608:int;
      
      private var var_923:int;
      
      private var _dimmerState:int;
      
      private var _color:uint = 16777215;
      
      private var var_1091:int;
      
      private var var_1092:uint = 255;
      
      private var _presets:Array;
      
      public function DimmerFurniWidget(param1:IHabboWindowManager, param2:IAssetLibrary = null, param3:IHabboLocalizationManager = null)
      {
         super(param1,param2,param3);
      }
      
      private function onHide(param1:RoomWidgetDimmerUpdateEvent) : void
      {
         dispose();
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener(RoomWidgetDimmerUpdateEvent.const_675,onPresets);
         param1.addEventListener(RoomWidgetDimmerUpdateEvent.const_905,onHide);
         param1.addEventListener(RoomWidgetDimmerStateUpdateEvent.const_65,onDimmerState);
         super.registerUpdateEvents(param1);
      }
      
      public function previewCurrentSetting() : void
      {
         var _loc1_:* = null;
         if(_dimmerState == 0)
         {
            return;
         }
         if(messageListener == null)
         {
            return;
         }
         if(!validateBrightness(_view.selectedBrightness,_view.selectedType))
         {
            return;
         }
         _loc1_ = new RoomWidgetDimmerPreviewMessage(colors["null"],_view.selectedBrightness,false);
         messageListener.processWidgetMessage(_loc1_);
      }
      
      private function onDimmerState(param1:RoomWidgetDimmerStateUpdateEvent) : void
      {
         var _loc2_:* = null;
         if(param1 == null)
         {
            return;
         }
         _dimmerState = param1.state;
         var_1608 = param1.presetId;
         var_1091 = param1.effectId;
         _color = param1.color;
         var_1092 = param1.brightness;
         if(_view != null)
         {
            _view.update();
         }
         if(!validateBrightness(var_1092,var_1091))
         {
            return;
         }
         _loc2_ = new RoomWidgetDimmerPreviewMessage(_color,var_1092,var_1091 == 2);
         messageListener.processWidgetMessage(_loc2_);
      }
      
      private function validateBrightness(param1:uint, param2:int) : Boolean
      {
         return true;
      }
      
      private function onPresets(param1:RoomWidgetDimmerUpdateEvent) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var_923 = param1.selectedPresetId - 1;
         _presets = new Array();
         var _loc2_:int = 0;
         while(_loc2_ < param1.presets.length)
         {
            _loc3_ = param1.presets[_loc2_];
            _loc4_ = new DimmerFurniWidgetPresetItem(_loc3_.id,_loc3_.type,_loc3_.color,_loc3_.light);
            _presets.push(_loc4_);
            _loc2_++;
         }
         showInterface();
      }
      
      public function get selectedPresetIndex() : int
      {
         return var_923;
      }
      
      public function removePreview() : void
      {
         var _loc1_:* = null;
         if(messageListener == null)
         {
            return;
         }
         if(!validateBrightness(var_1092,var_1091))
         {
            return;
         }
         _loc1_ = new RoomWidgetDimmerPreviewMessage(_color,var_1092,var_1091 == 2);
         messageListener.processWidgetMessage(_loc1_);
      }
      
      public function get minLights() : Array
      {
         return const_1129;
      }
      
      override public function dispose() : void
      {
         if(_view != null)
         {
            _view.dispose();
            _view = null;
         }
         _presets = null;
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetDimmerUpdateEvent.const_675,onPresets);
      }
      
      public function get dimmerState() : int
      {
         return _dimmerState;
      }
      
      public function get presets() : Array
      {
         return _presets;
      }
      
      public function get colors() : Array
      {
         return const_1130;
      }
      
      public function storeCurrentSetting(param1:Boolean) : void
      {
         var _loc7_:* = null;
         if(_dimmerState == 0)
         {
            return;
         }
         if(messageListener == null)
         {
            return;
         }
         var _loc2_:int = var_923 + 1;
         if(_presets == null || _loc2_ < 0 || _loc2_ > _presets.length)
         {
            return;
         }
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:DimmerFurniWidgetPresetItem = _presets[var_923] as DimmerFurniWidgetPresetItem;
         if(_loc6_ != null && _loc6_.type == _loc3_ && _loc6_.color == _loc4_ && _loc6_.light == _loc5_ && !param1)
         {
            return;
         }
         _loc6_.type = _loc3_;
         _loc6_.color = _loc4_;
         _loc6_.light = _loc5_;
         if(!validateBrightness(_loc5_,_loc3_))
         {
            return;
         }
         _loc7_ = new RoomWidgetDimmerSavePresetMessage(_loc2_,_loc3_,_loc4_,_loc5_,param1);
         messageListener.processWidgetMessage(_loc7_);
      }
      
      public function changeRoomDimmerState() : void
      {
         var _loc1_:* = null;
         if(messageListener != null)
         {
            _loc1_ = new RoomWidgetDimmerChangeStateMessage();
            messageListener.processWidgetMessage(_loc1_);
         }
      }
      
      private function showInterface() : void
      {
         if(_view == null)
         {
            _view = new DimmerView(this);
         }
         if(_view != null)
         {
            _view.showInterface();
         }
      }
      
      public function set selectedPresetIndex(param1:int) : void
      {
         var_923 = param1;
      }
   }
}
