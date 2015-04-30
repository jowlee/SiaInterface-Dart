library SiaInterface.Renter;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Response.dart';

class RenterDownload extends Response{
  bool Success;
  RenterDownload(String jsonFormat, this.Success) : super(jsonFormat);
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

class RenterDownloadQueue extends Response{
  bool Complete;
  var Filesize;
  var Received;
  String Destination;
  String Nickname;
  RenterDownloadQueue(String jsonFormat, this.Complete, this.Filesize, this.Received, this.Destination, this.Nickname) : super(jsonFormat);
  RenterDownloadQueue copy() => new RenterDownloadQueue(jsonFormat, Complete, Filesize, Received, Destination, Nickname);
}


class RenterUpload extends Response{
  bool Success;
  RenterUpload(String jsonFormat, this.Success) : super(jsonFormat);
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
  
class RenterFiles extends Response {
  bool Available;
  String Nickname;
  bool Repairing;
  int TimeRemaining;
  
  RenterFiles(String jsonFormat, this.Available, this.Nickname, this.Repairing, this.TimeRemaining) : super(jsonFormat);
  RenterFiles copy() => new RenterFiles(jsonFormat, Available, Nickname, Repairing, TimeRemaining);
  
}







