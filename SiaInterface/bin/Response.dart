import 'dart:convert';

class Response {
  bool Success;
  
  Response.fromJSON(var o){
    print("HERE");
    Map parsedMap = JSON.decode(o);
    print("HERE");
    Success = parsedMap["Success"];
    print("HERE");

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


class RenterDownloadQueueResponse extends Response {
  
//  Complete    bool
//  Filesize    uint64
//  Received    uint64
//  Destination string
//  Nickname    string
  
}

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





