import 'dart:convert';

class Response {
  bool Success;
  
  Response.fromJSON(var o){
    Map parsedMap = JSON.decode(o);
    Success = parsedMap["Success"];
  }
  
  bool getSuccess(){
    return Success;
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

class HostStatusResponse extends Response {
  
//      TotalStorage     int
//      MinFilesize      int
//      MaxFilesize      int
//      MinDuration      int
//      MaxDuration      int
//      WindowSize       int
//      Price            int
//      Collateral       int
//      StorageRemaining int
//      NumContracts     int
  
}

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
  
  RenterDownloadQueueResponse.fromJSON(var o) : super.fromJSON(o) {
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





