package com.sulake.habbo.catalog.marketplace
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.window.IHabboWindowManager;
   
   public interface IMarketPlace
   {
       
      
      function registerVisualization(param1:IMarketPlaceVisualization = null) : void;
      
      function onBuyResult(param1:IMessageEvent) : void;
      
      function buyOffer(param1:int) : void;
      
      function requestOffers(param1:int, param2:int, param3:String, param4:int) : void;
      
      function redeemSoldOffers() : void;
      
      function requestOffersByName(param1:String) : void;
      
      function requestOwnItems() : void;
      
      function requestOffersByPrice(param1:int) : void;
      
      function latestOffers() : Map;
      
      function latestOwnOffers() : Map;
      
      function refreshOffers() : void;
      
      function redeemExpiredOffer(param1:int) : void;
      
      function get averagePricePeriod() : int;
      
      function get windowManager() : IHabboWindowManager;
      
      function onCancelResult(param1:IMessageEvent) : void;
      
      function set itemStats(param1:MarketplaceItemStats) : void;
      
      function get localization() : ICoreLocalizationManager;
      
      function get creditsWaiting() : int;
      
      function get itemStats() : MarketplaceItemStats;
      
      function set averagePricePeriod(param1:int) : void;
      
      function onOffers(param1:IMessageEvent) : void;
      
      function onOwnOffers(param1:IMessageEvent) : void;
      
      function requestItemStats(param1:int, param2:int) : void;
   }
}
