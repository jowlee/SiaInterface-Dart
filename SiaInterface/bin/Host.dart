library Host;
import 'package:http/http.dart' as http;

class Host {

   /*
   * nickname:     file that has been uploaded to the network.
   * destination:  the path that the file will be downloaded to.
   */

  static announce() {
    var url = "http://localhost:9980/host/announce";
    http.post(url).then((response) {
       print("Response status: ${response.statusCode}");
       print("Response body: ${response.body}");
     });

  }
  
  static config(int totalStorage, int minFilesize, int maxFilesize, int minDuration, int maxDuration, int windowSize, int price, int collateral) {
    var url = "http://localhost:9980/host/config";
    http.post(url, body: 'totalStorage=$totalStorage&minFilesize=$minFilesize&maxFilesize=$maxFilesize&minDuration=$minDuration&maxDuration=$maxDuration&windowSize=$windowSize&price=$price&collateral=$collateral')
    .then((response) {
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
     });

  }
  
  static status() {
    var url = "http://localhost:9980/host/status";
    http.post(url).then((response){
      print("Response status: ${response.statusCode}");
          print("Response body: ${response.body}");
    });
  }
}