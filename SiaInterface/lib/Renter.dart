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

class RenterFilesDelete extends Response {
  bool Success;
  RenterFilesDelete(String jsonFormat, this.Success) : super(jsonFormat);
  RenterFilesDelete copy() => new RenterFilesDelete(jsonFormat, Success);
  
  static void delete(String nickname, Function onFinish) {
        var url = "http://localhost:9980/renter/upload";
        url += '?nickname=${nickname}';    // Addition of Parameters
        http.get(url).then((response) {
          print("Response status: ${response.statusCode}");
          print("Response body: ${response.body}"); 
          Map parsedMap = JSON.decode(response.body);
          onFinish(parsedMap["Success"]);
        });
  }
}

/*class RenterFilesList extends Response {
  bool Available;
  String Nickname;
  bool Repairing;
  int TimeRemaining;
  
  bool Success;
  RenterFilesList(String jsonFormat, this.Success) : super(jsonFormat);
  RenterFilesList copy() => new RenterFilesList(jsonFormat, Success);
  
  static void list() {
        var url = "http://localhost:9980/renter/upload";
        url += '?nickname=${nickname}';    // Addition of Parameters
        http.get(url).then((response) {
          print("Response status: ${response.statusCode}");
          print("Response body: ${response.body}"); 
          Map parsedMap = JSON.decode(response.body);
          onFinish(parsedMap["Success"]);
        });
  }
}*/

class RenterFilesLoad extends Response {
  bool Success;
  RenterFilesLoad(String jsonFormat, this.Success) : super(jsonFormat);
  RenterFilesLoad copy() => new RenterFilesLoad(jsonFormat, Success);
  
  static void load(String filename, Function onFinish) {
        var url = "http://localhost:9980/renter/upload";
        url += '?filename=${filename}';    // Addition of Parameters
        http.get(url).then((response) {
          print("Response status: ${response.statusCode}");
          print("Response body: ${response.body}"); 
          Map parsedMap = JSON.decode(response.body);
          onFinish(parsedMap["Success"]);
        });
  }
}

class RenterFilesLoadAscii extends Response {
  bool Success;
  RenterFilesLoadAscii(String jsonFormat, this.Success) : super(jsonFormat);
  RenterFilesLoadAscii copy() => new RenterFilesLoadAscii(jsonFormat, Success);
  
  static void loadAscii(String file, Function onFinish) {
        var url = "http://localhost:9980/renter/upload";
        url += '?file=${file}';    // Addition of Parameters
        http.get(url).then((response) {
          print("Response status: ${response.statusCode}");
          print("Response body: ${response.body}"); 
          Map parsedMap = JSON.decode(response.body);
          onFinish(parsedMap["Success"]);
        });
  }
}

class RenterFilesRename extends Response {
  bool Success;
  RenterFilesRename(String jsonFormat, this.Success) : super(jsonFormat);
  RenterFilesRename copy() => new RenterFilesRename(jsonFormat, Success);
  
  static void rename(String nickname, String newname, Function onFinish) {
        var url = "http://localhost:9980/renter/upload";
        url += '?nickname=${nickname}&newname=${newname}';    // Addition of Parameters
        http.get(url).then((response) {
          print("Response status: ${response.statusCode}");
          print("Response body: ${response.body}"); 
          Map parsedMap = JSON.decode(response.body);
          onFinish(parsedMap["Success"]);
        });
  }
}

class RenterFilesShare extends Response {
  bool Success;
  RenterFilesShare(String jsonFormat, this.Success) : super(jsonFormat);
  RenterFilesShare copy() => new RenterFilesShare(jsonFormat, Success);
  
  static void share(String nickname, String filepath, Function onFinish) {
        var url = "http://localhost:9980/renter/upload";
        url += '?nickname=${nickname}&filepath=${filepath}';    // Addition of Parameters
        http.get(url).then((response) {
          print("Response status: ${response.statusCode}");
          print("Response body: ${response.body}"); 
          Map parsedMap = JSON.decode(response.body);
          onFinish(parsedMap["Success"]);
        });
  }
}

class RenterFilesShareAscii extends Response {
  bool Success;
  RenterFilesShareAscii(String jsonFormat, this.Success) : super(jsonFormat);
  RenterFilesShareAscii copy() => new RenterFilesShareAscii(jsonFormat, Success);
  
  static void shareAscii(String nickname, Function onFinish) {
        var url = "http://localhost:9980/renter/upload";
        url += '?nickname=${nickname}';    // Addition of Parameters
        http.get(url).then((response) {
          print("Response status: ${response.statusCode}");
          print("Response body: ${response.body}"); 
          Map parsedMap = JSON.decode(response.body);
          onFinish(parsedMap["Success"]);
        });
  }
}