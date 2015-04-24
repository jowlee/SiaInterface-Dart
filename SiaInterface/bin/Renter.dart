library Renter;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Response.dart';


class Renter {
  
   /*
   * nickname:     file that has been uploaded to the network.
   * destination:  the path that the file will be downloaded to.
   */

  static bool download(String nickname, String destination) {
    var url = "http://localhost:9980/renter/download";
    url += '?nickname=$nickname&destination=$destination';    // Addition of Parameters
    var res;
    http.get(url).then((response) {
      res = new Response.fromJSON(response.body);         // Standard Response Constructor
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}"); 
     });
    return res.getSuccess(); 
  }
  
  static RenterDownloadQueueResponse downloadqueue() {
    var url = "http://localhost:9980/renter/downloadqueue";
    var res;

    http.get(url).then((response){
      res = new RenterDownloadQueueResponse.fromJSON(response.body);         // Standard Response Constructor

//      Map data = JSON.decode(response.body);
//      print(data);
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
    });
    return res; 

  }
  
  static files() { // return custom class
    var url = "http://localhost:9980/renter/files";

    http.get(url).then((response){
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
    });
  }
  /*
  * source:   the path to the file to be uploaded.
  * nickname: the name that will be used to reference the file.
  */
  static bool upload(String source, String nickname) {

    var url = "http://localhost:9980/renter/files";
    var mapData = new Map();
    mapData["source"] = source;
    mapData["nickname"] = nickname;

    String jsonData = JSON.encode(mapData); // convert map to String
    
    http.post(url,body: jsonData).then((response) {
            
//       print("Response status: ${response.statusCode}");
//       print("Response body: ${response.body}");
     });
    
    return true;
  }
  

}