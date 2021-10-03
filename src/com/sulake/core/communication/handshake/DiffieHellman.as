package com.sulake.core.communication.handshake
{
   import com.hurlant.math.BigInteger;
   import com.sulake.core.utils.ErrorReportStorage;
   
   public class DiffieHellman implements IKeyExchange
   {
       
      
      private var var_1150:BigInteger;
      
      private var var_701:BigInteger;
      
      private var var_1403:BigInteger;
      
      private var var_1402:BigInteger;
      
      private var var_1718:BigInteger;
      
      private var var_1719:BigInteger;
      
      public function DiffieHellman(param1:BigInteger, param2:BigInteger)
      {
         super();
         var_1150 = param1;
         var_1403 = param2;
      }
      
      public function getSharedKey(param1:uint = 16) : String
      {
         return var_1718.toRadix(param1);
      }
      
      public function generateSharedKey(param1:String, param2:uint = 16) : String
      {
         var_1402 = new BigInteger();
         var_1402.fromRadix(param1,param2);
         var_1718 = var_1402.modPow(var_701,var_1150);
         return getSharedKey(param2);
      }
      
      public function getPublicKey(param1:uint = 16) : String
      {
         return var_1719.toRadix(param1);
      }
      
      public function init(param1:String, param2:uint = 16) : Boolean
      {
         ErrorReportStorage.addDebugData("DiffieHellman","Prime: " + var_1150.toString() + ",generator: " + var_1403.toString() + ",secret: " + param1);
         var_701 = new BigInteger();
         var_701.fromRadix(param1,param2);
         var_1719 = var_1403.modPow(var_701,var_1150);
         return true;
      }
   }
}
