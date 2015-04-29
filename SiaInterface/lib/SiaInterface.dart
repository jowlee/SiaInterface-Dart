// Copyright (c) 2015, <Joseph Lee>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
/// The SiaInterface library.
library SiaInterface;

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'Daemon.dart';
import 'Consensus.dart';
import 'Host.dart';
import 'Gateway.dart';
import 'Miner.dart';
import 'Renter.dart';
import 'TransactionPool.dart';
import 'Wallet.dart';

// Global Variables

Map temp = null;

DaemonStop latestDaemonStop = new DaemonStop(temp, true);
DaemonUpdateApply latestDaemonUpdateApply = new DaemonUpdateApply(temp, true);
DaemonUpdateCheck latestDaemonUpdateCheck = new DaemonUpdateCheck(temp, true, "0.0.1");
ConsensusStatus latestConsensusStatus = new ConsensusStatus(temp, 10);
GatewayStatus latestGatewayStatus = new GatewayStatus(temp, "address", new List<String>());
GatewaySynchronize latestGatewaySynchronize = new GatewaySynchronize(temp, true);
GatewayPeer latestGatewayPeer = new GatewayPeer(temp, true);
HostAnnounce latestHostAnnounce = new HostAnnounce(temp, true);
HostConfig latestHostConfig = new HostConfig(temp, true);
HostStatus latestHostStatus = new HostStatus(temp, 29, 0, 3006, 0, 49, 288, 3, 0, 0, 29);
HostDBHostsActive latestHostDBHostsActive = new HostDBHostsActive(temp, ["Entries"]);
MinerStart latestMinerStart = new MinerStart(temp, true);
MinerStatus latestMinerStatus = new MinerStatus(temp, true, "state", 10, 5, "Address");
MinerStop latestMinerStop = new MinerStop(temp, true);
RenterDownload latestRenterDownload = new RenterDownload(temp, true);
RenterDownloadQueue latestRenterDownloadQueue = new RenterDownloadQueue(temp, true, 10, 10, "dest", "nickname");
RenterUpload latestRenterUpload = new RenterUpload(temp, true);
RenterFiles latestRenterFiles = new RenterFiles(temp, true, "nickname", false, 0);
TransactionpoolTransactions latestTransactionpoolTransactions= new TransactionpoolTransactions(temp, "transaction");
WalletAddress latestWalletAddress = new WalletAddress(temp, "Address");
WalletSend latestWalletSend = new WalletSend(temp, "Address");
WalletStatus latestWalletStatus = new WalletStatus(temp, 10, 20, 123);

// Get Functions
DaemonUpdateCheck getDaemonUpdateCheck(){
return latestDaemonUpdateCheck.copy();
}
ConsensusStatus getConsensusStatus(){
return latestConsensusStatus.copy();
}
HostStatus getHostStatus() {
return latestHostStatus.copy();
}
MinerStatus getMinerStatus(){
return latestMinerStatus.copy();
}
RenterDownloadQueue getRenterDownloadQueue(){
return latestRenterDownloadQueue.copy();
}
RenterFiles getRenterFiles(){
return latestRenterFiles.copy();
}
TransactionpoolTransactions getTransactionpoolTransactions(){
return latestTransactionpoolTransactions.copy();
}
WalletAddress getWalletAddress(){
return latestWalletAddress.copy();
}

WalletStatus getWalletStatus(){
return latestWalletStatus.copy();
}



