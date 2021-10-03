package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.viewer.Offer;
   import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.SetExtraPurchaseParameterEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.WidgetEvent;
   
   public class PurchaseCatalogWidget extends CatalogWidget implements ICatalogWidget
   {
       
      
      private var var_2026:XML;
      
      private var var_1513:ITextWindow;
      
      private var var_1514:ITextWindow;
      
      private var var_2025:XML;
      
      private var var_850:IWindowContainer;
      
      private var var_2315:ITextWindow;
      
      private var var_2027:String = "";
      
      private var var_2374:IButtonWindow;
      
      private var var_2029:XML;
      
      private var var_1515:ITextWindow;
      
      private var var_2028:XML;
      
      private var var_851:IButtonWindow;
      
      private var var_76:Offer;
      
      public function PurchaseCatalogWidget(param1:IWindowContainer)
      {
         super(param1);
      }
      
      private function attachStub(param1:String) : void
      {
         var _loc2_:* = null;
         switch(param1)
         {
            case Offer.const_422:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_2025) as IWindowContainer;
               break;
            case Offer.const_366:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_2028) as IWindowContainer;
               break;
            case Offer.const_383:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_2026) as IWindowContainer;
               break;
            case Offer.const_651:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_2029) as IWindowContainer;
               break;
            default:
               Logger.log("Unknown price-type, can\'t attach...undefined");
         }
         if(_loc2_ != null)
         {
            if(var_850 != null)
            {
               _window.removeChild(var_850);
               var_850.dispose();
            }
            var_850 = _loc2_;
            _window.addChild(_loc2_);
            var_850.x = 0;
            var_850.y = 0;
         }
         var_1515 = _window.findChildByName("ctlg_price_credits") as ITextWindow;
         var_1514 = _window.findChildByName("ctlg_price_pixels") as ITextWindow;
         var_1513 = _window.findChildByName("ctlg_price_credits_pixels") as ITextWindow;
         var_2315 = _window.findChildByName("ctlg_special_txt") as ITextWindow;
         var_851 = window.findChildByName("ctlg_buy_button") as IButtonWindow;
         if(var_851 != null)
         {
            var_851.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onPurchase);
            var_851.disable();
         }
      }
      
      private function onPurchase(param1:WindowMouseEvent) : void
      {
         if(var_76 != null)
         {
            Logger.log("Init Purchase: undefined undefined");
            (page.viewer.catalog as HabboCatalog).showPurchaseConfirmation(var_76,page,var_2027);
         }
      }
      
      override public function init() : void
      {
         var _loc1_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsStub") as XmlAsset;
         if(_loc1_ != null)
         {
            var_2025 = _loc1_.content as XML;
         }
         var _loc2_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetPixelsStub") as XmlAsset;
         if(_loc2_ != null)
         {
            var_2028 = _loc2_.content as XML;
         }
         var _loc3_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsPixelsStub") as XmlAsset;
         if(_loc3_ != null)
         {
            var_2026 = _loc3_.content as XML;
         }
         var _loc4_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsOrCreditsAndPixelsStub") as XmlAsset;
         if(_loc4_ != null)
         {
            var_2029 = _loc4_.content as XML;
         }
         events.addEventListener(WidgetEvent.CWE_SELECT_PRODUCT,onSelectProduct);
         events.addEventListener(WidgetEvent.const_986,onSetParameter);
      }
      
      private function onSetParameter(param1:SetExtraPurchaseParameterEvent) : void
      {
         var_2027 = param1.parameter;
      }
      
      private function onSelectProduct(param1:SelectProductEvent) : void
      {
         var _loc2_:ICoreLocalizationManager = (page.viewer.catalog as HabboCatalog).localization;
         var_76 = param1.offer;
         attachStub(var_76.priceType);
         if(var_1515 != null)
         {
            _loc2_.registerParameter("catalog.purchase.price.credits","credits",String(var_76.priceInCredits));
            var_1515.caption = "${catalog.purchase.price.credits}";
         }
         if(var_1514 != null)
         {
            _loc2_.registerParameter("catalog.purchase.price.pixels","pixels",String(var_76.priceInPixels));
            var_1514.caption = "${catalog.purchase.price.pixels}";
         }
         if(var_1513 != null)
         {
            _loc2_.registerParameter("catalog.purchase.price.credits+pixels","credits",String(var_76.priceInCredits));
            _loc2_.registerParameter("catalog.purchase.price.credits+pixels","pixels",String(var_76.priceInPixels));
            var_1513.caption = "${catalog.purchase.price.credits+pixels}";
         }
         if(var_851 != null)
         {
            var_851.enable();
         }
      }
   }
}
