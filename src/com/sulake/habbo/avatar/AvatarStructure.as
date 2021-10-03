package com.sulake.habbo.avatar
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.habbo.avatar.actions.ActionDefinition;
   import com.sulake.habbo.avatar.actions.AvatarActionManager;
   import com.sulake.habbo.avatar.actions.IActionDefinition;
   import com.sulake.habbo.avatar.actions.IActiveActionData;
   import com.sulake.habbo.avatar.animation.AddDataContainer;
   import com.sulake.habbo.avatar.animation.Animation;
   import com.sulake.habbo.avatar.animation.AnimationLayerData;
   import com.sulake.habbo.avatar.animation.AnimationManager;
   import com.sulake.habbo.avatar.enum.AvatarDirectionAngle;
   import com.sulake.habbo.avatar.enum.AvatarType;
   import com.sulake.habbo.avatar.geometry.AvatarModelGeometry;
   import com.sulake.habbo.avatar.geometry.GeometryBodyPart;
   import com.sulake.habbo.avatar.geometry.GeometryItem;
   import com.sulake.habbo.avatar.structure.AnimationData;
   import com.sulake.habbo.avatar.structure.AvatarCanvas;
   import com.sulake.habbo.avatar.structure.AvatarStructureDownload;
   import com.sulake.habbo.avatar.structure.AvatarStructureDownloadSet;
   import com.sulake.habbo.avatar.structure.FigureData;
   import com.sulake.habbo.avatar.structure.IFigureData;
   import com.sulake.habbo.avatar.structure.PartSetsData;
   import com.sulake.habbo.avatar.structure.animation.ActionPart;
   import com.sulake.habbo.avatar.structure.animation.AnimationAction;
   import com.sulake.habbo.avatar.structure.figure.IFigurePart;
   import com.sulake.habbo.avatar.structure.figure.IFigurePartSet;
   import com.sulake.habbo.avatar.structure.figure.IPalette;
   import com.sulake.habbo.avatar.structure.figure.IPartColor;
   import com.sulake.habbo.avatar.structure.figure.ISetType;
   import com.sulake.habbo.avatar.structure.parts.PartDefinition;
   import com.sulake.habbo.avatar.structure.parts.PartOffsetData;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Shape;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.text.TextField;
   
   public class AvatarStructure extends EventDispatcher
   {
      
      public static const AVATAR_STRUCTURE_INIT:String = "AVATAR_STRUCTURE_INIT";
      
      public static const DOWNLOAD_SET_DONE:String = "DOWNLOAD_SET_DONE";
       
      
      private var var_383:PartSetsData;
      
      private var var_1726:PartOffsetData;
      
      private var var_779:AvatarActionManager;
      
      private var var_165:IAssetLibrary;
      
      private var var_966:IAssetLibrary;
      
      private var var_1374:Boolean = false;
      
      private var var_1725:AvatarRenderManager;
      
      private var var_382:FigureData;
      
      private var _animationData:AnimationData;
      
      private var _geometry:AvatarModelGeometry;
      
      private var var_641:String;
      
      private var var_1410:AvatarStructureDownloadSet;
      
      private var var_642:AnimationManager;
      
      public function AvatarStructure(param1:AvatarRenderManager, param2:IAssetLibrary, param3:IAssetLibrary, param4:String)
      {
         super();
         var_1725 = param1;
         var_165 = param2;
         var_966 = param3;
         var_382 = new FigureData();
         var_383 = new PartSetsData();
         _animationData = new AnimationData();
         var_1410 = new AvatarStructureDownloadSet();
         var_642 = new AnimationManager();
         var_641 = param4;
         var_1726 = PartOffsetData.getInstance(param3);
         init();
      }
      
      public function isMainAvatarSet(param1:String) : Boolean
      {
         return _geometry.isMainAvatarSet(param1);
      }
      
      public function getActionDefinitionWithState(param1:String) : ActionDefinition
      {
         return var_779.getActionDefinitionWithState(param1);
      }
      
      private function init() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         initGeometry();
         initActions();
         switch(var_641)
         {
            case AvatarType.const_78:
               _loc1_ = var_165.getAssetByName("HabboAvatarPartSets").content as XML;
               if(!var_383.parse(_loc1_))
               {
                  return;
               }
               _loc2_ = var_165.getAssetByName("HabboAvatarAnimation").content as XML;
               if(!_animationData.parse(_loc2_))
               {
                  return;
               }
               _loc3_ = var_165.getAssetByName("HabboAvatarFigure").content as XML;
               if(!var_382.parse(_loc3_))
               {
                  return;
               }
               break;
            case AvatarType.PET:
               _loc1_ = var_165.getAssetByName("HabboAvatarPetPartSets").content as XML;
               if(!var_383.parse(_loc1_))
               {
                  return;
               }
               _loc2_ = var_165.getAssetByName("HabboAvatarPetAnimation").content as XML;
               if(!_animationData.parse(_loc2_))
               {
                  return;
               }
               _loc3_ = var_165.getAssetByName("HabboAvatarPetFigure").content as XML;
               if(!var_382.parse(_loc3_))
               {
                  return;
               }
               break;
         }
         onStructureReady();
      }
      
      public function getCanvasOffsets(param1:Array, param2:String, param3:int) : Array
      {
         return var_779.getCanvasOffsets(param1,param2,param3);
      }
      
      public function injectFigureData(param1:XML) : void
      {
         var_382.append(param1);
      }
      
      public function getActionDefinition(param1:String) : ActionDefinition
      {
         return var_779.getActionDefinition(param1);
      }
      
      public function getActiveBodyPartIds(param1:IActiveActionData) : Array
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc2_:* = [];
         var _loc3_:Array = new Array();
         var _loc4_:String = param1.definition.geometryType;
         if(param1.definition.isAnimation)
         {
            _loc6_ = param1.definition.state + "." + param1.actionParameter;
            _loc7_ = var_642.getAnimation(_loc6_);
            if(_loc7_ != null)
            {
               _loc2_ = _loc7_.getAnimatedBodyPartIds(0);
               if(_loc7_.hasAddData())
               {
                  for each(_loc9_ in _loc7_.addData)
                  {
                     _loc5_ = _geometry.getBodyPart(_loc4_,_loc9_.align);
                     if(_loc5_ != null)
                     {
                        _loc10_ = <item id="" x="0" y="0" z="0" radius="0.01" nx="0" ny="0" nz="-1" double="1"/>;
                        _loc10_.@id = _loc9_.id;
                        _loc5_.addPart(_loc10_);
                        _loc11_ = <part/>;
                        _loc11_["set-type"] = _loc9_.id;
                        _loc12_ = var_383.addPartDefinition(_loc11_);
                        _loc12_.appendToFigure = true;
                        if(_loc9_.base == "")
                        {
                           _loc12_.staticId = 1;
                        }
                        if(_loc3_.indexOf(_loc5_.id) == -1)
                        {
                           _loc3_.push(_loc5_.id);
                        }
                     }
                  }
               }
            }
            for each(_loc8_ in _loc2_)
            {
               _loc5_ = _geometry.getBodyPart(_loc4_,_loc8_);
               if(_loc5_ != null)
               {
                  if(_loc3_.indexOf(_loc5_.id) == -1)
                  {
                     _loc3_.push(_loc5_.id);
                  }
               }
            }
         }
         else
         {
            _loc2_ = var_383.getActiveParts(param1.definition);
            for each(_loc13_ in _loc2_)
            {
               _loc5_ = _geometry.getBodyPartOfItem(_loc4_,_loc13_);
               if(_loc5_ != null)
               {
                  if(_loc3_.indexOf(_loc5_.id) == -1)
                  {
                     _loc3_.push(_loc5_.id);
                  }
               }
            }
         }
         return _loc3_;
      }
      
      public function getBodyParts(param1:String, param2:IActionDefinition, param3:int) : Array
      {
         var _loc4_:Number = AvatarDirectionAngle.const_1183[param3];
         return _geometry.getBodyPartsAtAngle(param1,_loc4_,param2);
      }
      
      public function getParts(param1:String, param2:AvatarFigureContainer, param3:IActiveActionData, param4:String, param5:int, param6:Array) : Array
      {
         var _loc9_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc14_:* = null;
         var _loc15_:* = null;
         var _loc16_:* = null;
         var _loc17_:* = null;
         var _loc18_:* = null;
         var _loc19_:* = null;
         var _loc20_:* = null;
         var _loc21_:int = 0;
         var _loc22_:* = null;
         var _loc23_:* = null;
         var _loc24_:* = null;
         var _loc25_:* = null;
         var _loc26_:* = null;
         var _loc27_:* = null;
         var _loc28_:* = null;
         var _loc29_:* = null;
         var _loc30_:* = null;
         var _loc31_:* = null;
         var _loc32_:* = false;
         var _loc33_:* = null;
         var _loc34_:* = null;
         var _loc35_:Boolean = false;
         var _loc36_:* = null;
         var _loc37_:Boolean = false;
         var _loc38_:* = NaN;
         var _loc39_:int = 0;
         var _loc40_:* = null;
         if(param3 == null)
         {
            Logger.log("[AvatarStructure] getParts action == NULL!! bodyPartId: " + param1);
            return [];
         }
         if(param1 == "item")
         {
            if(param2.getPartTypeIds().indexOf("ri") >= 0)
            {
            }
         }
         var _loc7_:ActionDefinition = var_779.getDefaultActionType();
         var _loc8_:Array = var_383.getActiveParts(param3.definition);
         var _loc10_:Array = new Array();
         if(param3.definition.isAnimation)
         {
            _loc17_ = param3.definition.state + "." + param3.actionParameter;
            _loc9_ = var_642.getAnimation(_loc17_);
            if(_loc9_ != null)
            {
               for each(_loc18_ in _loc9_.getAnimatedBodyPartIds(0))
               {
                  if(_loc18_ == param1)
                  {
                     _loc19_ = _geometry.getBodyPart(param4,_loc18_);
                     if(_loc19_ != null)
                     {
                        for each(_loc20_ in _loc19_.getDynamicParts())
                        {
                           _loc8_.push(_loc20_.id);
                        }
                     }
                  }
               }
            }
         }
         var _loc13_:Array = _geometry.getParts(param4,param1,param5,_loc8_);
         for each(_loc14_ in param2.getPartTypeIds())
         {
            _loc21_ = param2.getPartSetId(_loc14_);
            _loc22_ = param2.getPartColorIds(_loc14_);
            _loc23_ = var_382.getSetType(_loc14_);
            if(_loc23_ != null)
            {
               _loc24_ = var_382.getPalette(_loc23_.paletteID);
               if(_loc24_)
               {
                  _loc25_ = _loc23_.getPartSet(_loc21_);
                  if(_loc25_ != null)
                  {
                     param6 = param6.concat(_loc25_.hiddenLayers);
                     for each(_loc26_ in _loc25_.parts)
                     {
                        if(_loc13_.indexOf(_loc26_.type) > -1)
                        {
                           _loc27_ = [0];
                           _loc28_ = _animationData.getAction(param3.definition);
                           if(_loc28_ != null)
                           {
                              _loc34_ = _loc28_.getPart(_loc26_.type);
                              if(_loc34_ != null)
                              {
                                 _loc27_ = _loc34_.frames;
                              }
                           }
                           _loc29_ = param3.definition;
                           if(_loc8_.indexOf(_loc26_.type) == -1)
                           {
                              _loc29_ = _loc7_;
                           }
                           _loc12_ = var_383.getPartDefinition(_loc26_.type);
                           _loc30_ = _loc12_ == null ? _loc26_.type : _loc12_.flippedSetType;
                           if(_loc30_ == "")
                           {
                              _loc30_ = _loc26_.type;
                           }
                           if(_loc22_.length > _loc26_.colorLayerIndex - 1)
                           {
                              _loc31_ = _loc24_.getColor(_loc22_[_loc26_.colorLayerIndex - 1]);
                           }
                           _loc32_ = _loc26_.colorLayerIndex > 0;
                           _loc33_ = new AvatarImagePartContainer(param1,_loc26_.type,_loc26_.id,_loc31_,_loc27_,_loc29_,_loc32_,_loc26_.paletteMap,_loc30_);
                           _loc10_.push(_loc33_);
                        }
                     }
                  }
               }
            }
         }
         _loc16_ = new Array();
         for each(_loc11_ in _loc13_)
         {
            _loc35_ = false;
            for each(_loc15_ in _loc10_)
            {
               if(_loc15_.partType == _loc11_)
               {
                  _loc35_ = true;
                  if(param6.indexOf(_loc11_) == -1)
                  {
                     _loc16_.push(_loc15_);
                  }
               }
            }
            if(!_loc35_)
            {
               if(_loc8_.indexOf(_loc11_) > -1)
               {
                  _loc36_ = _geometry.getBodyPartOfItem(param4,_loc11_);
                  if(param1 != _loc36_.id)
                  {
                     Logger.log("BodypartId mismatch:" + param1 + " " + _loc36_.id);
                  }
                  else
                  {
                     _loc12_ = var_383.getPartDefinition(_loc11_);
                     _loc37_ = false;
                     _loc38_ = 1;
                     if(_loc12_.appendToFigure)
                     {
                        Logger.log("PART NOT FOUND, ALTHOUGH IT SHOULD HAVE BEEN! Add now?" + _loc11_);
                        _loc39_ = 1;
                        if(param3.actionParameter != "")
                        {
                           _loc39_ = parseInt(param3.actionParameter);
                        }
                        if(_loc12_.hasStaticId())
                        {
                           _loc39_ = _loc12_.staticId;
                           _loc12_.staticId = -1;
                        }
                        if(_loc9_ != null)
                        {
                           _loc40_ = _loc9_.getAddData(_loc11_);
                           if(_loc40_ != null)
                           {
                              _loc37_ = _loc40_.isBlended;
                              _loc38_ = Number(_loc40_.blend);
                           }
                        }
                        _loc33_ = new AvatarImagePartContainer(param1,_loc11_,_loc39_,null,[0],param3.definition,false,-1,_loc11_,_loc37_,_loc38_);
                        _loc16_.push(_loc33_);
                     }
                  }
               }
            }
         }
         return _loc16_;
      }
      
      public function get figureData() : IFigureData
      {
         return var_382;
      }
      
      private function initGeometry() : void
      {
         var _loc1_:* = null;
         switch(var_641)
         {
            case AvatarType.const_78:
               if(var_165.hasAsset("HabboAvatarGeometry"))
               {
                  _loc1_ = var_165.getAssetByName("HabboAvatarGeometry").content as XML;
                  _geometry = new AvatarModelGeometry(_loc1_);
               }
               else
               {
                  Logger.log("[AvatarStructure] Could not init human Geometry");
               }
               break;
            case AvatarType.PET:
               if(var_165.hasAsset("HabboAvatarPetGeometry"))
               {
                  _loc1_ = var_165.getAssetByName("HabboAvatarPetGeometry").content as XML;
                  _geometry = new AvatarModelGeometry(_loc1_);
               }
               else
               {
                  Logger.log("[AvatarStructure] Could not init pet Geometry");
               }
         }
      }
      
      public function get renderManager() : AvatarRenderManager
      {
         return var_1725;
      }
      
      private function onStructureReady(param1:Event = null) : void
      {
         Logger.log("[AvatarStructure] Structure " + var_641 + " ready to go!");
         if(var_641 == AvatarType.const_78)
         {
            var_383.getPartDefinition("ri").appendToFigure = true;
            var_383.getPartDefinition("li").appendToFigure = true;
         }
         registerAnimations();
         dispatchEvent(new Event(AVATAR_STRUCTURE_INIT));
      }
      
      public function initConfiguration(param1:IHabboConfigurationManager) : void
      {
         var _loc5_:String = param1.getKey("external.figurepartlist.txt");
         switch(var_641)
         {
            case AvatarType.const_78:
               if(var_165.hasAsset(_loc5_))
               {
                  var_165.removeAsset(var_165.getAssetByName(_loc5_));
               }
               var_1410.add(new AvatarStructureDownload(var_165,_loc5_,var_382));
               break;
            case AvatarType.PET:
         }
         var_1410.addEventListener(AvatarStructureDownloadSet.DOWNLOAD_SET_DONE,onStructureReady);
      }
      
      public function getAnimation(param1:String) : Animation
      {
         return var_642.getAnimation(param1);
      }
      
      public function getCanvas(param1:String, param2:String) : AvatarCanvas
      {
         return _geometry.getCanvas(param1,param2);
      }
      
      public function displayGeometry(param1:Stage) : void
      {
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:* = null;
         var _loc2_:BitmapData = new BitmapData(960,540,false,4294967295);
         var _loc3_:Bitmap = new Bitmap(_loc2_);
         param1.addChild(_loc3_);
         var _loc4_:Number = _loc2_.width / 2;
         var _loc5_:Number = _loc2_.height / 2;
         var _loc7_:TextField = new TextField();
         var _loc8_:Matrix = new Matrix();
         for each(_loc9_ in _geometry.getBodyPartIdsInAvatarSet("full"))
         {
            _loc10_ = _geometry.getBodyPart("vertical",_loc9_);
            Logger.log("Drawing bodypart : " + _loc9_);
            if(_loc10_ != null)
            {
               _loc11_ = _loc10_.location.x * 200;
               _loc12_ = _loc10_.location.z * 200;
               _loc13_ = _loc10_.radius * 200;
               _loc14_ = new Shape();
               _loc14_.graphics.lineStyle(1,4294901760,1);
               _loc14_.graphics.drawCircle(_loc4_ + _loc11_,_loc5_ + _loc12_,_loc13_);
               _loc2_.draw(_loc14_);
               _loc7_.text = _loc9_;
               _loc7_.textColor = 4294901760;
               _loc8_.identity();
               _loc8_.tx = _loc4_ + _loc11_ + _loc13_ - _loc7_.textWidth - 5;
               _loc8_.ty = _loc5_ + _loc12_ - 5;
               _loc2_.draw(_loc7_,_loc8_);
            }
            else
            {
               Logger.log("Could not draw bodypart : " + _loc9_);
            }
         }
      }
      
      private function initActions() : void
      {
         var_779 = new AvatarActionManager(var_165,var_641);
      }
      
      public function removeDynamicItems() : void
      {
         _geometry.removeDynamicItems();
      }
      
      public function getBodyPartsUnordered(param1:String) : Array
      {
         return _geometry.getBodyPartIdsInAvatarSet(param1);
      }
      
      private function registerAnimations() : void
      {
         var _loc2_:* = null;
         var _loc1_:int = 1;
         while(var_966.hasAsset("dance" + _loc1_))
         {
            _loc2_ = var_966.getAssetByName("dance" + _loc1_).content as XML;
            var_642.registerAnimation(this,_loc2_);
            _loc1_++;
         }
         _loc1_ = 1;
         while(var_966.hasAsset("fx" + _loc1_))
         {
            _loc2_ = var_966.getAssetByName("fx" + _loc1_).content as XML;
            var_642.registerAnimation(this,_loc2_);
            _loc1_++;
         }
      }
      
      public function getBodyPartData(param1:String, param2:int, param3:String) : AnimationLayerData
      {
         return var_642.getLayerData(param1,param2,param3);
      }
      
      public function getPartActionOffset(param1:int, param2:String, param3:String, param4:String, param5:int, param6:int) : Point
      {
         return var_1726.getOffset(param1,param2,param3,param4,param5,param6);
      }
      
      public function getPartColor(param1:AvatarFigureContainer, param2:String, param3:int = 0) : IPartColor
      {
         var _loc4_:Array = param1.getPartColorIds(param2);
         if(!_loc4_ || _loc4_.length < param3)
         {
            return null;
         }
         var _loc5_:ISetType = var_382.getSetType(param2);
         if(_loc5_ == null)
         {
            return null;
         }
         var _loc6_:IPalette = var_382.getPalette(_loc5_.paletteID);
         if(!_loc6_)
         {
            return null;
         }
         return _loc6_.getColor(_loc4_[param3]);
      }
      
      public function sortActions(param1:Array) : Array
      {
         return var_779.sortActions(param1);
      }
   }
}
