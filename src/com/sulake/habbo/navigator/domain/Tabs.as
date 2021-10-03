package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.mainview.MainViewCtrl;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.EventsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.MyRoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.OfficialTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.SearchTabPageDecorator;
   
   public class Tabs
   {
      
      public static const const_586:int = 6;
      
      public static const const_199:int = 5;
      
      public static const const_555:int = 2;
      
      public static const const_310:int = 9;
      
      public static const const_334:int = 4;
      
      public static const const_238:int = 2;
      
      public static const const_612:int = 4;
      
      public static const const_209:int = 8;
      
      public static const const_522:int = 7;
      
      public static const const_271:int = 3;
      
      public static const const_329:int = 1;
      
      public static const const_218:int = 5;
      
      public static const const_389:int = 12;
      
      public static const const_327:int = 1;
      
      public static const const_507:int = 11;
      
      public static const const_656:int = 3;
      
      public static const const_1447:int = 10;
       
      
      private var _navigator:HabboNavigator;
      
      private var var_406:Array;
      
      public function Tabs(param1:HabboNavigator)
      {
         super();
         _navigator = param1;
         var_406 = new Array();
         var_406.push(new Tab(_navigator,const_329,const_389,new EventsTabPageDecorator(_navigator),MainViewCtrl.const_369));
         var_406.push(new Tab(_navigator,const_238,const_327,new RoomsTabPageDecorator(_navigator),MainViewCtrl.const_369));
         var_406.push(new Tab(_navigator,const_334,const_507,new OfficialTabPageDecorator(_navigator),MainViewCtrl.const_945));
         var_406.push(new Tab(_navigator,const_271,const_199,new MyRoomsTabPageDecorator(_navigator),MainViewCtrl.const_369));
         var_406.push(new Tab(_navigator,const_218,const_209,new SearchTabPageDecorator(_navigator),MainViewCtrl.const_734));
         setSelectedTab(const_329);
      }
      
      public function getSelected() : Tab
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_406)
         {
            if(_loc1_.selected)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      public function getTab(param1:int) : Tab
      {
         var _loc2_:* = null;
         for each(_loc2_ in var_406)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      private function clearSelected() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_406)
         {
            _loc1_.selected = false;
         }
      }
      
      public function onFrontPage() : Boolean
      {
         return this.getSelected().id == const_334;
      }
      
      public function get tabs() : Array
      {
         return var_406;
      }
      
      public function setSelectedTab(param1:int) : void
      {
         this.clearSelected();
         getTab(param1).selected = true;
      }
   }
}
