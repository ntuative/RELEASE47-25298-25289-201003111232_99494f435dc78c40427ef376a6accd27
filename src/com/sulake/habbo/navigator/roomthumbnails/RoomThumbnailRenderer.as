package com.sulake.habbo.navigator.roomthumbnails
{
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomThumbnailData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomThumbnailObjectData;
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   
   public class RoomThumbnailRenderer
   {
      
      private static const const_1048:int = -16;
      
      private static const const_749:int = 32;
      
      private static const const_1050:int = 8;
      
      public static const const_425:int = 10;
      
      private static const const_1049:int = 40;
       
      
      private var _navigator:HabboNavigator;
      
      private var var_974:Dictionary;
      
      private var var_1748:Dictionary;
      
      private var var_788:ThumbnailImageConfigurations;
      
      private var var_1170:BitmapData;
      
      public function RoomThumbnailRenderer(param1:HabboNavigator)
      {
         var_974 = new Dictionary();
         super();
         _navigator = param1;
         var_788 = new ThumbnailImageConfigurations(_navigator);
         initScreenLocsByPositions();
      }
      
      public function refreshThumbnail(param1:IWindowContainer, param2:RoomThumbnailData, param3:Boolean) : void
      {
         var _loc7_:* = null;
         var _loc5_:IBitmapWrapperWindow = IBitmapWrapperWindow(param1.getChildByName("bitmap"));
         if(_loc5_ == null)
         {
            _loc7_ = new BitmapData(64,64);
            _loc5_ = IBitmapWrapperWindow(_navigator.windowManager.createWindow("bitmap","",HabboWindowType.BITMAP_WRAPPER,HabboWindowStyle.const_41,0 | (!!param3 ? HabboWindowParam.const_40 : HabboWindowParam.const_41),new Rectangle(0,0,_loc7_.width,_loc7_.height)));
            _loc5_.bitmap = _loc7_;
            param1.addChild(_loc5_);
         }
         var _loc6_:String = param2.getAsString();
         if(_loc5_.tags[0] != _loc6_)
         {
            _loc5_.tags.splice(0,_loc5_.tags.length);
            _loc5_.tags.push(_loc6_);
            refreshBitmapContent(_loc5_.bitmap,param2);
            refreshCover(_loc5_.bitmap);
            roundEdges(_loc5_.bitmap);
            _loc5_.invalidate();
         }
      }
      
      private function paintCol(param1:BitmapData, param2:int, param3:int, param4:Boolean = true, param5:Boolean = true) : void
      {
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc6_:int = 0;
         while(_loc6_ < param3)
         {
            _loc7_ = !!param5 ? int(param2) : int(param1.width - param2 - 1);
            _loc8_ = !!param4 ? int(_loc6_) : int(param1.height - _loc6_ - 1);
            param1.setPixel32(_loc7_,_loc8_,0);
            _loc6_++;
         }
      }
      
      private function refreshObj(param1:BitmapData, param2:RoomThumbnailObjectData) : void
      {
         var _loc3_:ThumbnailImageConfiguration = this.var_788.getImage(ThumbnailEditorModel.const_34,param2.imgId);
         if(_loc3_ == null)
         {
            Logger.log("Unknown object image id: " + param2.imgId);
            return;
         }
         if(_loc3_.id == 0)
         {
            return;
         }
         var _loc4_:Point = this.getScreenLocForPos(param2.pos);
         if(_loc4_ == null)
         {
            Logger.log("Unknown object position: " + param2.pos);
            return;
         }
         var _loc5_:BitmapData = _loc3_.getImg();
         if(_loc5_ == null)
         {
            Logger.log("No image for " + param2.imgId);
            return;
         }
         Logger.log("Drawing object: " + param2.pos + ", " + _loc4_);
         param1.copyPixels(_loc5_,_loc5_.rect,new Point(_loc4_.x + const_1048,_loc4_.y + const_1049 - _loc5_.height),null,null,true);
      }
      
      private function initScreenLocsByPositions() : void
      {
         var _loc1_:Dictionary = new Dictionary();
         _loc1_[0] = getLoc(1,0);
         _loc1_[1] = getLoc(0,1);
         _loc1_[2] = getLoc(1,1);
         _loc1_[3] = getLoc(0,2);
         _loc1_[4] = getLoc(1,2);
         _loc1_[5] = getLoc(2,2);
         _loc1_[6] = getLoc(0,3);
         _loc1_[7] = getLoc(1,3);
         _loc1_[8] = getLoc(0,4);
         _loc1_[9] = getLoc(1,4);
         _loc1_[10] = getLoc(2,4);
         var_1748 = _loc1_;
      }
      
      public function roundEdges(param1:BitmapData) : void
      {
         var _loc3_:Boolean = false;
         var _loc4_:Boolean = false;
         var _loc2_:int = 0;
         while(_loc2_ < 4)
         {
            _loc3_ = _loc2_ == 0 || _loc2_ == 1;
            _loc4_ = _loc2_ == 1 || _loc2_ == 3;
            paintCol(param1,0,5,_loc3_,_loc4_);
            paintCol(param1,1,3,_loc3_,_loc4_);
            paintCol(param1,2,2,_loc3_,_loc4_);
            paintCol(param1,3,1,_loc3_,_loc4_);
            paintCol(param1,4,1,_loc3_,_loc4_);
            _loc2_++;
         }
      }
      
      public function getScreenLocForPos(param1:int) : Point
      {
         return Point(this.var_1748[param1]);
      }
      
      private function refreshBg(param1:BitmapData, param2:int) : void
      {
         if(param2 < 1)
         {
            param2 = 1;
         }
         var _loc3_:ThumbnailImageConfiguration = this.var_788.getImage(ThumbnailEditorModel.const_37,param2);
         if(_loc3_ == null)
         {
            Logger.log("Unknown bg image id: " + param2);
            _loc3_ = this.var_788.getImage(ThumbnailEditorModel.const_37,1);
         }
         var _loc4_:BitmapData = _loc3_.getImg();
         param1.copyPixels(_loc4_,_loc4_.rect,new Point(0,0),null,null,true);
      }
      
      private function refreshFront(param1:BitmapData, param2:int) : void
      {
         if(param2 < 1)
         {
            return;
         }
         var _loc3_:ThumbnailImageConfiguration = this.var_788.getImage(ThumbnailEditorModel.const_55,param2);
         if(_loc3_ == null)
         {
            Logger.log("Unknown top image id: " + param2);
            return;
         }
         var _loc4_:BitmapData = _loc3_.getImg();
         param1.copyPixels(_loc4_,_loc4_.rect,new Point(0,0),null,null,true);
      }
      
      private function getLoc(param1:int, param2:int) : Point
      {
         var _loc3_:int = param2 % 2 == 0 ? 0 : int(const_749 / 2);
         return new Point(param1 * const_749 + _loc3_,param2 * const_1050);
      }
      
      public function refreshBitmapContent(param1:BitmapData, param2:RoomThumbnailData) : void
      {
         refreshBg(param1,param2.bgImgId);
         refreshObjects(param1,param2.objects);
         refreshFront(param1,param2.frontImgId);
      }
      
      public function get imageConfigurations() : ThumbnailImageConfigurations
      {
         return this.var_788;
      }
      
      private function refreshObjects(param1:BitmapData, param2:Array) : void
      {
         var _loc3_:int = 0;
         var _loc4_:* = null;
         _loc3_ = 0;
         while(_loc3_ <= const_425)
         {
            var_974[_loc3_] = null;
            _loc3_++;
         }
         for each(_loc4_ in param2)
         {
            var_974[_loc4_.pos] = _loc4_;
         }
         _loc3_ = 0;
         while(_loc3_ <= const_425)
         {
            if(false)
            {
               refreshObj(param1,var_974[_loc3_]);
            }
            _loc3_++;
         }
      }
      
      private function refreshCover(param1:BitmapData) : void
      {
         if(var_1170 == null)
         {
            var_1170 = _navigator.getButtonImage("rico_rnd");
         }
         param1.copyPixels(var_1170,var_1170.rect,new Point(0,0),null,null,true);
      }
   }
}
