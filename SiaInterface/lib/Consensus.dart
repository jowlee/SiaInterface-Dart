library SiaInterface.Consensus;
import 'Response.dart';


class ConsensusStatus extends Response{
  int Height;
  String CurrentBlock;    //CurrentBlock [32]byte
  String Target;          //Target       [32]byte
  List<Function> onHostChangeStatus;
  
  ConsensusStatus(String jsonFormat, this.Height) : super(jsonFormat);
  ConsensusStatus copy() => new ConsensusStatus(jsonFormat, this.Height); 
  
}
