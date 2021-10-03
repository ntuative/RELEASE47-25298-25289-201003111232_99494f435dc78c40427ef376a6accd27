package deng.fzip
{
   import deng.utils.ChecksumUtil;
   import flash.utils.*;
   
   public class FZipFile
   {
      
      public static const const_540:int = 8;
      
      public static const const_1516:int = 10;
      
      public static const const_1198:int = 6;
      
      private static var var_1035:Boolean = describeType(ByteArray).factory.method.(@name == "uncompress").hasComplexContent();
      
      public static const const_1239:int = 0;
      
      public static const const_1430:int = 1;
      
      public static const const_1537:int = 2;
      
      public static const const_1544:int = 3;
      
      public static const const_1546:int = 4;
      
      public static const const_1462:int = 5;
      
      public static const const_1487:int = 9;
      
      public static const const_1586:int = 7;
       
      
      private var var_172:uint = 0;
      
      private var var_1036:uint = 0;
      
      private var var_698:Date;
      
      private var var_2023:int = -1;
      
      private var parseFunc:Function;
      
      private var var_492:Boolean = false;
      
      private var var_2314:int = -1;
      
      private var var_1262:uint = 0;
      
      private var var_2024:String = "";
      
      private var _extraFields:Dictionary;
      
      private var var_849:uint;
      
      private var var_21:ByteArray;
      
      private var var_699:uint;
      
      private var var_1512:Boolean = false;
      
      private var var_2313:int = -1;
      
      private var var_1511:String = "2.0";
      
      private var var_171:Boolean = false;
      
      private var var_2022:Boolean = false;
      
      private var var_353:String;
      
      private var var_575:uint = 0;
      
      private var var_1261:int = 0;
      
      private var var_404:String = "";
      
      private var var_700:int = 8;
      
      private var var_1510:Boolean = false;
      
      public function FZipFile(param1:String = "utf-8")
      {
         parseFunc = parseFileHead;
         super();
         var_353 = param1;
         _extraFields = new Dictionary();
         var_21 = new ByteArray();
         var_21.endian = Endian.BIG_ENDIAN;
      }
      
      public function get sizeUncompressed() : uint
      {
         return var_575;
      }
      
      public function set filename(param1:String) : void
      {
         var_404 = param1;
      }
      
      protected function uncompress() : void
      {
         if(var_171 && false)
         {
            var_21.position = 0;
            if(var_1035)
            {
               var_21.uncompress.apply(var_21,["deflate"]);
            }
            else
            {
               var_21.uncompress();
            }
            var_21.position = 0;
            var_171 = false;
         }
      }
      
      public function get filename() : String
      {
         return var_404;
      }
      
      public function get date() : Date
      {
         return var_698;
      }
      
      function parse(param1:IDataInput) : Boolean
      {
         while(param1.bytesAvailable && parseFunc(param1))
         {
         }
         return parseFunc === parseFileIdle;
      }
      
      private function parseFileContent(param1:IDataInput) : Boolean
      {
         if(var_1510)
         {
            parseFunc = parseFileIdle;
            throw new Error("Data descriptors are not supported.");
         }
         if(var_172 == 0)
         {
            parseFunc = parseFileIdle;
         }
         else
         {
            if(param1.bytesAvailable < var_172)
            {
               return false;
            }
            parseContent(param1);
            parseFunc = parseFileIdle;
         }
         return true;
      }
      
      public function get versionNumber() : String
      {
         return var_1511;
      }
      
      public function getContentAsString(param1:Boolean = true, param2:String = "utf-8") : String
      {
         var _loc3_:* = null;
         if(var_171)
         {
            uncompress();
         }
         var_21.position = 0;
         if(param2 == "utf-8")
         {
            _loc3_ = var_21.readUTFBytes(var_21.bytesAvailable);
         }
         else
         {
            _loc3_ = var_21.readMultiByte(var_21.bytesAvailable,param2);
         }
         var_21.position = 0;
         if(param1)
         {
            compress();
         }
         return _loc3_;
      }
      
      private function parseFileIdle(param1:IDataInput) : Boolean
      {
         return false;
      }
      
      protected function parseContent(param1:IDataInput) : void
      {
         var _loc2_:* = 0;
         if(var_700 === const_540 && !var_1512)
         {
            if(var_1035)
            {
               param1.readBytes(var_21,0,var_172);
            }
            else
            {
               if(!var_492)
               {
                  throw new Error("Adler32 checksum not found.");
               }
               var_21.writeByte(120);
               _loc2_ = uint(~var_2023 << 6 & 192);
               _loc2_ += 31 - (30720 | _loc2_) % 31;
               var_21.writeByte(_loc2_);
               param1.readBytes(var_21,2,var_172);
               var_21.position = var_21.length;
               var_21.writeUnsignedInt(var_849);
            }
            var_171 = true;
         }
         else
         {
            if(var_700 != const_1239)
            {
               throw new Error("Compression method " + var_700 + " is not supported.");
            }
            param1.readBytes(var_21,0,var_172);
            var_171 = false;
         }
         var_21.position = 0;
      }
      
      private function parseFileHead(param1:IDataInput) : Boolean
      {
         if(param1.bytesAvailable >= 30)
         {
            parseHead(param1);
            if(var_1036 + var_1262 > 0)
            {
               parseFunc = parseFileHeadExt;
            }
            else
            {
               parseFunc = parseFileContent;
            }
            return true;
         }
         return false;
      }
      
      public function setContentAsString(param1:String, param2:String = "utf-8") : void
      {
         var_21.length = 0;
         var_21.position = 0;
         var_171 = false;
         if(param1 != null && param1.length > 0)
         {
            if(param2 == "utf-8")
            {
               var_21.writeUTFBytes(param1);
            }
            else
            {
               var_21.writeMultiByte(param1,param2);
            }
            var_699 = ChecksumUtil.CRC32(var_21);
            var_492 = false;
         }
         compress();
      }
      
      public function set date(param1:Date) : void
      {
         var_698 = param1 != null ? param1 : new Date();
      }
      
      public function serialize(param1:IDataOutput, param2:Boolean, param3:Boolean = false, param4:uint = 0) : uint
      {
         var _loc10_:* = null;
         var _loc15_:* = null;
         var _loc16_:Boolean = false;
         if(param1 == null)
         {
            return 0;
         }
         if(param3)
         {
            param1.writeUnsignedInt(33639248);
            param1.writeShort(var_1261 << 8 | 20);
         }
         else
         {
            param1.writeUnsignedInt(67324752);
         }
         param1.writeShort(var_1261 << 8 | 20);
         param1.writeShort(var_353 == "utf-8" ? 2048 : 0);
         param1.writeShort(const_540);
         var _loc5_:Date = var_698 != null ? var_698 : new Date();
         var _loc6_:uint = uint(_loc5_.getSeconds()) | uint(_loc5_.getMinutes()) << 5 | uint(_loc5_.getHours()) << 11;
         var _loc7_:uint = uint(_loc5_.getDate()) | uint(_loc5_.getMonth() + 1) << 5 | uint(_loc5_.getFullYear() - 1980) << 9;
         param1.writeShort(_loc6_);
         param1.writeShort(_loc7_);
         param1.writeUnsignedInt(var_699);
         param1.writeUnsignedInt(var_172);
         param1.writeUnsignedInt(var_575);
         var _loc8_:ByteArray = new ByteArray();
         _loc8_.endian = Endian.LITTLE_ENDIAN;
         if(var_353 == "utf-8")
         {
            _loc8_.writeUTFBytes(var_404);
         }
         else
         {
            _loc8_.writeMultiByte(var_404,var_353);
         }
         var _loc9_:uint = _loc8_.position;
         for(_loc10_ in _extraFields)
         {
            _loc15_ = _extraFields[_loc10_] as ByteArray;
            if(_loc15_ != null)
            {
               _loc8_.writeShort(uint(_loc10_));
               _loc8_.writeShort(uint(_loc15_.length));
               _loc8_.writeBytes(_loc15_);
            }
         }
         if(param2)
         {
            if(!var_492)
            {
               _loc16_ = var_171;
               if(_loc16_)
               {
                  uncompress();
               }
               var_849 = ChecksumUtil.Adler32(var_21,0,var_21.length);
               var_492 = true;
               if(_loc16_)
               {
                  compress();
               }
            }
            _loc8_.writeShort(56026);
            _loc8_.writeShort(4);
            _loc8_.writeUnsignedInt(var_849);
         }
         var _loc11_:uint = _loc8_.position - _loc9_;
         if(param3 && false)
         {
            if(var_353 == "utf-8")
            {
               _loc8_.writeUTFBytes(var_2024);
            }
            else
            {
               _loc8_.writeMultiByte(var_2024,var_353);
            }
         }
         var _loc12_:uint = _loc8_.position - _loc9_ - _loc11_;
         param1.writeShort(_loc9_);
         param1.writeShort(_loc11_);
         if(param3)
         {
            param1.writeShort(_loc12_);
            param1.writeShort(0);
            param1.writeShort(0);
            param1.writeUnsignedInt(0);
            param1.writeUnsignedInt(param4);
         }
         if(_loc9_ + _loc11_ + _loc12_ > 0)
         {
            param1.writeBytes(_loc8_);
         }
         var _loc13_:int = 0;
         if(!param3 && var_172 > 0)
         {
            if(var_1035)
            {
               _loc13_ = 0;
               param1.writeBytes(var_21,0,_loc13_);
            }
            else
            {
               _loc13_ = 4294967290;
               param1.writeBytes(var_21,2,_loc13_);
            }
         }
         var _loc14_:uint = 30 + _loc9_ + _loc11_ + _loc12_ + _loc13_;
         if(param3)
         {
            _loc14_ += 16;
         }
         return _loc14_;
      }
      
      public function get sizeCompressed() : uint
      {
         return var_172;
      }
      
      protected function compress() : void
      {
         if(!var_171)
         {
            if(false)
            {
               var_21.position = 0;
               var_575 = var_21.length;
               if(var_1035)
               {
                  var_21.compress.apply(var_21,["deflate"]);
                  var_172 = var_21.length;
               }
               else
               {
                  var_21.compress();
                  var_172 = -6;
               }
               var_21.position = 0;
               var_171 = true;
            }
            else
            {
               var_172 = 0;
               var_575 = 0;
            }
         }
      }
      
      private function parseFileHeadExt(param1:IDataInput) : Boolean
      {
         if(param1.bytesAvailable >= var_1036 + var_1262)
         {
            parseHeadExt(param1);
            parseFunc = parseFileContent;
            return true;
         }
         return false;
      }
      
      protected function parseHeadExt(param1:IDataInput) : void
      {
         var _loc3_:* = 0;
         var _loc4_:* = 0;
         var _loc5_:* = null;
         if(var_353 == "utf-8")
         {
            var_404 = param1.readUTFBytes(var_1036);
         }
         else
         {
            var_404 = param1.readMultiByte(var_1036,var_353);
         }
         var _loc2_:uint = var_1262;
         while(_loc2_ > 4)
         {
            _loc3_ = uint(param1.readUnsignedShort());
            _loc4_ = uint(param1.readUnsignedShort());
            if(_loc4_ > _loc2_)
            {
               throw new Error("Parse error in file " + var_404 + ": Extra field data size too big.");
            }
            if(_loc3_ === 56026 && _loc4_ === 4)
            {
               var_849 = param1.readUnsignedInt();
               var_492 = true;
            }
            else if(_loc4_ > 0)
            {
               _loc5_ = new ByteArray();
               param1.readBytes(_loc5_,0,_loc4_);
               _extraFields[_loc3_] = _loc5_;
            }
            _loc2_ -= _loc4_ + 4;
         }
         if(_loc2_ > 0)
         {
            param1.readBytes(new ByteArray(),0,_loc2_);
         }
      }
      
      protected function parseHead(param1:IDataInput) : void
      {
         var _loc2_:uint = param1.readUnsignedShort();
         var_1261 = _loc2_ >> 8;
         var_1511 = Math.floor((_loc2_ & 255) / 10) + "." + (_loc2_ & 255) % 10;
         var _loc3_:uint = param1.readUnsignedShort();
         var_700 = param1.readUnsignedShort();
         var_1512 = (_loc3_ & 1) !== 0;
         var_1510 = (_loc3_ & 8) !== 0;
         var_2022 = (_loc3_ & 32) !== 0;
         if((_loc3_ & 800) !== 0)
         {
            var_353 = "utf-8";
         }
         if(var_700 === const_1198)
         {
            var_2313 = (_loc3_ & 2) !== 0 ? 8192 : 4096;
            var_2314 = (_loc3_ & 4) !== 0 ? 3 : 2;
         }
         else if(var_700 === const_540)
         {
            var_2023 = (_loc3_ & 6) >> 1;
         }
         var _loc4_:uint = param1.readUnsignedShort();
         var _loc5_:uint = param1.readUnsignedShort();
         var _loc6_:* = _loc4_ & 31;
         var _loc7_:* = (_loc4_ & 2016) >> 5;
         var _loc8_:* = (_loc4_ & 63488) >> 11;
         var _loc9_:* = _loc5_ & 31;
         var _loc10_:* = (_loc5_ & 480) >> 5;
         var _loc11_:int = ((_loc5_ & 65024) >> 9) + 1980;
         var_698 = new Date(_loc11_,_loc10_ - 1,_loc9_,_loc8_,_loc7_,_loc6_,0);
         var_699 = param1.readUnsignedInt();
         var_172 = param1.readUnsignedInt();
         var_575 = param1.readUnsignedInt();
         var_1036 = param1.readUnsignedShort();
         var_1262 = param1.readUnsignedShort();
      }
      
      public function set content(param1:ByteArray) : void
      {
         if(param1 != null && param1.length > 0)
         {
            param1.position = 0;
            param1.readBytes(var_21,0,param1.length);
            var_699 = ChecksumUtil.CRC32(var_21);
            var_492 = false;
         }
         else
         {
            var_21.length = 0;
            var_21.position = 0;
            var_171 = false;
         }
         compress();
      }
      
      public function toString() : String
      {
         return "[FZipFile]\n  name:" + var_404 + "\n  date:" + var_698 + "\n  sizeCompressed:" + var_172 + "\n  sizeUncompressed:" + var_575 + "\n  versionHost:" + var_1261 + "\n  versionNumber:" + var_1511 + "\n  compressionMethod:" + var_700 + "\n  encrypted:" + var_1512 + "\n  hasDataDescriptor:" + var_1510 + "\n  hasCompressedPatchedData:" + var_2022 + "\n  filenameEncoding:" + var_353 + "\n  crc32:" + var_699.toString(16) + "\n  adler32:" + var_849.toString(16);
      }
      
      public function get content() : ByteArray
      {
         if(var_171)
         {
            uncompress();
         }
         return var_21;
      }
   }
}
