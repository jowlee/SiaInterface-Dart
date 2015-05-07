library SiaInterface.Consensus;
import 'Response.dart';


class ConsensusStatus extends Response{
  int Height;
  String CurrentBlock;    //CurrentBlock [32]byte
  String Target;          //Target       [32]byte
  
  ConsensusStatus(String jsonFormat, this.Height, this.CurrentBlock, this.Target) : super(jsonFormat);
  ConsensusStatus copy() => new ConsensusStatus(jsonFormat, this.Height, this.CurrentBlock, this.Target); 
}

class ConsensusSynchronize extends Response{

  ConsensusSynchronize(String jsonFormat) : super(jsonFormat);
  ConsensusSynchronize copy() => new ConsensusSynchronize(jsonFormat); 
  
}
