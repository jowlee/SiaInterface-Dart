library SiaInterface.Gateway;
import 'package:http/http.dart' as http;
import "dart:convert";
import 'Abstract.dart';

class GatewayStatus extends Abstract{
//  NetAddress Address;
  String Address;
  List<String> peers;
  GatewayStatus(Map jsonFormat, this.Address, this.peers) : super(jsonFormat);
  GatewayStatus copy() => new GatewayStatus(jsonFormat, this.Address, this.peers);
}
class GatewaySynchronize extends Abstract {
  bool Success;
  GatewaySynchronize(Map jsonFormat, this.Success) : super(jsonFormat);
  GatewaySynchronize copy() => new GatewaySynchronize(jsonFormat, this.Success);
}
class GatewayPeer extends Abstract {
  bool Success;
  GatewayPeer(Map jsonFormat, this.Success) : super(jsonFormat);
  GatewayPeer copy() => new GatewayPeer(jsonFormat, this.Success);
  
  static void add(String address, Function onFinish) {
    var url = "http://localhost:9980/host/config";
          url += '?address=$address';    // Addition of Parameters
          http.get(url).then((response) {
            print("Response status: ${response.statusCode}");
            print("Response body: ${response.body}"); 
            Map parsedMap = JSON.decode(response.body);
            onFinish(parsedMap["success"]);
           });
  }
  static void remove(String address, Function onFinish) {
    var url = "http://localhost:9980/host/config";
          url += '?address=$address';    // Addition of Parameters
          http.get(url).then((response) {
            print("Response status: ${response.statusCode}");
            print("Response body: ${response.body}"); 
            Map parsedMap = JSON.decode(response.body);
            onFinish(parsedMap["success"]);
           });
  }

}