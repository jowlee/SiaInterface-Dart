library Consensus;


class ConsensusStatus{
  int Height;
  //CurrentBlock [32]byte
  //Target       [32]byte
  ConsensusStatus(this.Height);
  ConsensusStatus copy() => new ConsensusStatus(Height);
}
