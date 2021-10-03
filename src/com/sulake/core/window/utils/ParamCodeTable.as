package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowParam;
   import flash.utils.Dictionary;
   
   public class ParamCodeTable extends WindowParam
   {
       
      
      public function ParamCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["null"] = const_108;
         param1["bound_to_parent_rect"] = const_87;
         param1["child_window"] = const_796;
         param1["embedded_controller"] = const_285;
         param1["resize_to_accommodate_children"] = const_64;
         param1["input_event_processor"] = const_50;
         param1["internal_event_handling"] = const_547;
         param1["mouse_dragging_target"] = const_200;
         param1["mouse_dragging_trigger"] = const_291;
         param1["mouse_scaling_target"] = const_242;
         param1["mouse_scaling_trigger"] = const_429;
         param1["horizontal_mouse_scaling_trigger"] = const_229;
         param1["vertical_mouse_scaling_trigger"] = const_208;
         param1["observe_parent_input_events"] = const_810;
         param1["optimize_region_to_layout_size"] = const_444;
         param1["parent_window"] = const_846;
         param1["relative_horizontal_scale_center"] = const_173;
         param1["relative_horizontal_scale_fixed"] = const_120;
         param1["relative_horizontal_scale_move"] = const_296;
         param1["relative_horizontal_scale_strech"] = const_247;
         param1["relative_scale_center"] = const_962;
         param1["relative_scale_fixed"] = const_629;
         param1["relative_scale_move"] = const_976;
         param1["relative_scale_strech"] = const_882;
         param1["relative_vertical_scale_center"] = const_178;
         param1["relative_vertical_scale_fixed"] = const_130;
         param1["relative_vertical_scale_move"] = const_293;
         param1["relative_vertical_scale_strech"] = const_256;
         param1["on_resize_align_left"] = const_708;
         param1["on_resize_align_right"] = const_473;
         param1["on_resize_align_center"] = const_465;
         param1["on_resize_align_top"] = const_514;
         param1["on_resize_align_bottom"] = const_371;
         param1["on_resize_align_middle"] = const_356;
         param1["on_accommodate_align_left"] = const_910;
         param1["on_accommodate_align_right"] = const_483;
         param1["on_accommodate_align_center"] = const_722;
         param1["on_accommodate_align_top"] = const_827;
         param1["on_accommodate_align_bottom"] = WINDOW_PARAM_ON_ACCOMMODATE_ALIGN_BOTTOM;
         param1["on_accommodate_align_middle"] = const_732;
         param1["route_input_events_to_parent"] = const_374;
         param1["use_parent_graphic_context"] = const_32;
         param1["draggable_with_mouse"] = const_883;
         param1["scalable_with_mouse"] = const_804;
         param1["reflect_horizontal_resize_to_parent"] = const_421;
         param1["reflect_vertical_resize_to_parent"] = WINDOW_PARAM_REFLECT_VERTICAL_RESIZE_TO_PARENT;
         param1["reflect_resize_to_parent"] = const_263;
         if(param2 != null)
         {
            for(_loc3_ in param1)
            {
               if(param2[param1[_loc3_]] != null)
               {
                  if(param1[_loc3_] != 0)
                  {
                     Logger.log("Conflictiong flags in window params: \"" + _loc3_ + "\"!");
                  }
               }
               param2[param1[_loc3_]] = _loc3_;
            }
         }
      }
   }
}
