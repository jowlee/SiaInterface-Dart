library SiaInterface.Consensus;
import 'Response.dart';
import 'package:http/http.dart' as http;


class ConsensusStatus extends Response{
  int Height;
  String CurrentBlock;    //CurrentBlock [32]byte
  String Target;          //Target       [32]byte
  
  ConsensusStatus(String jsonFormat, this.Height, this.CurrentBlock, this.Target) : super(jsonFormat);
  ConsensusStatus copy() => new ConsensusStatus(jsonFormat, this.Height, this.CurrentBlock, this.Target); 

  void parseUpdate(Map json){
    this.Height = json["Height"];
  }
  
}

class ConsensusSynchronize extends Response{

  ConsensusSynchronize(String jsonFormat) : super(jsonFormat);
  ConsensusSynchronize copy() => new ConsensusSynchronize(jsonFormat); 
  
  static void synchronize(Function onFinish) {
        var url = "http://localhost:9980/renter/upload";
        http.get(url).then((response) {
//          print("Response status: ${response.statusCode}");
//          print("Response body: ${response.body}"); 
          onFinish(response.body);
        });
  }
  
}
