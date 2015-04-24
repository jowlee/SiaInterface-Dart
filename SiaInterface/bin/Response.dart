import 'package:http/http.dart' as http;
import 'dart:convert';

class Response {
  bool Success;
  Map parsedMap;
  
  Response(var o) {
    parsedMap = JSON.decode(o);
    Success = parsedMap["Success"];
  }
  static Response getData(String url) {
    var res;
    http.get(url).then((response) {
//    print("Response status: ${response.statusCode}");
//    print("Response body: ${response.body}");
      res = new Response(response.body);
      print(res.getSuccess());
    });
    return res;
  }
  bool getSuccess(){
    return Success;
  }
  void printAll() {
    print( parsedMap);
  }
}

/*
class UpdateCheckResponse extends Response {
  bool Availible;
  String Version;
  
}

class ConsensusStatusResponse extends Response {
  int Height;
//  CurrentBlock [32]byte
//  Target       [32]byte  
}

class GatewayStatusResponse extends Response {
  
//  Address NetAddress
//  Peers   []string
}
*/

/*
class HostDBHostsActiveRespose extends Response {
  
//  Entries []HostEntry

  
}

class MinerStatusResponse extends Response {
  
//  Mining         bool
//  State          string
//  Threads        int
//  RunningThreads int
//  Address        [32]byte
  
}

*/
class RenterDownloadQueueResponse extends Response {
  
//  Complete    bool
//  Filesize    uint64
//  Received    uint64
//  Destination string
//  Nickname    string
  
  bool Complete;
  var Filesize;
  var Received;
  String Destination;
  String Nickname;
  
  RenterDownloadQueueResponse.fromJSON(var o) : super(o) {
    Map parsedMap = JSON.decode(o);
    Complete = parsedMap["Complete"];
    Filesize = parsedMap["Filesize"];
    Received = parsedMap["Received"];
    Destination = parsedMap["Destination"];
    Nickname = parsedMap["Nickname"];
  }
  
  bool getComplete(){
    return Complete;
  }
  String getDestination(){
    return Destination;
  }
  String getNickname(){
    return Nickname;
  }
}
/*
class RenterFilesResponse extends Response {
  
//  Available     bool
//  Nickname      string
//  Repairing     bool
//  TimeRemaining int
  
}


class TransactionpoolTransactionsResponse extends Response {
//  Transactions []consensus.Transaction
  
}

class WalletAdressResponse{
  String Address;
}

class WalletStatusResponse{
//  Balance      int
//  FullBalance  int
//  NumAddresses int
}

*/





