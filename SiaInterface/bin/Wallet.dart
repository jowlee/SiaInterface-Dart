library Wallet;
import 'package:http/http.dart' as http;
import 'dart:convert';

class WalletAddress {
  String Address;
  WalletAddress(this.Address);
  WalletAddress copy() => new WalletAddress(Address);
}

class WalletSend{

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


class WalletStatus{
  int Balance;
  int FullBalance;
  int NumAddress;

  WalletStatus(this.Balance, this.FullBalance, this.NumAddress);
  WalletStatus copy() => new WalletStatus(Balance, FullBalance, NumAddress);

}
  




