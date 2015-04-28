library Host;
import 'package:http/http.dart' as http;
import "dart:convert";

class HostAnnounce {
  bool Success;
  HostAnnounce(this.Success);
  HostAnnounce copy() => new HostAnnounce(this.Success);
}
class HostConfig {
  bool Success;
  HostConfig(this.Success);
  HostConfig copy() => new HostConfig(Success);
  
  static void config(int TotalStorage, int MinFilesize, int MaxFileSize, int MinDuration, int MaxDuration, int WindowSize, int Price, int Collateral, Function onFinish) {
    var url = "http://localhost:9980/host/config";
          url += '?TotalStorage=$TotalStorage&MinFilesize=$MinFilesize&MaxFileSize=$MaxFileSize&MinDuration=$MinDuration&MaxDuration=$MaxDuration&WindowSize=$WindowSize&Price=$Price&Collateral=$Collateral';    // Addition of Parameters
          http.get(url).then((response) {
            print("Response status: ${response.statusCode}");
            print("Response body: ${response.body}"); 
            Map parsedMap = JSON.decode(response.body);
            onFinish(parsedMap["success"]);
           });
  }
}
class HostStatus {
  int TotalStorage;
  int MinFilesize;
  int MaxFileSize;
  int MinDuration;
  int MaxDuration;
  int WindowSize;
  int Price;
  int Collateral;
  int StorageRemaining;
  int NumContracts;
  
  HostStatus(this.TotalStorage, this.MinFilesize, this.MaxFileSize, this.MinDuration, this.MaxDuration, this.WindowSize, this.Price, this.Collateral, this.StorageRemaining, this.NumContracts);
  HostStatus copy() => new HostStatus(TotalStorage, MinFilesize, MaxFileSize, MinDuration, MaxDuration, WindowSize, Price, Collateral, StorageRemaining, NumContracts);
}
class HostDBHostsActive {
  //unclear type
//  List<HostEntry> Entries = null;
  HostDBHostsActive();
  HostDBHostsActive copy() => new HostDBHostsActive();

  
}