library SiaInterface.Daemon;
import 'package:http/http.dart' as http;
import 'dart:convert';

class DaemonStop {
  static void stop(Function onFinish) {
      var url = "http://localhost:9980/daemon/stop";
      http.get(url).then((response) {
        print("Response status: ${response.statusCode}");
        print("Response body: ${response.body}"); 
        Map parsedMap = JSON.decode(response.body);
        onFinish(parsedMap["Success"]);
       });
    }
}

class DaemonUpdateApply{
  
  static void updateApply(Function onFinish) {
      var url = "http://localhost:9980/daemon/update/apply";
      http.get(url).then((response) {
        print("Response status: ${response.statusCode}");
        print("Response body: ${response.body}"); 
        Map parsedMap = JSON.decode(response.body);
        onFinish(parsedMap["Success"]);
       });
    }
}

class DaemonUpdateCheck{
  bool Available;
  String Version;

  DaemonUpdateCheck(this.Available, this.Version);
  DaemonUpdateCheck copy() => new DaemonUpdateCheck(Available, Version);
}




