library Renter;
import 'package:http/http.dart' as http;

class Renter {

   /*
   * nickname:     file that has been uploaded to the network.
   * destination:  the path that the file will be downloaded to.
   */

  download(String nickname, String destination) {
    var url = "http://localhost:9980/renter/download";
    http.post(url, body: 'name=doodle&color=blue').then((response) {
       print("Response status: ${response.statusCode}");
       print("Response body: ${response.body}");
     });

  }
  
  downloadqueue() {

    var url = "http://localhost:9980/renter/downloadqueue";

    http.get(url).then((response){
      print("Response status: ${response.statusCode}");
          print("Response body: ${response.body}");
    });

  }
  
  files() {
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
  upload(String source, String nickname) {

    var url = "http://localhost:9980/renter/files";

    http.post(url, body: 'name=doodle&color=blue').then((response) {
       print("Response status: ${response.statusCode}");
       print("Response body: ${response.body}");
     });
  }
  

}