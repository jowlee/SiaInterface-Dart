library SiaInterface.Host;
import 'Response.dart';

class HostAnnounceResponse extends Response {
  HostAnnounceResponse(var o) : super(o);
}
class HostConfigResponse extends Response {
  HostConfigResponse(var o)   : super(o);
}
class HostStatusResponse extends Response {
  HostStatusResponse(var o) : super(o);
  
  int getTotalStorage(){    return parsedMap["TotalStorage"];}
  int getMinFilesize(){     return parsedMap["MinFilesize"];}
  int getMaxFilesize(){     return parsedMap["MaxFilesize"];}
  int getMinDuration(){     return parsedMap["MinDuration"];}
  int getMaxDuration(){     return parsedMap["MaxDuration"];}
  int getWindowSize(){      return parsedMap["WindowSize"];}
  int getPrice(){           return parsedMap["Price"];}
  int getCollateral(){      return parsedMap["Collateral"];}
  int getStorageRemaining(){return parsedMap["StorageRemaining"];}
  int getNumContracts(){    return parsedMap["NumContracts"];}
}
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