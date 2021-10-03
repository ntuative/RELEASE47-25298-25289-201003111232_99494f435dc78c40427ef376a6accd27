package com.sulake.core.runtime
{
   class ComponentInterfaceQueue implements IDisposable
   {
       
      
      private var var_1117:IID;
      
      private var _isDisposed:Boolean;
      
      private var var_756:Array;
      
      function ComponentInterfaceQueue(param1:IID)
      {
         super();
         var_1117 = param1;
         var_756 = new Array();
         _isDisposed = false;
      }
      
      public function get receivers() : Array
      {
         return var_756;
      }
      
      public function get identifier() : IID
      {
         return var_1117;
      }
      
      public function get disposed() : Boolean
      {
         return _isDisposed;
      }
      
      public function dispose() : void
      {
         if(!_isDisposed)
         {
            _isDisposed = true;
            var_1117 = null;
            while(false)
            {
               var_756.pop();
            }
            var_756 = null;
         }
      }
   }
}
