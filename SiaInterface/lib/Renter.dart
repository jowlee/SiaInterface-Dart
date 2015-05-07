library SiaInterface.Renter;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Response.dart';

class RenterDownloadQueueitem extends Response{
  bool Complete;
  var Filesize;
  var Received;
  String Destination;
  String Nickname;
  RenterDownloadQueueitem(String jsonFormat, this.Complete, this.Filesize, this.Received, this.Destination, this.Nickname) : super(jsonFormat);
  RenterDownloadQueueitem copy() => new RenterDownloadQueueitem(jsonFormat, Complete, Filesize, Received, Destination, Nickname);

  void updateParse(Map json){
    Complete = json["Complete"];
    Filesize = json["Filesize"];
    Received = json["Received"];
    Destination = json["Destination"];
    Nickname = json["Nickname"];
  }
}

class RenterDownloadQueue extends Response{
  List<RenterDownloadQueueitem> DownloadQueue;
  RenterDownloadQueue(String jsonFormat, this.DownloadQueue) : super(jsonFormat);
  RenterDownloadQueue copy() => new RenterDownloadQueue(jsonFormat, DownloadQueue);

  void updateParse(List json){
    for(int i=0; i<json.length; i++){
      if(i < (DownloadQueue.length)){
        RenterDownloadQueueitem temp = new RenterDownloadQueueitem(json[i], json[i]["Complete"], json[i]["Filesize"], json[i]["Received"], json[i]["Destination"], json[i]["Nickname"]);
        DownloadQueue.add(temp);
      }
      else{
        DownloadQueue[i].updateParse(json[i]);
      }
    }
  }
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

class RenterFilesDownload extends Response{
  bool Success;
  RenterFilesDownload(String jsonFormat, this.Success) : super(jsonFormat);
  RenterFilesDownload copy() => new RenterFilesDownload(jsonFormat, Success);
    
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

class RenterFilesItem extends Response {
  bool Available;
  String Nickname;
  bool Repairing;
  int TimeRemaining;
  
  RenterFilesItem(String jsonFormat, this.Available, this.Nickname, this.Repairing, this.TimeRemaining) : super(jsonFormat){
    print("Nickname is "+ Nickname);
  }
  RenterFilesItem copy() => new RenterFilesItem(jsonFormat, Available, Nickname, Repairing, TimeRemaining);  

  void updateParse(Map json){
    Available = json["Available"];
    Nickname = json["Nickname"];
    Repairing = json["Repairing"];
    TimeRemaining = json["TimeRemaining"];
  }
}


class RenterFiles extends Response {
  List<RenterFilesItem> FilesList;
  
  RenterFiles(String jsonFormat, this.FilesList) : super(jsonFormat);
  RenterFiles copy() => new RenterFiles(jsonFormat, FilesList);
  
  void updateParse(List json){
    FilesList.clear();
    for(int i=0; i<json.length; i++){
        RenterFilesItem temp = new RenterFilesItem(JSON.encode(json[i]), json[i]["Available"], json[i]["Nickname"], json[i]["Repairing"], json[i]["TimeRemaining"]);
        FilesList.add(temp);
    }
  }
}

class RenterFilesLoad extends Response {
  List<String> FilesAdded;
  RenterFilesLoad(String jsonFormat, this.FilesAdded) : super(jsonFormat);
  RenterFilesLoad copy() => new RenterFilesLoad(jsonFormat, FilesAdded);
  
  static void load(String filename, Function onFinish) {
        var url = "http://localhost:9980/renter/upload";
        url += '?filename=${filename}';    // Addition of Parameters
        http.get(url).then((response) {
          print("Response status: ${response.statusCode}");
          print("Response body: ${response.body}"); 
          Map parsedMap = JSON.decode(response.body);
          onFinish(parsedMap["FilesAdded"]);
        });
  }
}

class RenterFilesLoadAscii extends Response {
  List<String> file;
  RenterFilesLoadAscii(String jsonFormat, this.file) : super(jsonFormat);
  RenterFilesLoadAscii copy() => new RenterFilesLoadAscii(jsonFormat, file);
  
  static void loadAscii(String file, Function onFinish) {
        var url = "http://localhost:9980/renter/upload";
        url += '?file=${file}';    // Addition of Parameters
        http.get(url).then((response) {
          print("Response status: ${response.statusCode}");
          print("Response body: ${response.body}"); 
          Map parsedMap = JSON.decode(response.body);
          onFinish(parsedMap["file"]);
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
          onFinish(parsedMap["File"]);
        });
  }
}

class RenterFilesUpload extends Response{
  bool Success;
  RenterFilesUpload(String jsonFormat, this.Success) : super(jsonFormat);
  RenterFilesUpload copy() => new RenterFilesUpload(jsonFormat, Success);
  
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
  