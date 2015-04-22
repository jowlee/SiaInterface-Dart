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
    url += '?nickname=$nickname&destination=$destination';
    http.get(url).then((response) {
      var res = new Response.fromJSON(response.body);
      if(res.getSuccess()){
        print("Response status: ${response.statusCode}");
        print("Response body: ${response.body}");        
      }
     });
    
    return true;
  }
  
  static downloadqueue() {
    var url = "http://localhost:9980/renter/downloadqueue";

    http.get(url).then((response){
//      Map data = JSON.decode(response.body);
//      print(data);
      prinhowt("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
    });

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
  
  void storeinfo(var body) {
//    print(jsonString.body);
    print("Hello");
    infoStorage temp = new infoStorage(body);
  }

}