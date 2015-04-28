library SiaInterface.Gateway;
import 'package:http/http.dart' as http;
import "dart:convert";

class GatewayStatus {
//  NetAddress Address;
  String Address;
  List<String> peers;
  GatewayStatus(this.Address, this.peers);
  GatewayStatus copy() => new GatewayStatus(Address, peers);
}
class GatewaySynchronize {
  bool Success;
  GatewaySynchronize(this.Success);
  GatewaySynchronize copy() => new GatewaySynchronize(Success);
  
  static void synchronize(Function onFunction) {
    var url = "http://localhost:9980/gateway/synchronize";
//              url += '?address=$address';    // Addition of Parameters
              http.get(url).then((response) {
                print("Response status: ${response.statusCode}");
                print("Response body: ${response.body}"); 
                Map parsedMap = JSON.decode(response.body);
                onFinish(parsedMap["success"]);
               });
  }
}
class GatewayPeer {
  bool Success;
  GatewayPeer(this.Success);
  GatewayPeer copy() => new GatewayPeer(Success);
  
  static void add(String address, Function onFinish) {
    var url = "http://localhost:9980/gateway/add";
          url += '?address=$address';    // Addition of Parameters
          http.get(url).then((response) {
            print("Response status: ${response.statusCode}");
            print("Response body: ${response.body}"); 
            Map parsedMap = JSON.decode(response.body);
            onFinish(parsedMap["success"]);
           });
  }
  static void remove(String address, Function onFinish) {
    var url = "http://localhost:9980/gateway/remove";
          url += '?address=$address';    // Addition of Parameters
          http.get(url).then((response) {
            print("Response status: ${response.statusCode}");
            print("Response body: ${response.body}"); 
            Map parsedMap = JSON.decode(response.body);
            onFinish(parsedMap["success"]);
           });
  }

}