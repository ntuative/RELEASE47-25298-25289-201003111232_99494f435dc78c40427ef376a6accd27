package com.sulake.habbo.avatar
{
   import com.sulake.habbo.avatar.wardrobe.Outfit;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.incoming.avatar.WardrobeMessageEvent;
   import com.sulake.habbo.communication.messages.outgoing.avatar.GetWardrobeMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.avatar.SaveWardrobeOutfitMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.register.UpdateFigureDataMessageComposer;
   
   public class AvatarEditorHandler
   {
       
      
      private var _communication:IHabboCommunicationManager;
      
      private var var_13:HabboAvatarEditor;
      
      public function AvatarEditorHandler(param1:HabboAvatarEditor, param2:IHabboCommunicationManager)
      {
         super();
         var_13 = param1;
         _communication = param2;
         _communication.addHabboConnectionMessageEvent(new WardrobeMessageEvent(onWardrobe));
      }
      
      public function saveCurrentSelection() : void
      {
         if(_communication == null)
         {
            return;
         }
         var _loc1_:String = var_13.figureData.getFigureString();
         var _loc2_:String = var_13.figureData.gender;
         var _loc3_:* = new UpdateFigureDataMessageComposer(_loc1_,_loc2_);
         _communication.getHabboMainConnection(null).send(_loc3_);
         _loc3_.dispose();
         _loc3_ = null;
      }
      
      public function getWardrobe() : void
      {
         if(_communication == null)
         {
            return;
         }
         var _loc1_:* = new GetWardrobeMessageComposer();
         _communication.getHabboMainConnection(null).send(_loc1_);
         _loc1_.dispose();
         _loc1_ = null;
      }
      
      private function onWardrobe(param1:WardrobeMessageEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         var_13.wardrobe.updateMyLooks(param1.state,param1.outfits);
      }
      
      public function saveWardrobeOutfit(param1:int, param2:Outfit) : void
      {
         if(_communication == null)
         {
            return;
         }
         var _loc3_:* = new SaveWardrobeOutfitMessageComposer(param1,param2.figure,param2.gender);
         _communication.getHabboMainConnection(null).send(_loc3_);
         _loc3_.dispose();
         _loc3_ = null;
      }
      
      public function dispose() : void
      {
         _communication = null;
         var_13 = null;
      }
   }
}
