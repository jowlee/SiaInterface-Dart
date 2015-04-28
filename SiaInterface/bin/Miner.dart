library SiaInterface.Miner;
import 'package:http/http.dart' as http;
import 'dart:convert';

class MinerStart {
  bool Success;
  MinerStart(this.Success);
  MinerStart copy() => new MinerStart(Success);
  
  static void start(Function onFinish) {
      var url = "http://localhost:9980/miner/start";
      http.get(url).then((response) {
        print("Response status: ${response.statusCode}");
        print("Response body: ${response.body}"); 
        Map parsedMap = JSON.decode(response.body);
        onFinish(parsedMap["Success"]);
       });
    }
}

class MinerStatus{
  
  bool Mining;
  String State;
  int Threads;
  int RunningThreads;
  // [32]byte  Address

  MinerStatus(this.Mining, this.State, this.Threads, this.RunningThreads );
  MinerStatus copy() => new MinerStatus(Mining, State, Threads, RunningThreads);
}

class MinerStop{
  bool Success;
  MinerStop(this.Success);
  MinerStop copy() => new MinerStop(Success);
  
  static void stop(Function onFinish) {
      var url = "http://localhost:9980/miner/stop";
      http.get(url).then((response) {
        print("Response status: ${response.statusCode}");
        print("Response body: ${response.body}"); 
        Map parsedMap = JSON.decode(response.body);
        onFinish(parsedMap["Success"]);
       });
    }
}




