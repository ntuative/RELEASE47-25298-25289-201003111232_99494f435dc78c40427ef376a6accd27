package com.sulake.core.window.utils
{
   import com.sulake.core.utils.Map;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.getQualifiedClassName;
   
   public class PropertyStruct
   {
      
      public static const const_567:String = "Rectangle";
      
      public static const const_57:String = "Boolean";
      
      public static const const_709:String = "Number";
      
      public static const const_60:String = "int";
      
      public static const STRING:String = "String";
      
      public static const const_719:String = "Point";
      
      public static const const_1006:String = "Array";
      
      public static const const_916:String = "uint";
      
      public static const const_458:String = "hex";
      
      public static const const_915:String = "Map";
       
      
      private var var_599:String;
      
      private var var_176:Object;
      
      private var var_2324:Boolean;
      
      private var _type:String;
      
      private var var_2149:Boolean;
      
      public function PropertyStruct(param1:String, param2:Object, param3:String, param4:Boolean)
      {
         super();
         var_599 = param1;
         var_176 = param2;
         _type = param3;
         var_2149 = param4;
         var_2324 = param3 == const_915 || param3 == const_1006 || param3 == const_719 || param3 == const_567;
      }
      
      public function get type() : String
      {
         return _type;
      }
      
      public function toString() : String
      {
         switch(_type)
         {
            case const_458:
               return "0x" + uint(var_176).toString(16);
            case const_57:
               return Boolean(var_176) == true ? "true" : "false";
            case const_719:
               return "Point(" + Point(var_176).x + ", " + Point(var_176).y + ")";
            case const_567:
               return "Rectangle(" + Rectangle(var_176).x + ", " + Rectangle(var_176).y + ", " + Rectangle(var_176).width + ", " + Rectangle(var_176).height + ")";
            default:
               return String(value);
         }
      }
      
      public function toXMLString() : String
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         switch(_type)
         {
            case const_915:
               _loc3_ = var_176 as Map;
               _loc1_ = "<var key=\"" + var_599 + "\">\r<value>\r<" + _type + ">\r";
               _loc2_ = 0;
               while(_loc2_ < _loc3_.length)
               {
                  _loc1_ += "<var key=\"" + _loc3_.getKey(_loc2_) + "\" value=\"" + _loc3_.getWithIndex(_loc2_) + "\" type=\"" + getQualifiedClassName(_loc3_.getWithIndex(_loc2_)) + "\" />\r";
                  _loc2_++;
               }
               _loc1_ += "</" + _type + ">\r</value>\r</var>";
               break;
            case const_1006:
               _loc4_ = var_176 as Array;
               _loc1_ = "<var key=\"" + var_599 + "\">\r<value>\r<" + _type + ">\r";
               _loc2_ = 0;
               while(_loc2_ < _loc4_.length)
               {
                  _loc1_ += "<var key=\"" + String(_loc2_) + "\" value=\"" + _loc4_[_loc2_] + "\" type=\"" + getQualifiedClassName(_loc4_[_loc2_]) + "\" />\r";
                  _loc2_++;
               }
               _loc1_ += "</" + _type + ">\r</value>\r</var>";
               break;
            case const_719:
               _loc5_ = var_176 as Point;
               _loc1_ = "<var key=\"" + var_599 + "\">\r<value>\r<" + _type + ">\r";
               _loc1_ += "<var key=\"x\" value=\"" + _loc5_.x + "\" type=\"" + const_60 + "\" />\r";
               _loc1_ += "<var key=\"y\" value=\"" + _loc5_.y + "\" type=\"" + const_60 + "\" />\r";
               _loc1_ += "</" + _type + ">\r</value>\r</var>";
               break;
            case const_567:
               _loc6_ = var_176 as Rectangle;
               _loc1_ = "<var key=\"" + var_599 + "\">\r<value>\r<" + _type + ">\r";
               _loc1_ += "<var key=\"x\" value=\"" + _loc6_.x + "\" type=\"" + const_60 + "\" />\r";
               _loc1_ += "<var key=\"y\" value=\"" + _loc6_.y + "\" type=\"" + const_60 + "\" />\r";
               _loc1_ += "<var key=\"width\" value=\"" + _loc6_.width + "\" type=\"" + const_60 + "\" />\r";
               _loc1_ += "<var key=\"height\" value=\"" + _loc6_.height + "\" type=\"" + const_60 + "\" />\r";
               _loc1_ += "</" + _type + ">\r</value>\r</var>";
               break;
            case const_458:
               _loc1_ = "<var key=\"" + var_599 + "\" value=\"" + "0x" + uint(var_176).toString(16) + "\" type=\"" + _type + "\" />";
               break;
            default:
               _loc1_ = "<var key=\"" + var_599 + "\" value=\"" + var_176 + "\" type=\"" + _type + "\" />";
         }
         return _loc1_;
      }
      
      public function get value() : Object
      {
         return var_176;
      }
      
      public function get valid() : Boolean
      {
         return var_2149;
      }
      
      public function get key() : String
      {
         return var_599;
      }
   }
}
