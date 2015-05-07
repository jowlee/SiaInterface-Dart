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

String temp = null;
List<RenterFilesItem> FilesList = new List<RenterFilesItem>();
//DaemonStop latestDaemonStop = new DaemonStop(temp, true);
//DaemonUpdateApply latestDaemonUpdateApply = new DaemonUpdateApply(temp, true);
DaemonUpdateCheck latestDaemonUpdateCheck = new DaemonUpdateCheck(temp, true, "0.0.1");
ConsensusStatus latestConsensusStatus = new ConsensusStatus(temp, 10, "CurrentBlock", "Target");
GatewayStatus latestGatewayStatus = new GatewayStatus(temp, "address", new List<String>());
//GatewayPeer latestGatewayPeer = new GatewayPeer(temp, true);
//HostAnnounce latestHostAnnounce = new HostAnnounce(temp, true);
//HostConfig latestHostConfig = new HostConfig(temp, true);
HostStatus latestHostStatus = new HostStatus(temp, 29, 0, 3006, 0, 49, 288, 3, 0, 0, 29);
HostDBHostsActive latestHostDBHostsActive = new HostDBHostsActive(temp, ["Entries"]);
//MinerStart latestMinerStart = new MinerStart(temp, true);
MinerStatus latestMinerStatus = new MinerStatus(temp, true, "state", 10, 5, "Address");
//MinerStop latestMinerStop = new MinerStop(temp, true);
//RenterFilesDownload latestRenterFilesDownload = new RenterDownload(temp, true);
RenterDownloadQueue latestRenterDownloadQueue = new RenterDownloadQueue(temp, null);
//RenterFilesUpload latestRenterFilesUpload = new RenterUpload(temp, true);
RenterFiles latestRenterFiles = new RenterFiles(temp, FilesList );
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


// Move all post functions here

void daemonStop(Function onFinish){
  DaemonStop.stop(onFinish);
}
void daemonUpdateApply(Function onFinish){
  DaemonUpdateApply.updateApply(onFinish);
}
void gatewayPeerAdd(String address, Function onFinish){
  GatewayPeer.add(address, onFinish);
}
void gatewayPeerRemove(String address, Function onFinish){
  GatewayPeer.remove(address, onFinish);
}
void hostAnnounce(Function onFinish){
  HostAnnounce.announce(onFinish);
}
void hostConfig(String TotalStorage, String MinFilesize, String MaxFileSize, String MinDuration, String MaxDuration, String WindowSize, String Price, String Collateral, Function onFinish){
  HostConfig.config(TotalStorage, MinFilesize, MaxFileSize, MinDuration, MaxDuration, WindowSize, Price, Collateral, onFinish);
}
void minerStart(Function onFinish){
  MinerStart.start(onFinish);
}
void minerStop(Function onFinish){
  MinerStop.stop(onFinish);
}
void renterFilesDownload(String nickname, String destination, Function onFinish){
  RenterFilesDownload.download(nickname, destination, onFinish);
}
void renterFilesUpload(String source, String nickname, Function onFinish){
  RenterFilesUpload.upload(source, nickname, onFinish);
}
void renterFilesDelete(String nickname, Function onFinish){
  RenterFilesDelete.delete(nickname, onFinish);
}
void walletSend(int Amount, String Destination, Function onFinish){
  WalletSend.send(Amount, Destination, onFinish);
}

void printFunct(String input){
  print(input);
}


