package com.sulake.core.window.utils
{
   import com.sulake.core.window.IWindowContext;
   import flash.display.DisplayObject;
   
   public class InternalWindowServices implements IInternalWindowServices
   {
       
      
      private var var_118:DisplayObject;
      
      private var var_2285:uint;
      
      private var var_773:IWindowToolTipAgentService;
      
      private var var_770:IWindowMouseScalingService;
      
      private var var_236:IWindowContext;
      
      private var var_771:IWindowFocusManagerService;
      
      private var var_772:IWindowMouseListenerService;
      
      private var var_774:IWindowMouseDraggingService;
      
      public function InternalWindowServices(param1:IWindowContext, param2:DisplayObject)
      {
         super();
         var_2285 = 0;
         var_118 = param2;
         var_236 = param1;
         var_774 = new WindowMouseDragger(param2);
         var_770 = new WindowMouseScaler(param2);
         var_772 = new WindowMouseListener(param2);
         var_771 = new FocusManager(param2);
         var_773 = new WindowToolTipAgent(param2);
      }
      
      public function getMouseScalingService() : IWindowMouseScalingService
      {
         return var_770;
      }
      
      public function getFocusManagerService() : IWindowFocusManagerService
      {
         return var_771;
      }
      
      public function getToolTipAgentService() : IWindowToolTipAgentService
      {
         return var_773;
      }
      
      public function dispose() : void
      {
         if(var_774 != null)
         {
            var_774.dispose();
            var_774 = null;
         }
         if(var_770 != null)
         {
            var_770.dispose();
            var_770 = null;
         }
         if(var_772 != null)
         {
            var_772.dispose();
            var_772 = null;
         }
         if(var_771 != null)
         {
            var_771.dispose();
            var_771 = null;
         }
         if(var_773 != null)
         {
            var_773.dispose();
            var_773 = null;
         }
         var_236 = null;
      }
      
      public function getMouseListenerService() : IWindowMouseListenerService
      {
         return var_772;
      }
      
      public function getMouseDraggingService() : IWindowMouseDraggingService
      {
         return var_774;
      }
   }
}
