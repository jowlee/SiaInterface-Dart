library Host;
import 'package:http/http.dart' as http;
//import 'package:http/httprequest.dart';
import 'dart:convert';

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

  static status() {
    var url = "http://localhost:9980/host/status";
    http.get(url).then((response){
      print("Response status: ${response.statusCode}");
      List<String> repos = JSON.decode(response.body);
      print("TotalStorage ${repos['TotalStorage']}");
      print("MinFilesize ${repos['MinFilesize']}");
      print("MaxFilesize ${repos['MaxFilesize']}");
      print("MinDuration ${repos['MinDuration']}");
      print("MaxDuration ${repos['MaxDuration']}");
      print("WindowSize ${repos['WindowSize']}");
      print("Price ${repos['Price']}");
      print("Collateral ${repos['Collateral']}");
      print("StorageRemaining ${repos['StorageRemaining']}");
      print("NumContracts ${repos['NumContracts']}");

      //          print("Response body: ${response.body}");
    });
  }
}
void parse(String response) {
  print("here");
  JSON.decode(response);
  List r = JSON.decode(response);
  print(r.length);
}