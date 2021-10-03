package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IDropMenuWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import com.sulake.habbo.avatar.enum.AvatarScaleType;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.avatar.pets.IBreed;
   import com.sulake.habbo.avatar.pets.IPetColor;
   import com.sulake.habbo.avatar.pets.IPetData;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.viewer.Offer;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetApproveNameResultEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetColourIndexEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetColoursEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.WidgetEvent;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.geom.Matrix;
   import flash.geom.Point;
   
   public class PetsCatalogWidget extends CatalogWidget implements ICatalogWidget
   {
       
      
      private var var_379:int = 0;
      
      private var var_456:Boolean = false;
      
      private var var_1389:int = 0;
      
      private var var_290:Array;
      
      private var var_762:int = -1;
      
      private var var_540:Array;
      
      private var _name:String;
      
      private var var_588:Map;
      
      public function PetsCatalogWidget(param1:IWindowContainer)
      {
         super(param1);
      }
      
      private function getPurchaseParameters() : String
      {
         if(_name == null || false)
         {
            page.viewer.catalog.windowManager.alert("${catalog.alert.purchaseerror.title}","${catalog.alert.petname.empty}",0,function(param1:IAlertDialog, param2:Event):void
            {
               param1.dispose();
            });
            return "";
         }
         if(var_379 >= var_290.length)
         {
            return "";
         }
         var petColor:IPetColor = var_290[var_379] as IPetColor;
         var color:uint = petColor.rgb;
         var breed:IBreed = var_540[var_1389] as IBreed;
         var p:String = _name + String.fromCharCode(10) + addZeroPadding(String(breed.id),3) + String.fromCharCode(10) + addZeroPadding(color.toString(16).toUpperCase(),6);
         return p;
      }
      
      private function getRaceLocalizationKey(param1:int, param2:int) : String
      {
         return "pet.race." + param1 + "." + addZeroPadding(String(param2),3);
      }
      
      private function onColourIndex(param1:CatalogWidgetColourIndexEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         var_379 = param1.index;
         if(var_379 < 0 || var_379 > var_290.length)
         {
            var_379 = 0;
         }
         updateImage();
      }
      
      private function onApproveNameResult(param1:CatalogWidgetApproveNameResultEvent) : void
      {
         var event:CatalogWidgetApproveNameResultEvent = param1;
         if(event == null || !var_456)
         {
            return;
         }
         var_456 = false;
         switch(event.result)
         {
            case 1:
               page.viewer.catalog.windowManager.alert("${catalog.alert.purchaseerror.title}","${catalog.alert.petname.length}",0,function(param1:IAlertDialog, param2:Event):void
               {
                  param1.dispose();
               });
               return;
            case 2:
               page.viewer.catalog.windowManager.alert("${catalog.alert.purchaseerror.title}","${catalog.alert.petname.chars}",0,function(param1:IAlertDialog, param2:Event):void
               {
                  param1.dispose();
               });
               return;
            case 3:
               page.viewer.catalog.windowManager.alert("${catalog.alert.purchaseerror.title}","${catalog.alert.petname.bobba}",0,function(param1:IAlertDialog, param2:Event):void
               {
                  param1.dispose();
               });
               return;
            case 4:
               page.viewer.catalog.windowManager.alert("${catalog.alert.purchaseerror.title}","${catalog.alert.petname.taken}",0,function(param1:IAlertDialog, param2:Event):void
               {
                  param1.dispose();
               });
         }
         var p:String = getPurchaseParameters();
         if(p == "")
         {
            Logger.log("* Not enough information to buy a pet!");
            return;
         }
         Logger.log("* Will buy pet as " + p);
         (page.viewer.catalog as HabboCatalog).showPurchaseConfirmation(var_588.getWithIndex(0),page,p);
      }
      
      override public function init() : void
      {
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         super.init();
         var_456 = false;
         var _loc1_:IWindow = window.findChildByName("ctlg_buy_button");
         if(_loc1_ == null)
         {
            return;
         }
         _loc1_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onBuyButtonEvent);
         var _loc2_:ITextFieldWindow = window.findChildByName("name_input_text") as ITextFieldWindow;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.addEventListener(WindowEvent.const_135,onTextWindowEvent);
         var_588 = new Map();
         var _loc3_:Array = new Array();
         var _loc4_:ICoreLocalizationManager = (page.viewer.catalog as HabboCatalog).localization;
         if(page.offers.length == 0)
         {
            return;
         }
         var _loc5_:Offer = page.offers[0];
         var_762 = getPetTypeIndexFromProduct(_loc5_.localizationId);
         var_290 = [];
         var_540 = [];
         if(page && false && page.viewer.catalog)
         {
            _loc10_ = page.viewer.catalog as HabboCatalog;
            if(_loc10_ && _loc10_.avatarRenderManager && _loc10_.avatarRenderManager.petDataManager)
            {
               _loc11_ = _loc10_.avatarRenderManager.petDataManager.getPetData(var_762);
               if(_loc11_)
               {
                  var_540 = _loc11_.breeds;
                  var_290 = _loc11_.colors;
                  if(var_290 == null)
                  {
                     var_290 = [];
                  }
               }
            }
         }
         var _loc6_:int = 0;
         while(_loc6_ < var_540.length)
         {
            _loc12_ = var_540[_loc6_] as IBreed;
            _loc3_.push(_loc4_.getKey(getRaceLocalizationKey(var_762,_loc12_.id),getRaceLocalizationKey(var_762,_loc12_.id)));
            _loc6_++;
         }
         var_588.add(var_762,_loc5_);
         var _loc7_:IDropMenuWindow = window.findChildByName("type_drop_menu") as IDropMenuWindow;
         if(_loc7_ == null)
         {
            return;
         }
         if(_loc3_.length > 1)
         {
            _loc7_.populate(_loc3_);
            _loc7_.selection = 0;
            _loc7_.procedure = onDropMenuEvent;
         }
         else
         {
            _loc7_.visible = false;
         }
         events.addEventListener(WidgetEvent.CWE_SELECT_PRODUCT,onSelectProduct);
         events.addEventListener(WidgetEvent.CWE_COLOUR_INDEX,onColourIndex);
         events.addEventListener(WidgetEvent.const_812,onApproveNameResult);
         _loc5_ = var_588.getWithIndex(0);
         if(_loc5_ != null)
         {
            events.dispatchEvent(new SelectProductEvent(_loc5_));
         }
         var _loc8_:* = [];
         for each(_loc9_ in var_290)
         {
            _loc8_.push(_loc9_.rgb);
         }
         events.dispatchEvent(new CatalogWidgetColoursEvent(_loc8_,"ctlg_clr_27x22_1","ctlg_clr_27x22_2","ctlg_clr_27x22_3"));
      }
      
      private function getPetTypeIndexFromProduct(param1:String) : int
      {
         if(param1.length == 0)
         {
            return 0;
         }
         return int(param1.charAt(param1.length - 1));
      }
      
      override public function dispose() : void
      {
         var_456 = false;
         super.dispose();
      }
      
      private function onBuyButtonEvent(param1:WindowEvent) : void
      {
         if(var_456)
         {
            Logger.log("* Cannot buy a pet, pending previous name approval.");
         }
         if(getPurchaseParameters() == "")
         {
            return;
         }
         var_456 = true;
         (page.viewer.catalog as HabboCatalog).approveName(_name,1);
      }
      
      private function addZeroPadding(param1:String, param2:int) : String
      {
         while(param1.length < param2)
         {
            param1 = "0" + param1;
         }
         return param1;
      }
      
      public function onDropMenuEvent(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:int = 0;
         if(param1.type == WindowEvent.const_53)
         {
            _loc3_ = IDropMenuWindow(param2).selection;
            if(_loc3_ >= var_540.length)
            {
               return;
            }
            var_1389 = _loc3_;
            updateImage();
         }
      }
      
      private function setPreviewImage(param1:BitmapData, param2:Boolean) : void
      {
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:* = null;
         if(true)
         {
            if(param1 == null)
            {
               param1 = new BitmapData(1,1);
               param2 = true;
            }
            _loc3_ = window.findChildByName("ctlg_teaserimg_1") as IBitmapWrapperWindow;
            if(_loc3_ != null)
            {
               if(_loc3_.bitmap == null)
               {
                  _loc3_.bitmap = new BitmapData(_loc3_.width,_loc3_.height,true,16777215);
               }
               _loc3_.bitmap.fillRect(_loc3_.bitmap.rect,16777215);
               _loc4_ = 2;
               _loc5_ = new BitmapData(param1.width * _loc4_,param1.height * _loc4_,true,16777215);
               _loc5_.draw(param1,new Matrix(_loc4_,0,0,_loc4_));
               _loc6_ = new Point((_loc3_.width - _loc5_.width) / 2,(_loc3_.height - _loc5_.height) / 2);
               _loc3_.bitmap.copyPixels(_loc5_,_loc5_.rect,_loc6_,null,null,true);
               _loc3_.invalidate();
               _loc5_.dispose();
            }
         }
         if(param2)
         {
            param1.dispose();
         }
      }
      
      private function onSelectProduct(param1:SelectProductEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         updateImage();
      }
      
      private function onTextWindowEvent(param1:WindowEvent) : void
      {
         var _loc2_:ITextFieldWindow = param1.target as ITextFieldWindow;
         if(_loc2_ == null)
         {
            return;
         }
         _name = _loc2_.text;
      }
      
      private function updateImage() : void
      {
         var _loc7_:* = null;
         var _loc1_:Offer = var_588.getWithIndex(0);
         if(_loc1_ == null)
         {
            return;
         }
         var _loc2_:* = 0;
         if(var_379 >= 0 && var_379 < var_290.length)
         {
            _loc7_ = var_290[var_379] as IPetColor;
            if(_loc7_ != null)
            {
               _loc2_ = uint(_loc7_.rgb);
            }
         }
         var _loc3_:IBreed = var_540[var_1389] as IBreed;
         var _loc4_:IAvatarImage = (page.viewer.catalog as HabboCatalog).avatarRenderManager.createPetImageNew(var_762,_loc3_.id,_loc2_,AvatarScaleType.const_52);
         if(_loc4_ == null)
         {
            return;
         }
         _loc4_.initActionAppends();
         _loc4_.appendAction(AvatarAction.const_299,AvatarAction.const_549);
         _loc4_.endActionAppends();
         _loc4_.setDirection(AvatarSetType.const_39,2);
         setPreviewImage(_loc4_.getCroppedImage(AvatarSetType.const_39).clone(),true);
         _loc4_.dispose();
         var _loc5_:ICoreLocalizationManager = (page.viewer.catalog as HabboCatalog).localization;
         var _loc6_:ITextWindow = _window.findChildByName("ctlg_price_credits") as ITextWindow;
         if(_loc6_ != null)
         {
            _loc5_.registerParameter("catalog.purchase.price.credits","credits",String(_loc1_.priceInCredits));
            _loc6_.caption = "${catalog.purchase.price.credits}";
         }
      }
   }
}
