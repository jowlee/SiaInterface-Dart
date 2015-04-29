library SiaInterface.Renter;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Abstract.dart';

class RenterDownload extends Abstract{
  bool Success;
  RenterDownload(Map jsonFormat, this.Success) : super(jsonFormat);
  RenterDownload copy() => new RenterDownload(jsonFormat, Success);
    
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

class RenterDownloadQueue extends Abstract{
  bool Complete;
  var Filesize;
  var Received;
  String Destination;
  String Nickname;
  RenterDownloadQueue(Map jsonFormat, this.Complete, this.Filesize, this.Received, this.Destination, this.Nickname) : super(jsonFormat);
  RenterDownloadQueue copy() => new RenterDownloadQueue(jsonFormat, Complete, Filesize, Received, Destination, Nickname);
}


class RenterUpload extends Abstract{
  bool Success;
  RenterUpload(Map jsonFormat, this.Success) : super(jsonFormat);
  RenterUpload copy() => new RenterUpload(jsonFormat, Success);
  
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
  
class RenterFiles extends Abstract {
  bool Available;
  String Nickname;
  bool Repairing;
  int TimeRemaining;
  
  RenterFiles(Map jsonFormat, this.Available, this.Nickname, this.Repairing, this.TimeRemaining) : super(jsonFormat);
  RenterFiles copy() => new RenterFiles(jsonFormat, Available, Nickname, Repairing, TimeRemaining);
  
}







