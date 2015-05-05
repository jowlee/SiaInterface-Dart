library SiaInterface.Miner;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Response.dart';

class MinerStart extends Response {
  bool Success;
  MinerStart(String jsonFormat, this.Success) : super(jsonFormat);
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

class MinerStatus extends Response{
  
  bool Mining;
  String State;
  int Threads;
  int RunningThreads;
  String Address;     // [32]byte  Address

  MinerStatus(String jsonFormat, this.Mining, this.State, this.Threads, this.RunningThreads, this.Address ) : super(jsonFormat);
  MinerStatus copy() => new MinerStatus(jsonFormat, Mining, State, Threads, RunningThreads, Address);
}

class MinerStop extends Response{
  bool Success;
  MinerStop(String jsonFormat, this.Success) : super(jsonFormat);
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




