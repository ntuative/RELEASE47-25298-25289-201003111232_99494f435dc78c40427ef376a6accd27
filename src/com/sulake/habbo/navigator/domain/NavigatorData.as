package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.communication.messages.incoming.navigator.FlatCategory;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomSearchResultData;
   import com.sulake.habbo.communication.messages.incoming.navigator.MsgWithRequestId;
   import com.sulake.habbo.communication.messages.incoming.navigator.OfficialRoomsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PopularRoomTagsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.parser.navigator.FavouritesMessageParser;
   import com.sulake.habbo.communication.messages.parser.navigator.NavigatorSettingsMessageParser;
   import com.sulake.habbo.communication.messages.parser.room.engine.RoomEntryInfoMessageParser;
   import com.sulake.habbo.navigator.HabboNavigator;
   import flash.utils.Dictionary;
   
   public class NavigatorData
   {
      
      private static const const_1404:int = 10;
       
      
      private var var_1433:NavigatorSettingsMessageParser;
      
      private var var_1175:int;
      
      private var var_1762:int;
      
      private var var_1764:Boolean;
      
      private var var_979:Array;
      
      private var var_791:Dictionary;
      
      private var var_980:Array;
      
      private var var_2293:int;
      
      private var var_1767:int;
      
      private var var_1765:int;
      
      private var var_1768:int;
      
      private var var_552:PublicRoomShortData;
      
      private var var_391:RoomEventData;
      
      private var var_125:MsgWithRequestId;
      
      private var var_1763:Boolean;
      
      private var _navigator:HabboNavigator;
      
      private var var_1766:Boolean;
      
      private var var_185:GuestRoomData;
      
      private var var_652:Boolean;
      
      private var _currentRoomOwner:Boolean;
      
      public function NavigatorData(param1:HabboNavigator)
      {
         var_979 = new Array();
         var_980 = new Array();
         var_791 = new Dictionary();
         super();
         _navigator = param1;
      }
      
      public function get createdFlatId() : int
      {
         return var_1762;
      }
      
      public function get eventMod() : Boolean
      {
         return var_1766;
      }
      
      public function startLoading() : void
      {
         this.var_652 = true;
      }
      
      public function isRoomFavourite(param1:int) : Boolean
      {
         return false;
      }
      
      public function set eventMod(param1:Boolean) : void
      {
         var_1766 = param1;
      }
      
      public function set roomEventData(param1:RoomEventData) : void
      {
         if(var_391 != null)
         {
            var_391.dispose();
         }
         var_391 = param1;
      }
      
      public function get popularTagsArrived() : Boolean
      {
         return var_125 != null && var_125 as PopularRoomTagsData != null;
      }
      
      public function get guestRoomSearchArrived() : Boolean
      {
         return var_125 != null && var_125 as GuestRoomSearchResultData != null;
      }
      
      public function get guestRoomSearchResults() : GuestRoomSearchResultData
      {
         return var_125 as GuestRoomSearchResultData;
      }
      
      public function get enteredGuestRoom() : GuestRoomData
      {
         return var_185;
      }
      
      public function get allCategories() : Array
      {
         return var_979;
      }
      
      public function onRoomExit() : void
      {
         if(var_391 != null)
         {
            var_391.dispose();
            var_391 = null;
         }
         if(var_552 != null)
         {
            var_552.dispose();
            var_552 = null;
         }
         if(var_185 != null)
         {
            var_185.dispose();
            var_185 = null;
         }
         _currentRoomOwner = false;
      }
      
      public function set officialRooms(param1:OfficialRoomsData) : void
      {
         disposeCurrentMsg();
         var_125 = param1;
         var_652 = false;
      }
      
      public function get settings() : NavigatorSettingsMessageParser
      {
         return var_1433;
      }
      
      public function set popularTags(param1:PopularRoomTagsData) : void
      {
         disposeCurrentMsg();
         var_125 = param1;
         var_652 = false;
      }
      
      public function onRoomEnter(param1:RoomEntryInfoMessageParser) : void
      {
         var_552 = null;
         var_185 = null;
         _currentRoomOwner = false;
         if(param1.guestRoom)
         {
            _currentRoomOwner = param1.owner;
         }
         else
         {
            var_552 = param1.publicSpace;
            var_391 = null;
         }
      }
      
      public function get currentRoomOwner() : Boolean
      {
         return _currentRoomOwner;
      }
      
      public function onFavourites(param1:FavouritesMessageParser) : void
      {
         var _loc2_:int = 0;
         this.var_2293 = param1.limit;
         this.var_1175 = param1.favouriteRoomIds.length;
         this.var_791 = new Dictionary();
         for each(_loc2_ in param1.favouriteRoomIds)
         {
            this.var_791[_loc2_] = "yes";
         }
      }
      
      public function get popularTags() : PopularRoomTagsData
      {
         return var_125 as PopularRoomTagsData;
      }
      
      public function get enteredPublicSpace() : PublicRoomShortData
      {
         return var_552;
      }
      
      public function get hotRoomPopupOpen() : Boolean
      {
         return var_1764;
      }
      
      public function set guestRoomSearchResults(param1:GuestRoomSearchResultData) : void
      {
         disposeCurrentMsg();
         var_125 = param1;
         var_652 = false;
      }
      
      public function set avatarId(param1:int) : void
      {
         var_1765 = param1;
      }
      
      public function get canEditRoomSettings() : Boolean
      {
         return var_185 != null && _currentRoomOwner;
      }
      
      public function isLoading() : Boolean
      {
         return this.var_652;
      }
      
      public function get visibleCategories() : Array
      {
         return var_980;
      }
      
      public function set categories(param1:Array) : void
      {
         var _loc2_:* = null;
         var_979 = param1;
         var_980 = new Array();
         for each(_loc2_ in var_979)
         {
            if(_loc2_.visible)
            {
               var_980.push(_loc2_);
            }
         }
      }
      
      public function get currentRoomRating() : int
      {
         return var_1767;
      }
      
      public function get publicSpaceNodeId() : int
      {
         return var_1768;
      }
      
      public function set settings(param1:NavigatorSettingsMessageParser) : void
      {
         var_1433 = param1;
      }
      
      private function disposeCurrentMsg() : void
      {
         if(var_125 == null)
         {
            return;
         }
         var_125.dispose();
         var_125 = null;
      }
      
      public function get roomEventData() : RoomEventData
      {
         return var_391;
      }
      
      public function favouriteChanged(param1:int, param2:Boolean) : void
      {
         var_791[param1] = !!param2 ? "yes" : null;
         var_1175 += !!param2 ? 1 : -1;
      }
      
      public function get officialRooms() : OfficialRoomsData
      {
         return var_125 as OfficialRoomsData;
      }
      
      public function get avatarId() : int
      {
         return var_1765;
      }
      
      public function isCurrentRoomFavourite() : Boolean
      {
         var _loc1_:int = 0;
         return false;
      }
      
      public function get officialRoomsArrived() : Boolean
      {
         return var_125 != null && var_125 as OfficialRoomsData != null;
      }
      
      public function set hotRoomPopupOpen(param1:Boolean) : void
      {
         var_1764 = param1;
      }
      
      public function set currentRoomRating(param1:int) : void
      {
         var_1767 = param1;
      }
      
      public function set hcMember(param1:Boolean) : void
      {
         var_1763 = param1;
      }
      
      public function set enteredRoom(param1:GuestRoomData) : void
      {
         if(var_185 != null)
         {
            var_185.dispose();
         }
         var_185 = param1;
      }
      
      public function isCurrentRoomHome() : Boolean
      {
         if(var_185 == null)
         {
            return false;
         }
         var _loc1_:int = 0;
         return this.var_1433.homeRoomId == _loc1_;
      }
      
      public function isFavouritesFull() : Boolean
      {
         return var_1175 >= var_2293;
      }
      
      public function set publicSpaceNodeId(param1:int) : void
      {
         var_1768 = param1;
      }
      
      public function get hcMember() : Boolean
      {
         return var_1763;
      }
      
      public function get canAddFavourite() : Boolean
      {
         return var_185 != null && !_currentRoomOwner;
      }
      
      public function set createdFlatId(param1:int) : void
      {
         var_1762 = param1;
      }
   }
}
