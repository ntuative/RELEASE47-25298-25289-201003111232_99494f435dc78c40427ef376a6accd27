package com.sulake.habbo.inventory.marketplace
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.inventory.items.FloorItem;
   import com.sulake.habbo.inventory.items.IItem;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.room.IGetImageListener;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.room.ImageResult;
   import com.sulake.habbo.utils.HabboWebTools;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import com.sulake.habbo.window.utils.IConfirmDialog;
   import com.sulake.room.utils.Vector3d;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.external.ExternalInterface;
   import flash.geom.Matrix;
   
   public class MarketplaceView implements IGetImageListener
   {
       
      
      private var var_1499:int;
      
      private var _view:IFrameWindow;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var _disposed:Boolean = false;
      
      private var var_1992:int;
      
      private var _roomEngine:IRoomEngine;
      
      private var _windowManager:IHabboWindowManager;
      
      private var _config:IHabboConfigurationManager;
      
      private var _model:MarketplaceModel;
      
      private var var_1991:String;
      
      private var _localization:IHabboLocalizationManager;
      
      public function MarketplaceView(param1:MarketplaceModel, param2:IHabboWindowManager, param3:IAssetLibrary, param4:IRoomEngine, param5:IHabboLocalizationManager, param6:IHabboConfigurationManager)
      {
         super();
         _model = param1;
         _assetLibrary = param3;
         _windowManager = param2;
         _roomEngine = param4;
         _localization = param5;
         _config = param6;
      }
      
      public function showBuyTokens(param1:int, param2:int) : void
      {
         if(_localization)
         {
            _localization.registerParameter("inventory.marketplace.buy_tokens.info","price",param1.toString());
            _localization.registerParameter("inventory.marketplace.buy_tokens.info","count",param2.toString());
            _localization.registerParameter("inventory.marketplace.buy_tokens.info","free",(param2 - 1).toString());
            _localization.registerParameter("inventory.marketplace.buy_tokens.buy","price",param1.toString());
         }
         _view = createWindow("buy_marketplace_tokens_xml") as IFrameWindow;
         if(_view == null)
         {
            return;
         }
         _view.procedure = clickHandler;
         _view.center();
      }
      
      private function setFurniImage(param1:BitmapData) : void
      {
         if(param1 == null || _view == null)
         {
            return;
         }
         var _loc2_:IBitmapWrapperWindow = _view.findChildByName("furni_image") as IBitmapWrapperWindow;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:BitmapData = new BitmapData(_loc2_.width,_loc2_.height,true,0);
         var _loc4_:int = (_loc3_.width - param1.width) * 0.5;
         var _loc5_:int = (_loc3_.height - param1.height) * 0.5;
         _loc3_.draw(param1,new Matrix(1,0,0,1,_loc4_,_loc5_));
         _loc2_.bitmap = _loc3_;
      }
      
      private function createWindow(param1:String) : IWindow
      {
         if(_assetLibrary == null || _windowManager == null)
         {
            return null;
         }
         var _loc2_:XmlAsset = _assetLibrary.getAssetByName(param1) as XmlAsset;
         if(_loc2_ == null)
         {
            return null;
         }
         return _windowManager.buildFromXML(_loc2_.content as XML);
      }
      
      public function showMakeOffer(param1:IItem) : void
      {
         var _loc4_:* = null;
         if(!param1 || !_localization || !_roomEngine || !_model)
         {
            return;
         }
         _view = createWindow("make_marketplace_offer_xml") as IFrameWindow;
         if(!_view)
         {
            return;
         }
         var _loc2_:ITextFieldWindow = _view.findChildByName("price_input") as ITextFieldWindow;
         if(_loc2_ != null)
         {
            _loc2_.restrict = "0-9";
         }
         checkPrice();
         _localization.registerParameter("inventory.marketplace.make_offer.expiration_info","time",_model.expirationHours.toString());
         _localization.registerParameter("inventory.marketplace.make_offer.min_price","minprice",_model.offerMinPrice.toString());
         _localization.registerParameter("inventory.marketplace.make_offer.max_price","maxprice",_model.offerMaxPrice.toString());
         if(param1 is FloorItem)
         {
            _loc4_ = _roomEngine.getFurnitureImage(param1.type,new Vector3d(180,0,0),32,this,String(param1.extra),4293848814);
         }
         else
         {
            _loc4_ = _roomEngine.getWallItemImage(param1.type,new Vector3d(180,0,0),32,this,param1.stuffData,4293848814);
         }
         if(!_loc4_)
         {
            return;
         }
         var_1992 = _loc4_.id;
         setFurniImage(_loc4_.data);
         var_1991 = _localization.getKey("roomItem.name." + param1.type);
         setText("furni_name","${roomItem.name." + param1.type + "}");
         setText("furni_desc","${roomItem.desc." + param1.type + "}");
         _view.procedure = clickHandler;
         _view.center();
         var _loc5_:ITextWindow = _view.findChildByName("average_price") as ITextWindow;
         if(_loc5_)
         {
            _loc5_.visible = false;
         }
         _model.getItemStats();
      }
      
      private function showConfirmation() : void
      {
         _localization.registerParameter("inventory.marketplace.confirm_offer.info","furniname",var_1991);
         _localization.registerParameter("inventory.marketplace.confirm_offer.info","price",var_1499.toString());
         var _loc1_:String = "${inventory.marketplace.confirm_offer.title}";
         var _loc2_:String = "${inventory.marketplace.confirm_offer.info}";
         _windowManager.confirm(_loc1_,_loc2_,0,confirmationCallback);
      }
      
      private function closeAlert(param1:IAlertDialog, param2:Event) : void
      {
         if(param1 == null)
         {
            return;
         }
         _model.releaseItem();
         param1.dispose();
      }
      
      public function updateAveragePrice(param1:int, param2:int) : void
      {
         if(!_view || !_localization || !_model)
         {
            return;
         }
         var _loc3_:ITextWindow = _view.findChildByName("average_price") as ITextWindow;
         if(!_loc3_)
         {
            return;
         }
         var _loc4_:int = Math.floor(param1 / 1);
         _localization.registerParameter("inventory.marketplace.make_offer.average_price","days",param2.toString());
         var _loc5_:String = param1 == 0 ? " - " : param1.toString();
         _localization.registerParameter("inventory.marketplace.make_offer.average_price","price",_loc5_);
         var _loc6_:String = _loc4_ == 0 ? " - " : _loc4_.toString();
         _localization.registerParameter("inventory.marketplace.make_offer.average_price","price_no_commission",_loc6_);
         _loc3_.visible = true;
      }
      
      private function confirmationCallback(param1:IConfirmDialog, param2:WindowEvent) : void
      {
         if(param1 == null || param2 == null)
         {
            return;
         }
         param1.dispose();
         if(_model == null)
         {
            return;
         }
         if(param2.type == WindowEvent.const_174)
         {
            _model.makeOffer(var_1499);
         }
         _model.releaseItem();
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            _model = null;
            _assetLibrary = null;
            _windowManager = null;
            _roomEngine = null;
            _localization = null;
            _config = null;
            disposeView();
            _disposed = true;
         }
      }
      
      public function imageReady(param1:int, param2:BitmapData) : void
      {
         if(var_1992 == param1)
         {
            setFurniImage(param2);
         }
      }
      
      private function clickHandler(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            switch(param2.name)
            {
               case "buy_tokens_button":
                  _model.buyMarketplaceTokens();
                  disposeView();
                  break;
               case "cancel_buy_tokens_button":
               case "cancel_make_offer_button":
               case "cancel_no_credits_button":
               case "header_button_close":
                  _model.releaseItem();
                  disposeView();
                  break;
               case "make_offer_button":
                  _loc3_ = _view.findChildByName("price_input") as ITextFieldWindow;
                  if(_loc3_ != null)
                  {
                     var_1499 = parseInt(_loc3_.text);
                     showConfirmation();
                  }
                  disposeView();
                  break;
               case "get_credits_button":
                  _model.releaseItem();
                  openCreditsPage();
                  disposeView();
            }
         }
         if(param1.type == WindowEvent.const_135)
         {
            if(param2.name == "price_input")
            {
               checkPrice();
            }
         }
      }
      
      private function disposeView() : void
      {
         if(_view != null)
         {
            _view.dispose();
            _view = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      private function openCreditsPage() : void
      {
         var _loc1_:* = null;
         if(false && "true" == _config.getKey("client.credits.embed.enabled"))
         {
            ExternalInterface.call("FlashExternalInterface.openHabblet","credits");
         }
         else
         {
            _loc1_ = _config.getKey("link.format.credits");
            if(_loc1_ != "")
            {
               _windowManager.alert("${catalog.alert.external.link.title}","${catalog.alert.external.link.desc}",0,closeAlert);
               HabboWebTools.navigateToURL(_loc1_,"habboMain");
            }
         }
      }
      
      private function checkPrice() : void
      {
         if(_view == null)
         {
            return;
         }
         var _loc1_:ITextFieldWindow = _view.findChildByName("price_input") as ITextFieldWindow;
         if(_loc1_ == null)
         {
            return;
         }
         var _loc2_:int = parseInt(_loc1_.text);
         if(_loc2_ > _model.offerMaxPrice)
         {
            _loc1_.text = _model.offerMaxPrice.toString();
            _loc2_ = 0;
         }
         var _loc3_:int = Math.max(Math.ceil(0 * _loc2_),1);
         var _loc4_:int = _loc2_ + _loc3_;
         var _loc5_:IButtonWindow = _view.findChildByName("make_offer_button") as IButtonWindow;
         var _loc6_:ITextWindow = _view.findChildByName("final_price") as ITextWindow;
         if(_loc5_ == null || _loc6_ == null)
         {
            return;
         }
         _localization.registerParameter("inventory.marketplace.make_offer.final_price","commission",_loc3_.toString());
         _localization.registerParameter("inventory.marketplace.make_offer.final_price","finalprice",_loc4_.toString());
         if(_loc2_ < _model.offerMinPrice)
         {
            _loc6_.text = "${inventory.marketplace.make_offer.min_price}";
            _loc5_.disable();
         }
         else
         {
            _loc6_.text = "${inventory.marketplace.make_offer.final_price}";
            _loc5_.enable();
         }
      }
      
      public function showNoCredits(param1:int) : void
      {
         if(_localization)
         {
            _localization.registerParameter("inventory.marketplace.no_credits.info","price",param1.toString());
         }
         _view = createWindow("marketplace_no_credits_xml") as IFrameWindow;
         if(_view == null)
         {
            return;
         }
         _view.procedure = clickHandler;
         _view.center();
      }
      
      private function setText(param1:String, param2:String) : void
      {
         if(_view == null)
         {
            return;
         }
         var _loc3_:ITextWindow = _view.findChildByName(param1) as ITextWindow;
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.text = param2;
      }
      
      public function showAlert(param1:String, param2:String) : void
      {
         _windowManager.alert(param1,param2,0,closeAlert);
      }
      
      public function showResult(param1:int) : void
      {
         var _loc2_:* = null;
         if(param1 == 1)
         {
            _loc2_ = "${inventory.marketplace.result.title.success}";
         }
         else
         {
            _loc2_ = "${inventory.marketplace.result.title.failure}";
         }
         var _loc3_:* = "${inventory.marketplace.result." + param1 + "}";
         _windowManager.alert(_loc2_,_loc3_,0,closeAlert);
      }
   }
}
