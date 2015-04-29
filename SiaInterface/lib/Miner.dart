library SiaInterface.Miner;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Abstract.dart';

class MinerStart extends Abstract {
  bool Success;
  MinerStart(Map jsonFormat, this.Success) : super(jsonFormat);
  MinerStart copy() => new MinerStart(jsonFormat, Success);
  
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

class MinerStatus extends Abstract{
  
  bool Mining;
  String State;
  int Threads;
  int RunningThreads;
  // [32]byte  Address

  MinerStatus(Map jsonFormat, this.Mining, this.State, this.Threads, this.RunningThreads ) : super(jsonFormat);
  MinerStatus copy() => new MinerStatus(jsonFormat, Mining, State, Threads, RunningThreads);
}

class MinerStop extends Abstract{
  bool Success;
  MinerStop(Map jsonFormat, this.Success) : super(jsonFormat);
  MinerStop copy() => new MinerStop(jsonFormat, Success);
  
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




