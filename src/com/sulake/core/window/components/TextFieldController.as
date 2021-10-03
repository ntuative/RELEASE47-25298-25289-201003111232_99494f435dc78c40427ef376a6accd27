package com.sulake.core.window.components
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.WindowContext;
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowState;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowNotifyEvent;
   import com.sulake.core.window.graphics.GraphicContext;
   import com.sulake.core.window.graphics.IGraphicContext;
   import com.sulake.core.window.utils.PropertyStruct;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFieldType;
   
   public class TextFieldController extends TextController implements ITextFieldWindow
   {
       
      
      protected var var_927:String = "";
      
      protected var var_786:Boolean = false;
      
      protected var var_926:uint = 500;
      
      protected var var_934:Boolean = false;
      
      public function TextFieldController(param1:String, param2:uint, param3:uint, param4:uint, param5:WindowContext, param6:Rectangle, param7:IWindow, param8:Function, param9:Array = null, param10:Array = null, param11:uint = 0)
      {
         param4 &= -1;
         param4 |= 0;
         var_7 = param6;
         _field = TextField(getGraphicContext(true).getDisplayObject());
         super(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11);
         _field.background = false;
         _field.selectable = true;
         _field.alwaysShowSelection = true;
         _field.mouseWheelEnabled = true;
         _field.type = TextFieldType.INPUT;
         _field.addEventListener(KeyboardEvent.KEY_DOWN,onKeyDownEvent);
         _field.addEventListener(KeyboardEvent.KEY_UP,onKeyUpEvent);
         _field.addEventListener(Event.CHANGE,onChangeEvent);
         _field.addEventListener(FocusEvent.FOCUS_IN,onFocusEvent);
         _field.addEventListener(FocusEvent.FOCUS_OUT,onFocusEvent);
         _field.addEventListener(Event.REMOVED_FROM_STAGE,onRemovedEvent);
         var_160 = false;
         var_786 = true;
      }
      
      override public function enable() : Boolean
      {
         if(super.enable())
         {
            _field.type = TextFieldType.INPUT;
            return true;
         }
         _field.type = TextFieldType.DYNAMIC;
         return false;
      }
      
      public function set toolTipCaption(param1:String) : void
      {
         var_927 = param1 == null ? "" : param1;
      }
      
      override protected function refreshTextImage() : void
      {
         if(false)
         {
            if(autoSize != TextFieldAutoSize.NONE)
            {
               width = _field.width;
            }
            else
            {
               _field.width = width;
            }
         }
         if(false)
         {
            if(autoSize != TextFieldAutoSize.NONE)
            {
               height = _field.height;
            }
            else
            {
               _field.height = height;
            }
         }
      }
      
      public function getMouseCursorByState(param1:uint) : uint
      {
         throw new Error("Unimplemented method!");
      }
      
      private function onRemovedEvent(param1:Event) : void
      {
         var event:Event = param1;
         try
         {
            if(getStateFlag(WindowState.const_73))
            {
               unfocus();
            }
         }
         catch(e:Error)
         {
            _context.handleError(WindowContext.ERROR_DURING_EVENT_HANDLING,e);
         }
      }
      
      override protected function forwardMouseEvent(param1:MouseEvent) : WindowEvent
      {
         if(param1.type == MouseEvent.MOUSE_DOWN)
         {
            focus();
         }
         return super.forwardMouseEvent(param1);
      }
      
      public function get toolTipCaption() : String
      {
         return var_927;
      }
      
      override public function getGraphicContext(param1:Boolean) : IGraphicContext
      {
         if(param1 && !var_16)
         {
            var_16 = new GraphicContext("GC {" + _name + "}",GraphicContext.GC_TYPE_TEXTFIELD,var_7);
         }
         return var_16;
      }
      
      override public function dispose() : void
      {
         _context.getWindowServices().getFocusManagerService().removeFocusWindow(this);
         var_934 = false;
         if(_field)
         {
            if(focused)
            {
               unfocus();
            }
            _field.removeEventListener(KeyboardEvent.KEY_DOWN,onKeyDownEvent);
            _field.removeEventListener(KeyboardEvent.KEY_UP,onKeyUpEvent);
            _field.removeEventListener(Event.CHANGE,onChangeEvent);
            _field.removeEventListener(FocusEvent.FOCUS_IN,onFocusEvent);
            _field.removeEventListener(FocusEvent.FOCUS_OUT,onFocusEvent);
            _field.removeEventListener(Event.REMOVED_FROM_STAGE,onRemovedEvent);
         }
         super.dispose();
      }
      
      override public function set autoSize(param1:String) : void
      {
         super.autoSize = param1;
         refreshAutoSize();
      }
      
      public function setMouseCursorByState(param1:uint, param2:uint) : void
      {
         throw new Error("Unimplemented method!");
      }
      
      public function showToolTip(param1:IToolTipWindow) : void
      {
         throw new Error("Unimplemented method!");
      }
      
      private function onKeyUpEvent(param1:KeyboardEvent) : void
      {
         var event:KeyboardEvent = param1;
         try
         {
            update(this,event);
         }
         catch(e:Error)
         {
            _context.handleError(WindowContext.ERROR_DURING_EVENT_HANDLING,e);
         }
      }
      
      override public function get properties() : Array
      {
         var _loc1_:Array = InteractiveController.writeInteractiveWindowProperties(this,super.properties);
         _loc1_.push(new PropertyStruct("focus_capturer",var_934,PropertyStruct.const_57,var_934 != false));
         return _loc1_;
      }
      
      public function set toolTipDelay(param1:uint) : void
      {
         var_926 = param1;
      }
      
      public function hideToolTip() : void
      {
         throw new Error("Unimplemented method!");
      }
      
      override public function update(param1:WindowController, param2:Event) : Boolean
      {
         var _loc3_:Boolean = super.update(param1,param2);
         switch(param2.type)
         {
            case WindowNotifyEvent.const_223:
               if(param1 == this)
               {
                  _field.width = this.width;
                  _field.height = this.height;
               }
         }
         if(param1 == this)
         {
            InteractiveController.processInteractiveWindowEvents(this,param2);
         }
         return _loc3_;
      }
      
      protected function refreshAutoSize() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(var_786 && autoSize != TextFieldAutoSize.NONE)
         {
            if(false)
            {
               _loc1_ = _field.localToGlobal(new Point(_field.x,_field.y));
               _loc2_ = new Point();
               getGlobalPosition(_loc2_);
               _loc3_ = new Point(_loc1_.x - _loc2_.x,_loc1_.y - _loc2_.y);
               setRectangle(var_7.x + _loc3_.x,var_7.y + _loc3_.y,_field.width,_field.height);
            }
         }
      }
      
      public function get mouseCursorType() : uint
      {
         return 0;
      }
      
      public function setSelection(param1:int, param2:int) : void
      {
         _field.setSelection(param1,param2);
      }
      
      override public function set text(param1:String) : void
      {
         super.text = param1;
         refreshAutoSize();
      }
      
      public function get selectionBeginIndex() : int
      {
         return _field.selectionBeginIndex;
      }
      
      public function get toolTipDelay() : uint
      {
         return var_926;
      }
      
      public function get selectionEndIndex() : int
      {
         return _field.selectionEndIndex;
      }
      
      override public function get caption() : String
      {
         return !!_field ? "null" : "";
      }
      
      private function onChangeEvent(param1:Event) : void
      {
         var event:Event = param1;
         try
         {
            refreshAutoSize();
            update(this,event);
         }
         catch(e:Error)
         {
            _context.handleError(WindowContext.ERROR_DURING_EVENT_HANDLING,e);
         }
      }
      
      override public function unfocus() : Boolean
      {
         if(_field)
         {
            if(false)
            {
               if(_field.stage.focus == _field)
               {
                  _field.stage.focus = null;
               }
            }
         }
         return super.unfocus();
      }
      
      override public function disable() : Boolean
      {
         if(super.disable())
         {
            _field.type = TextFieldType.DYNAMIC;
            return true;
         }
         _field.type = TextFieldType.INPUT;
         return false;
      }
      
      override public function focus() : Boolean
      {
         var _loc1_:Boolean = super.focus();
         if(_loc1_)
         {
            if(_field)
            {
               if(false)
               {
                  if(_field.stage.focus != _field)
                  {
                     _field.stage.focus = _field;
                  }
               }
            }
         }
         return _loc1_;
      }
      
      public function set mouseCursorType(param1:uint) : void
      {
      }
      
      override public function set properties(param1:Array) : void
      {
         var _loc2_:* = null;
         InteractiveController.readInteractiveWindowProperties(this,param1);
         for each(_loc2_ in param1)
         {
            if(_loc2_.key == "focus_capturer")
            {
               var_934 = _loc2_.value as Boolean;
               if(var_934)
               {
                  _context.getWindowServices().getFocusManagerService().registerFocusWindow(this);
               }
               break;
            }
         }
         super.properties = param1;
      }
      
      public function get focused() : Boolean
      {
         if(_field)
         {
            if(false)
            {
               return _field.stage.focus == _field;
            }
         }
         return false;
      }
      
      private function onFocusEvent(param1:FocusEvent) : void
      {
         var event:FocusEvent = param1;
         try
         {
            if(event.type == FocusEvent.FOCUS_IN)
            {
               if(!getStateFlag(WindowState.const_73))
               {
                  focus();
               }
            }
            else if(event.type == FocusEvent.FOCUS_OUT)
            {
               if(getStateFlag(WindowState.const_73))
               {
                  unfocus();
               }
            }
         }
         catch(e:Error)
         {
            _context.handleError(WindowContext.ERROR_DURING_EVENT_HANDLING,e);
         }
      }
      
      private function onKeyDownEvent(param1:KeyboardEvent) : void
      {
         var event:KeyboardEvent = param1;
         try
         {
            update(this,event);
         }
         catch(e:Error)
         {
            _context.handleError(WindowContext.ERROR_DURING_EVENT_HANDLING,e);
         }
      }
   }
}
