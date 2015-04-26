library Renter;
import 'package:http/http.dart' as http;
import 'dart:convert';

class RenterDownload {
  bool Success;
  
  static void download(String nickname, String destination, Function onFinish) {
      var url = "http://localhost:9980/renter/download";
      url += '?nickname=${nickname}&destination=${destination}';    // Addition of Parameters
      http.get(url).then((response) {
        print("Response status: ${response.statusCode}");
        print("Response body: ${response.body}"); 
        Map parsedMap = JSON.decode(response.body);
        onFinish(parsedMap["Success"]);
       });
    }
}

class RenterDownloadQueue{
  bool Complete;
  var Filesize;
  var Received;
  String Destination;
  String Nickname;
  RenterDownloadQueue(this.Complete, this.Filesize, this.Received, this.Destination, this.Nickname);
  RenterDownloadQueue copy() => new RenterDownloadQueue(Complete, Filesize, Received, Destination, Nickname);
}


class RenterUpload{
  
  static void upload(String source, String nickname, Function onFinish) {
      var url = "http://localhost:9980/renter/upload";
      url += '?source=${source}&nickname=${nickname}';    // Addition of Parameters
      http.get(url).then((response) {
        print("Response status: ${response.statusCode}");
        print("Response body: ${response.body}"); 
        Map parsedMap = JSON.decode(response.body);
        onFinish(parsedMap["Success"]);
       });
    }
}
  
class RenterFiles {
  bool Available;
  String Nickname;
  bool Repairing;
  int TimeRemaining;
  
  RenterFiles(this.Available, this.Nickname, this.Repairing, this.TimeRemaining);
  RenterFiles copy() => new RenterFiles(Available, Nickname, Repairing, TimeRemaining);
  
}







