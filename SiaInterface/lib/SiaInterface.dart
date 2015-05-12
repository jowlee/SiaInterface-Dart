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
List<RenterDownloadQueueitem> downloadqueue = new List<RenterDownloadQueueitem>();
List<RenterFilesItem> files = new List<RenterFilesItem>();

List<RenterFilesItem> FilesList = new List<RenterFilesItem>();
DaemonUpdateCheck latestDaemonUpdateCheck = new DaemonUpdateCheck(temp, true, "0.0.1");
ConsensusStatus latestConsensusStatus = new ConsensusStatus(temp, 10, "CurrentBlock", "Target");
GatewayStatus latestGatewayStatus = new GatewayStatus(temp, "address", new List<String>());
HostStatus latestHostStatus = new HostStatus(temp, 29, 0, 3006, 0, 49, 288, 3, 0, 0, 29);
HostDBHostsActive latestHostDBHostsActive = new HostDBHostsActive(temp, ["Entries"]);
MinerStatus latestMinerStatus = new MinerStatus(temp, true, "state", 10, 5, "Address");
RenterDownloadQueue latestRenterDownloadQueue = new RenterDownloadQueue(temp, downloadqueue);
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
GatewayStatus getGatewayStatus(){
return latestGatewayStatus.copy();
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

void consensusSynchronize([Function callback = printFunct]){
  ConsensusSynchronize.synchronize(callback);
}
void daemonStop([Function callback = printFunct]){
    DaemonStop.stop(callback);
}
void daemonUpdateApply([Function callback = printFunct]){
  DaemonUpdateApply.updateApply(callback);
}
void gatewayPeerAdd(String address, [Function callback = printFunct]){
  GatewayPeer.add(address, callback);
}
void gatewayPeerRemove(String address, [Function callback = printFunct]){
  GatewayPeer.remove(address, callback);
}
void hostAnnounce([Function callback = printFunct]){
  HostAnnounce.announce(callback);
}
void hostConfig(String TotalStorage, String MinFilesize, String MaxFileSize, String MinDuration, String MaxDuration, String WindowSize, String Price, String Collateral, [Function callback = printFunct]){
  HostConfig.config(TotalStorage, MinFilesize, MaxFileSize, MinDuration, MaxDuration, WindowSize, Price, Collateral, callback);
}
void minerStart([Function callback = printFunct]){
  MinerStart.start(callback);
}
void minerStop([Function callback = printFunct]){
  MinerStop.stop(callback);
}
void renterFilesDownload(String nickname, String destination, [Function callback = printFunct] ){
  RenterFilesDownload.download(nickname, destination, callback);
}
void renterFilesUpload(String source, String nickname, [Function callback = printFunct]){
  RenterFilesUpload.upload(source, nickname, callback);
}
void renterFilesDelete(String nickname, [Function callback = printFunct]){
  RenterFilesDelete.delete(nickname, callback);
}
void walletSend(int Amount, String Destination, [Function callback = printFunct]){
  WalletSend.send(Amount, Destination, callback);
}

printFunct(String input) {
//  print("Made it here");
  print("callback returns : "+ input);
}


// Timer approach
void updateGlobalVariables(Timer t){
  
  http.get("http://localhost:9980/host/status").then((response){
     if(!(latestHostStatus.changeNotify(response.body))){
//       print(response.body);
       Map json = JSON.decode(response.body);
       latestHostStatus.parseUpdate(json);
     }
   });

  // DaemonUpdateCheck latestDaemonUpdateCheck;
  http.get("http://localhost:9980/daemon/update/check").then((response){
    if(!(latestDaemonUpdateCheck.changeNotify(response.body))){
//      print(response.body);
      Map json = JSON.decode(response.body);
      latestDaemonUpdateCheck.parseUpdate(json);
    }
  });
  // ConsensusStatus latestConsensusStatus;
  http.get("http://localhost:9980/consensus/status").then((response){
    if(!(latestConsensusStatus.changeNotify(response.body))){
//      print(response.body);
      Map json = JSON.decode(response.body);
      latestConsensusStatus.parseUpdate(json);
    }
  });

  // MinerStatus latestMinerStatus;
  http.get("http://localhost:9980/miner/status").then((response){
    if(!(latestMinerStatus.changeNotify(response.body))){
//      print(response.body);
      Map json = JSON.decode(response.body);
      latestMinerStatus.parseUpdate(json);

    }
  });

  // RenterDownloadQueue latestRenterDownloadQueue;
  http.get("http://localhost:9980/renter/downloadqueue").then((response){
    List json = JSON.decode(response.body);
    bool diffJSON = false;
    int itr = 0;
    if(json.length != latestRenterDownloadQueue.DownloadQueue.length){
      diffJSON = true;
//      print("This repeats");
    }
    else{ 
      while(itr < json.length){
        if(!(latestRenterDownloadQueue.DownloadQueue[itr].changeNotify(JSON.encode(json[itr])))){ 
          diffJSON = true;
//          print("This is the one that repeats" + itr.toString());
          break;
        }
        itr++;
      }
    }
    //Change the list if different
     
    if(diffJSON){
//      print(response.body);
      latestRenterDownloadQueue.updateParse(json);
    }
  });    
  // RenterFiles latestRenterFiles;
  http.get("http://localhost:9980/renter/files").then((response){
    List json = JSON.decode(response.body);
        bool diffJSON = false;
        int itr = 0;
        //Check is different

        if(json.length != latestRenterFiles.FilesList.length){
          diffJSON = true;
//          print("This repeats");
        }
        else{ 
          while(itr < json.length){
           if(!(latestRenterFiles.FilesList[itr].changeNotify(JSON.encode(json[itr])))){ 
              diffJSON = true;
//              print("This is the one that repeats" + itr.toString());
              break;
            }
            itr++;
          }
        }
        //Change the list if different
        
        if(diffJSON){
//          print(response.body);
          latestRenterFiles.updateParse(json);
        }
  });

  // TransactionpoolTransactions latestTransactionpoolTransactions;
  http.get("http://localhost:9980/transactionpool/transactions").then((response){
    if(!(latestTransactionpoolTransactions.changeNotify(response.body))){
//      print(response.body);
      Map json = JSON.decode(response.body);
      latestTransactionpoolTransactions.parseUpdate(json);
    }
  }); 

// WalletAddress latestWalletAddress;
  http.get("http://localhost:9980/wallet/address").then((response){
    if(!(latestWalletAddress.changeNotify(response.body))){
//      print(response.body);
      Map json = JSON.decode(response.body);
      latestWalletAddress.parseUpdate(json);
    }
  }); 
  // WalletStatus latestWalletStatus;
  http.get("http://localhost:9980/wallet/status").then((response){
    if(!(latestWalletStatus.changeNotify(response.body))){
//      print(response.body);
      Map json = JSON.decode(response.body);
      latestWalletStatus.parseUpdate(json);
    }
  });
}

void update(){
  Duration duration = new Duration(milliseconds:500);
  new Timer.periodic(duration, updateGlobalVariables);
}

