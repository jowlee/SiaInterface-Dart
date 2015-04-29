library SiaInterface.Consensus;
import 'Abstract.dart';


class ConsensusStatus extends Abstract{
  int Height;
  String CurrentBlock;    //CurrentBlock [32]byte
  String Target;          //Target       [32]byte
  List<Function> onHostChangeStatus;
  
  ConsensusStatus(Map jsonFormat, this.Height) : super(jsonFormat);
  ConsensusStatus copy() => new ConsensusStatus(jsonFormat, this.Height); 
  
}
