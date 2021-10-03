package com.sulake.habbo.navigator.mainview.tabpagedecorators
{
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.domain.Tabs;
   import com.sulake.habbo.navigator.mainview.MainViewCtrl;
   
   public class OfficialTabPageDecorator implements ITabPageDecorator
   {
       
      
      private var _navigator:HabboNavigator;
      
      public function OfficialTabPageDecorator(param1:HabboNavigator)
      {
         super();
         _navigator = param1;
      }
      
      public function tabSelected() : void
      {
      }
      
      public function refreshCustomContent(param1:IWindowContainer) : void
      {
      }
      
      public function refreshFooter(param1:IWindowContainer) : void
      {
      }
      
      public function navigatorOpenedWhileInTab() : void
      {
         _navigator.mainViewCtrl.startSearch(Tabs.const_334,Tabs.const_507,"-1",MainViewCtrl.const_945);
      }
   }
}
