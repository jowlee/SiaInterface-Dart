// Copyright (c) 2015, <Joseph Lee>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:SiaInterface/SiaInterface.dart' as SiaInterface;

main(List<String> arguments) {
  SiaInterface.update();
//  print("Renter nickname: " + SiaInterface.getRenterFiles().FilesList[0].Nickname);
  SiaInterface.getHostStatus();
  print("Consensus Status Height is " + SiaInterface.getConsensusStatus().Height.toString());
  print("Consensus Status Target is " + SiaInterface.getConsensusStatus().Target);

  print("Daemon Update CHeck Version is " + SiaInterface.getDaemonUpdateCheck().Version);

  SiaInterface.daemonStop();
}