// Timer approach
void updateGlobalVariables(Timer t){
  
  http.get("http://localhost:9980/host/status").then((response){
     var json = JSON.decode(response.body);
     if(!(latestHostStatus.changeNotify(json))){
       print(response.body);
       latestHostStatus.parseUpdate(json);
//       latestHostStatus.TotalStorage = json["TotalStorage"];
//       latestHostStatus.MinFilesize  = json["MinFilesize"];
//       latestHostStatus.MaxFileSize = json["MaxFileSize"];
//       latestHostStatus.MinDuration = json["MinDuration"];
//       latestHostStatus.MaxDuration = json["MaxDuration"];
//       latestHostStatus.WindowSize = json["WindowSize"];
//       latestHostStatus.Price = json["Price"];
//       latestHostStatus.Collateral = json["Collateral"];
//       latestHostStatus.StorageRemaining = json["StorageRemaining"];
//       latestHostStatus.NumContracts = json["NumContracts"];
     }
   });

  // DaemonUpdateCheck latestDaemonUpdateCheck;
  http.get("http://localhost:9980/daemon/update/check").then((response){
    var json = JSON.decode(response.body);
    if(!(latestDaemonUpdateCheck.changeNotify(json))){
      print(response.body);
      latestDaemonUpdateCheck.Available = json["Available"];
      latestDaemonUpdateCheck.Version = json["Version"];
    }
  });
  // ConsensusStatus latestConsensusStatus;
  http.get("http://localhost:9980/consensus/status").then((response){
    var json = JSON.decode(response.body);
    if(!(latestConsensusStatus.changeNotify(json))){
      print(response.body);
      latestConsensusStatus.Height = json["Height"];
    }
  });

  // MinerStatus latestMinerStatus;
  http.get("http://localhost:9980/miner/status").then((response){
    var json = JSON.decode(response.body);
    if(!(latestMinerStatus.changeNotify(json))){
      print(response.body);
      latestMinerStatus.Mining = json["Mining"];
      latestMinerStatus.State = json["State"];
      latestMinerStatus.Threads = json["Threads"];
      latestMinerStatus.RunningThreads = json["RunningThreads"];
    }
  });

  // RenterDownloadQueue latestRenterDownloadQueue;
  http.get("http://localhost:9980/renter/downloadqueue").then((response){
    List json = JSON.decode(response.body);
    bool diffJSON = false;
    int itr = 0;
    while(itr < json.length){
      if(json.length != latestRenterDownloadQueue.DownloadQueue.length){
        diffJSON = true;
        print("This repeats");
        break;
      }
      else if(!(latestRenterDownloadQueue.DownloadQueue[itr].changeNotify(json[itr]))){ 
        diffJSON = true;
        print("This is the one that repeats" + itr.toString());
        break;
      }
      itr++;
    }
    //Change the list if different
     
    if(diffJSON){
      print(response.body);
      latestRenterDownloadQueue.updateParse(json);
    }
  });
  // RenterFiles latestRenterFiles;
  http.get("http://localhost:9980/renter/files").then((response){
    List json = JSON.decode(response.body);
        bool diffJSON = false;
        int itr = 0;
        print("json len is "+ json.length.toString());
        print(" len is "+ latestRenterFiles.FilesList.length.toString());    
        //Check is different

        while(itr < json.length){
          if(json.length != latestRenterFiles.FilesList.length){
            diffJSON = true;
            print("This repeats");
            break;
          }
          else if(!(latestRenterFiles.FilesList[itr].changeNotify(json[itr]))){ 
            diffJSON = true;
            print("This is the one that repeats" + itr.toString());
            break;
          }
          itr++;
        }
        //Change the list if different
        
        if(diffJSON){
          print(response.body);
          latestRenterFiles.updateParse(json);
        }
  });
  
  // TransactionpoolTransactions latestTransactionpoolTransactions;
  http.get("http://localhost:9980/transactionpool/transactions").then((response){
    var json = JSON.decode(response.body);
    if(!(latestTransactionpoolTransactions.changeNotify(json))){
      print(response.body);
      latestTransactionpoolTransactions.Complete = json["Complete"];
      latestTransactionpoolTransactions.Transactions = json["Transactions"];
    }
  }); 

// WalletAddress latestWalletAddress;
  http.get("http://localhost:9980/wallet/address").then((response){
    var json = JSON.decode(response.body);
    if(!(latestWalletAddress.changeNotify(json))){
      print(response.body);
      latestWalletAddress.Address = json["Address"];
    }
  }); 
  // WalletStatus latestWalletStatus;
  http.get("http://localhost:9980/wallet/status").then((response){
    var json = JSON.decode(response.body);
    if(!(latestWalletStatus.changeNotify(json))){
      print(response.body);
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

