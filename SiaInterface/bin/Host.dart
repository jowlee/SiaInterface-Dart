library Host;
import 'package:http/http.dart' as http;
//import 'package:http/httprequest.dart';
import 'dart:convert';
import 'Response.dart';

class Host {

   /*
   * nickname:     file that has been uploaded to the network.
   * destination:  the path that the file will be downloaded to.
   */

  static announce() {
    var url = "http://localhost:9980/host/announce";
    
    http.get(url).then((response) {
       print("Response status: ${response.statusCode}");
       print("Response body: ${response.body}");
     });

  }
  
  static config(int totalStorage, int minFilesize, int maxFilesize, int minDuration, int maxDuration, int windowSize, int price, int collateral) {
    //once SiaSim is updated, pass params as body: map
    var url = "http://localhost:9980/host/config";
    url += '?totalStorage=$totalStorage&minFilesize=$minFilesize&maxFilesize=$maxFilesize&minDuration=$minDuration&maxDuration=$maxDuration&windowSize=$windowSize&price=$price&collateral=$collateral';
    http.get(url).then((response) {
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
     });

  }

  static HostStatusResponse status() {
    var url = "http://localhost:9980/host/status";
    var res;
    http.get(url).then((response){
      res = new HostStatusResponse.fromJSON(response.body);         // Standard Response Constructor

//      print("Response status: ${response.statusCode}");
//      List<String> repos = JSON.decode(response.body);
      print("TotalStorage : ${res.getTotalStorage()}");
      print("MinFilesize : ${res.getMinFilesize()}");
      print("MaxFilesize : ${res.getMaxFilesize()}");
      print("MinDuration ${res.getMinDuration()}");
      print("MaxDuration ${res.getMaxDuration()}");
      print("WindowSize ${res.getWindowSize()}");
      print("Price ${res.getPrice()}");
      print("Collateral ${res.getCollateral()}");
      print("StorageRemaining ${res.getStorageRemaining()}");
      print("NumContracts ${res.getNumContracts()}");

      //          print("Response body: ${response.body}");
    });
    return res;
  }
}
void parse(String response) {
  print("here");
  JSON.decode(response);
  List r = JSON.decode(response);
  print(r.length);
}