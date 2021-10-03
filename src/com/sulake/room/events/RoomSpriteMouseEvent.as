package com.sulake.room.events
{
   public class RoomSpriteMouseEvent
   {
       
      
      private var var_1908:Boolean = false;
      
      private var var_1906:Boolean = false;
      
      private var var_1911:String = "";
      
      private var _type:String = "";
      
      private var var_1910:Boolean = false;
      
      private var var_1907:Number = 0;
      
      private var var_1903:Number = 0;
      
      private var var_1904:Number = 0;
      
      private var var_1905:String = "";
      
      private var var_1909:Number = 0;
      
      private var var_1912:Boolean = false;
      
      public function RoomSpriteMouseEvent(param1:String, param2:String, param3:String, param4:Number, param5:Number, param6:Number = 0, param7:Number = 0, param8:Boolean = false, param9:Boolean = false, param10:Boolean = false, param11:Boolean = false)
      {
         super();
         _type = param1;
         var_1905 = param2;
         var_1911 = param3;
         var_1903 = param4;
         var_1904 = param5;
         var_1907 = param6;
         var_1909 = param7;
         var_1912 = param8;
         var_1906 = param9;
         var_1910 = param10;
         var_1908 = param11;
      }
      
      public function get ctrlKey() : Boolean
      {
         return var_1912;
      }
      
      public function get buttonDown() : Boolean
      {
         return var_1908;
      }
      
      public function get localX() : Number
      {
         return var_1907;
      }
      
      public function get localY() : Number
      {
         return var_1909;
      }
      
      public function get canvasId() : String
      {
         return var_1905;
      }
      
      public function get altKey() : Boolean
      {
         return var_1906;
      }
      
      public function get spriteTag() : String
      {
         return var_1911;
      }
      
      public function get type() : String
      {
         return _type;
      }
      
      public function get screenX() : Number
      {
         return var_1903;
      }
      
      public function get screenY() : Number
      {
         return var_1904;
      }
      
      public function get shiftKey() : Boolean
      {
         return var_1910;
      }
   }
}
