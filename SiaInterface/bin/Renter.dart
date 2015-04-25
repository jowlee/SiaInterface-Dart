library Renter;
import 'package:http/http.dart' as http;
import 'Response.dart';

class RenterDownload {
  bool Success;
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
  String Source;
  String Nickname;
}
  
class RenterFiles {
  bool Available;
  String Nickname;
  bool Repairing;
  int TimeRemaining;
}







