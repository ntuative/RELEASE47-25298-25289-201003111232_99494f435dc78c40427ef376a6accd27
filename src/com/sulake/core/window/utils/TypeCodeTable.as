package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowType;
   import flash.utils.Dictionary;
   
   public class TypeCodeTable extends WindowType
   {
       
      
      public function TypeCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["background"] = const_521;
         param1["bitmap"] = const_602;
         param1["border"] = const_693;
         param1["border_notify"] = const_1341;
         param1["button"] = const_409;
         param1["button_thick"] = const_603;
         param1["button_icon"] = const_1362;
         param1["button_group_left"] = const_712;
         param1["button_group_center"] = const_694;
         param1["button_group_right"] = const_500;
         param1["canvas"] = const_650;
         param1["checkbox"] = const_624;
         param1["closebutton"] = const_998;
         param1["container"] = const_297;
         param1["container_button"] = const_582;
         param1["display_object_wrapper"] = const_554;
         param1["dropmenu"] = const_393;
         param1["dropmenu_item"] = const_460;
         param1["frame"] = const_298;
         param1["frame_notify"] = const_1143;
         param1["header"] = const_632;
         param1["icon"] = const_912;
         param1["itemgrid"] = const_1009;
         param1["itemgrid_horizontal"] = const_377;
         param1["itemgrid_vertical"] = const_700;
         param1["itemlist"] = const_854;
         param1["itemlist_horizontal"] = const_317;
         param1["itemlist_vertical"] = const_328;
         param1["maximizebox"] = const_1233;
         param1["menu"] = const_1153;
         param1["menu_item"] = WINDOW_TYPE_MENU_ITEM;
         param1["submenu"] = const_925;
         param1["minimizebox"] = const_1246;
         param1["notify"] = const_1386;
         param1["null"] = const_703;
         param1["password"] = const_516;
         param1["radiobutton"] = const_735;
         param1["region"] = const_412;
         param1["restorebox"] = const_1308;
         param1["scaler"] = const_791;
         param1["scaler_horizontal"] = const_1199;
         param1["scaler_vertical"] = const_1206;
         param1["scrollbar_horizontal"] = const_398;
         param1["scrollbar_vertical"] = const_569;
         param1["scrollbar_slider_button_up"] = const_840;
         param1["scrollbar_slider_button_down"] = const_876;
         param1["scrollbar_slider_button_left"] = const_989;
         param1["scrollbar_slider_button_right"] = const_843;
         param1["scrollbar_slider_bar_horizontal"] = const_1008;
         param1["scrollbar_slider_bar_vertical"] = const_825;
         param1["scrollbar_slider_track_horizontal"] = const_801;
         param1["scrollbar_slider_track_vertical"] = const_988;
         param1["scrollable_itemlist"] = const_1192;
         param1["scrollable_itemlist_vertical"] = const_427;
         param1["scrollable_itemlist_horizontal"] = const_980;
         param1["selector"] = const_498;
         param1["selector_list"] = const_501;
         param1["submenu"] = const_925;
         param1["tab_button"] = const_662;
         param1["tab_container_button"] = const_831;
         param1["tab_context"] = const_373;
         param1["tab_content"] = const_991;
         param1["tab_selector"] = WINDOW_TYPE_TAB_SELECTOR;
         param1["text"] = const_728;
         param1["input"] = const_663;
         param1["toolbar"] = const_1350;
         param1["tooltip"] = const_309;
         if(param2 != null)
         {
            for(_loc3_ in param1)
            {
               if(param2[param1[_loc3_]] != null)
               {
                  Logger.log("Overlapping window type code " + _loc3_ + "!");
               }
               param2[param1[_loc3_]] = _loc3_;
            }
         }
      }
   }
}
