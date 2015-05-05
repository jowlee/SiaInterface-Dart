library SiaInterface.Wallet;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Response.dart';

class WalletAddress extends Response {
  String Address;
  WalletAddress(String jsonFormat, this.Address) :super(jsonFormat);
  WalletAddress copy() => new WalletAddress(jsonFormat, Address);
}

class WalletSend extends Response {
  String Address;
  WalletSend(String jsonFormat, this.Address) :super(jsonFormat);
  WalletSend copy() => new WalletSend(jsonFormat, Address);
  
  static void send(int Amount, String Destination, Function onFinish) {
      var url = "http://localhost:9980/wallet/send";
      url += '?Amount=${Amount}&Destination=${Destination}';    // Addition of Parameters
      http.get(url).then((response) {
        print("Response status: ${response.statusCode}");
        print("Response body: ${response.body}"); 
        Map parsedMap = JSON.decode(response.body);
        onFinish(parsedMap["Success"]);
       });
    }
}


class WalletStatus extends Response {
  int Balance;
  int FullBalance;
  int NumAddress;

  WalletStatus(String jsonFormat, this.Balance, this.FullBalance, this.NumAddress) :super(jsonFormat);
  WalletStatus copy() => new WalletStatus(jsonFormat, Balance, FullBalance, NumAddress);

}
  