// Timer approach
void updateGlobalVariables(Timer t){
// http.get("localhost:9980/host/status").then((response){
//   var json = JSON.decode(response.body);
//   latestHostStatus.TotalStorage = json["TotalStorage"];
//   // rest of props
// });
  
  http.get("http://localhost:9980/host/status").then((response){
     var json = JSON.decode(response.body);
     if(!(latestWalletStatus.changeNotify(json))){
       print(response.body);
       latestHostStatus.jsonFormat = json;
       latestHostStatus.TotalStorage = json["TotalStorage"];
       latestHostStatus.MinFilesize  = json["MinFilesize"];
       latestHostStatus.MaxFileSize = json["MaxFileSize"];
       latestHostStatus.MinDuration = json["MinDuration"];
       latestHostStatus.MaxDuration = json["MaxDuration"];
       latestHostStatus.WindowSize = json["WindowSize"];
       latestHostStatus.Price = json["Price"];
       latestHostStatus.Collateral = json["Collateral"];
       latestHostStatus.StorageRemaining = json["StorageRemaining"];
       latestHostStatus.NumContracts = json["NumContracts"];
     }
   });

  // DaemonUpdateCheck latestDaemonUpdateCheck;
  http.get("http://localhost:9980/daemon/update/check").then((response){
    var json = JSON.decode(response.body);
    if(!(latestWalletStatus.changeNotify(json))){
      print(response.body);
      latestDaemonUpdateCheck.jsonFormat = json;
      latestDaemonUpdateCheck.Available = json["Available"];
      latestDaemonUpdateCheck.Version = json["Version"];
    }
  });

  // ConsensusStatus latestConsensusStatus;
  http.get("http://localhost:9980/consensus/status").then((response){
    var json = JSON.decode(response.body);
    if(!(latestWalletStatus.changeNotify(json))){
      print(response.body);
      latestConsensusStatus.jsonFormat = json;
      latestConsensusStatus.Height = json["Height"];
    }
  });

  // MinerStatus latestMinerStatus;
  http.get("http://localhost:9980/miner/status").then((response){
    var json = JSON.decode(response.body);
    if(!(latestWalletStatus.changeNotify(json))){
      print(response.body);
      latestMinerStatus.jsonFormat = json;
      latestMinerStatus.Mining = json["Mining"];
      latestMinerStatus.State = json["State"];
      latestMinerStatus.Threads = json["Threads"];
      latestMinerStatus.RunningThreads = json["RunningThreads"];
    }
  });

  // RenterDownloadQueue latestRenterDownloadQueue;
  http.get("http://localhost:9980/renter/downloadqueue").then((response){
    var json = JSON.decode(response.body);
    //May or may not have the parameters plus more for each
    if(!(latestWalletStatus.changeNotify(json))){
      print(response.body);
      latestRenterDownloadQueue.jsonFormat = json;

  //    latestRenterDownloadQueue.Complete = json["Complete"];
  //    latestRenterDownloadQueue.Filesize = json["Filesize"];
  //    latestRenterDownloadQueue.Destination = json["Destination"];
  //    latestRenterDownloadQueue.Nickname = json["Nickname"];
    }
  });

  // RenterFiles latestRenterFiles;
  http.get("http://localhost:9980/renter/files").then((response){
    var json = JSON.decode(response.body);
    //May or may not have the parameters plus more for each
    if(!(latestWalletStatus.changeNotify(json))){
      print(response.body);
      latestRenterFiles.jsonFormat = json;

  //    latestRenterFiles.Available = json["Available"];
  //    latestRenterFiles.Nickname = json["Nickname"];
  //    latestRenterFiles.Repairing = json["Repairing"];
  //    latestRenterFiles.TimeRemaining = json["TimeRemaining"];
    }
  });

  // TransactionpoolTransactions latestTransactionpoolTransactions;
  http.get("http://localhost:9980/transactionpool/transactions").then((response){
    var json = JSON.decode(response.body);
    if(!(latestWalletStatus.changeNotify(json))){
      print(response.body);
      latestTransactionpoolTransactions.jsonFormat = json;
      latestTransactionpoolTransactions.Complete = json["Complete"];
      latestTransactionpoolTransactions.Transactions = json["Transactions"];
    }
  });

// WalletAddress latestWalletAddress;
  http.get("http://localhost:9980/wallet/address").then((response){
    var json = JSON.decode(response.body);
    if(!(latestWalletStatus.changeNotify(json))){
      print(response.body);
      latestWalletAddress.jsonFormat = json;
      latestWalletAddress.Address = json["Address"];
    }
  });

  // WalletStatus latestWalletStatus;
  http.get("http://localhost:9980/wallet/status").then((response){
    var json = JSON.decode(response.body);
    if(!(latestWalletStatus.changeNotify(json))){
      print(response.body);
      latestWalletStatus.jsonFormat = json;
      latestWalletStatus.Balance = json["Balance"];
      latestWalletStatus.FullBalance = json["FullBalance"];
      latestWalletStatus.NumAddress = json["NumAddress"];
    }
  });
}

void update(){
  Duration duration = new Duration(milliseconds:500);
  new Timer.periodic(duration, updateGlobalVariables);
}

