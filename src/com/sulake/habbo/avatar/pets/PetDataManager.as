package com.sulake.habbo.avatar.pets
{
   import com.sulake.core.assets.AssetLibraryCollection;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.utils.Map;
   
   public class PetDataManager implements IPetDataManager
   {
       
      
      private var var_382:XML;
      
      private var var_566:Map;
      
      public function PetDataManager(param1:AssetLibraryCollection, param2:Array)
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         super();
         var_566 = new Map();
         for each(_loc3_ in param2)
         {
            _loc4_ = param1.getAssetLibraryByName(_loc3_);
            if(_loc4_ != null)
            {
               _loc5_ = _loc4_.manifest;
               if(_loc4_.hasAsset("petData"))
               {
                  _loc6_ = (_loc4_.getAssetByName("petData") as XmlAsset).content as XML;
                  var_566.add(int(_loc6_.@species),new PetData(_loc6_));
               }
            }
         }
      }
      
      public function getPetData(param1:int) : IPetData
      {
         return var_566.getValue(param1) as IPetData;
      }
      
      public function createAvatarFigureString(param1:String) : String
      {
         var _loc2_:Array = param1.split(" ");
         if(_loc2_.length != 3)
         {
            return param1;
         }
         var _loc3_:int = parseInt(_loc2_[0]);
         var _loc4_:int = parseInt(_loc2_[1]);
         var _loc5_:uint = parseInt(_loc2_[2],16);
         var _loc6_:PetData = var_566.getValue(_loc3_);
         if(_loc6_ == null)
         {
            Logger.log("Could not find Pet Data: " + _loc3_);
            return param1;
         }
         var _loc7_:Breed = _loc6_.breeds[_loc4_];
         var _loc8_:PetColor = _loc6_.findColor(_loc5_);
         if(_loc7_ == null)
         {
            return param1;
         }
         if(_loc8_ == null)
         {
            return _loc7_.avatarFigureString;
         }
         var _loc9_:Array = _loc7_.avatarFigureString.split(".");
         return _loc9_.join(_loc8_.figurePartPaletteColorId + ".");
      }
      
      public function createAvatarFigureStringNew(param1:int, param2:int, param3:uint) : String
      {
         var _loc4_:PetData = var_566.getValue(param1);
         if(_loc4_ == null)
         {
            Logger.log("Could not find Pet Data: " + param1);
            return "";
         }
         var _loc5_:Breed = _loc4_.findBreed(param2);
         var _loc6_:PetColor = _loc4_.findColor(param3);
         if(_loc5_ == null)
         {
            return "";
         }
         if(_loc6_ == null)
         {
            return _loc5_.avatarFigureString;
         }
         var _loc7_:Array = _loc5_.avatarFigureString.split(".");
         return _loc7_.join(_loc6_.figurePartPaletteColorId + ".");
      }
      
      public function populateFigureData(param1:XML) : void
      {
         var targetSets:Array = null;
         var targetPalette:XML = null;
         var speciesKeys:Array = null;
         var key:int = 0;
         var petData:PetData = null;
         var petColorData:PetColor = null;
         var breed:Breed = null;
         var colorValue:String = null;
         var color:XML = null;
         var colorId:int = 0;
         var avatarFigureString:String = null;
         var targetSetName:String = null;
         var figureTargetSet:XML = null;
         var figurePart:XML = null;
         var setId:int = 0;
         var figureSet:XML = null;
         var figureData:XML = param1;
         targetSets = ["pbd","phd","ptl"];
         targetPalette = figureData.colors.palette.(@id == "1")[0];
         speciesKeys = var_566.getKeys();
         for each(key in speciesKeys)
         {
            petData = var_566.getValue(key);
            if(petData != null)
            {
               for each(petColorData in petData.colors)
               {
                  colorValue = petColorData.rgb.toString(16);
                  color = targetPalette.color.(text() == colorValue)[0];
                  if(color == null)
                  {
                     colorId = targetPalette.children().length() + 1;
                     color = <color id="{colorId}" index="{colorId}" club="0" selectable="1">{colorValue}</color>;
                     targetPalette.appendChild(color);
                  }
                  petColorData.figurePartPaletteColorId = parseInt(color.@id);
               }
               for each(breed in petData.breeds)
               {
                  avatarFigureString = "";
                  for each(targetSetName in targetSets)
                  {
                     figureTargetSet = figureData.sets.settype.(@type == targetSetName)[0];
                     if(figureTargetSet == null)
                     {
                        Logger.log("Could not find Figure Target Set for populating Pet Data: " + targetSetName);
                     }
                     else
                     {
                        figurePart = figureTargetSet.const_1132.part.(@id == petData.species).(hasOwnProperty("palettemapid") && @palettemapid == breed.patternId)[0];
                        if(figurePart == null)
                        {
                        }
                        setId = figureTargetSet.children().length() + 1;
                        figureSet = <set id="{setId}" gender="U" club="0" colorable="1" selectable="1"/>;
                        figurePart = <part id="{petData.species}" breed="{breed.id}" type="{targetSetName}" colorable="1" index="1"/>;
                        if(breed.patternId >= 0)
                        {
                           figurePart.@palettemapid = breed.patternId;
                        }
                        figureSet.appendChild(figurePart);
                        figureTargetSet.appendChild(figureSet);
                        avatarFigureString += targetSetName + "-" + setId + "-" + ".";
                     }
                  }
                  breed.avatarFigureString = avatarFigureString;
               }
            }
         }
      }
      
      public function get species() : Map
      {
         return var_566;
      }
   }
}
