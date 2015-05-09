// Copyright (c) 2015, <Joseph Lee>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:SiaInterface/SiaInterface.dart' as SiaInterface;

main(List<String> arguments) {
  SiaInterface.update();

  SiaInterface.getHostStatus();
  print("Consensus Status Height is " + SiaInterface.getConsensusStatus().Height.toString());
  print("Consensus Status Target is " + SiaInterface.getConsensusStatus().Target);

  print("Daemon Update Check, Version is " + SiaInterface.getDaemonUpdateCheck().Version);
  print("Gateway Status, Address is " + SiaInterface.getGatewayStatus().Address);

  print("HostStatus Status, Total Storage is " + SiaInterface.getHostStatus().TotalStorage.toString());
  print("Miner Status State is " + SiaInterface.getMinerStatus().State);
  
  print("Renter nickname: " + SiaInterface.getRenterFiles().FilesList.toString());

//  SiaInterface.daemonStop();
  SiaInterface.consensusSynchronize();
  SiaInterface.daemonUpdateApply();
  SiaInterface.gatewayPeerAdd("Some address String");
  SiaInterface.gatewayPeerRemove("Some address String");
  SiaInterface.hostAnnounce();
  SiaInterface.hostConfig("TotalStorage", "MinFilesize", "MaxFileSize", "MinDuration", "MaxDuration", "WindowSize", "Price", "Collateral");
  SiaInterface.minerStart();
  SiaInterface.minerStop();
  SiaInterface.renterFilesDownload("nickname", "destination");
  SiaInterface.renterFilesUpload("nickname", "destination");
  SiaInterface.renterFilesDelete("nickname");
  SiaInterface.walletSend( 123, "destination");

  
}
