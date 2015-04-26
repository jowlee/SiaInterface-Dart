// Copyright (c) 2015, <Joseph Lee>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:SiaInterface/SiaInterface.dart' as SiaInterface;
//import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'Daemon.dart';
import 'Consensus.dart';

import 'Host.dart';

import 'Miner.dart';
import 'Renter.dart';
import 'TransactionPool.dart';
import 'Wallet.dart';


bool assertSize(var args, int length, int name) {
  if (args.length-1 != length) {
    print("$name should have $length parameter(s)");
    return false;
  }
  return true;
}


void parseDaemon(var args) {
  var request = args[0];
  if (request.contains("stop", 6)) {
    printResult(bool param){
      if(param){
        print("Works");
      }
      else{
        print("Broken");
      }
    }
    DaemonStop.stop(printResult);
  }
  else if (request.contains("update/apply", 6)) {
    printResult(bool param){
      if(param){
        print("Works");
      }
      else{
        print("Broken");
      }
    }
    DaemonUpdateApply.updateApply(printResult);
  }
  else if (request.contains("update/check", 6)) {
    DaemonUpdateCheck currentDaemoncheck = getDaemonUpdateCheck();
    print("Doing Daemon Update Check");
    print("Availible: ${currentDaemoncheck.Available}");
    print("Version: ${currentDaemoncheck.Version}");
  }
  else {
    print ("invalid argument");
  }
}


void parseConsensus(var args) {
  var request = args[0];
  if (request.contains("status", 9)) {
    ConsensusStatus currnetConsensusStatus = getConsensusStatus();
    print("Doing Consensus Status");
    print("Height: ${currnetConsensusStatus.Height}");
  }
  else {
    print ("invalid argument");
  }
}



void parseHost(var args) {
  var request = args[0];
  if (request.contains("announce", 4)) {
    if (!assertSize(args, 0, request)) {return;}
    Host.announce();
  }
  else if (request.contains("config", 4)) {
    if (!assertSize(args, 8, request)) {return;}
    Host.config(args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8]);
  }
  else if (request.contains("status", 4)) {
    if (!assertSize(args, 0, request)) {return;}
    Host.status();
  }
  else {
    print ("invalid argument");
  }
}


void parseMiner (var args) {
  var request = args[0];
  if (request.contains("start", 5)) {
    printResult(bool param){
          if(param){
            print("Works");
          }
          else{
            print("Broken");
          }
        }
        MinerStart.start(printResult);
  }
  else if (request.contains("status", 4)) {
    MinerStatus currentMinerStatus = getMinerStatus();
    print("Doing Miner Status");
    print("Mining: ${currentMinerStatus.Mining}");
    print("State: ${currentMinerStatus.State}");
    print("Threads: ${currentMinerStatus.Threads}");
    print("RunningThreads: ${currentMinerStatus.RunningThreads}");
  }
  else if (request.contains("stop", 4)) {
    printResult(bool param){
          if(param){
            print("Works");
          }
          else{
            print("Broken");
          }
        }
        MinerStop.stop(printResult);
  }
  else {
    print ("invalid argument");
  }
}

void parseRenter(var args) {
  var request = args[0];
  print(request);
  if (request.contains("downloadqueue", 6)) {
    RenterDownloadQueue currentDownloadQueue = getRenterDownloadQueue();
    print("Doing Downloadqueue");
    print("Filesize: ${currentDownloadQueue.Filesize}");
    print("Received: ${currentDownloadQueue.Received}");
    print("Destination: ${currentDownloadQueue.Destination}");
    print("Nickname: ${currentDownloadQueue.Nickname}");
  }
  
  else if (request.contains("download", 6)) {
    var nickname = args[1];
    var destination = args[2];    
    printResult(bool param){
      if(param){
        print("Works");
      }
      else{
        print("Broken");
      }
    }
    RenterDownload.download(nickname, destination, printResult);

  }
  
  else if (request.contains("files", 6)) {
    RenterFiles currentRenterFiles = getRenterFiles();
    print("Doing RenterFiles");
    print("Available: ${currentRenterFiles.Available}");
    print("Nickname: ${currentRenterFiles.Nickname}");
    print("Repairing: ${currentRenterFiles.Repairing}");
    print("TimeRemaining: ${currentRenterFiles.TimeRemaining}");
  }
  
  else if (request.contains("upload", 6)) {
    var source = args[1];
    var nickname = args[2];
    printResult(bool param){
      if(param){
        print("Works");
      }
      else{
        print("Broken");
      }
    }
    RenterUpload.upload(source, nickname, printResult);
  }
  
  else {
    print ("invalid argument");
  }
}



void parseTransactionPool (var args) {
  var request = args[0];
  print(request);
  if (request.contains("transactions", 15)) {
    TransactionpoolTransactions currentTransPool = getTransactionpoolTransactions();
    print("Doing TransactionPool");
    print("Transactions: ${currentTransPool.Transactions}");
  }
  else {
    print ("invalid argument");
  }
}
void parseWallet (var args) {
  var request = args[0];
  print(request);
  if (request.contains("address", 5)) {
    WalletAddress currentWalletAddress = getWalletAddress();
    print("Doing Wallet Adress");
    print("Address: ${currentWalletAddress.Address}");
  }
  else if (request.contains("send", 5)) {
    var Amount = args[1];
        var Destination = args[2];
        printResult(bool param){
          if(param){
            print("Works");
          }
          else{
            print("Broken");
          }
        }
        WalletSend.send(Amount, Destination, printResult);
  }
  else if (request.contains("status", 5)) {
    WalletStatus currentWalletStatus = getWalletStatus();
    print("Doing wallet Status");
    print("Balance: ${currentWalletStatus.Balance}");
    print("Balance: ${currentWalletStatus.Balance}");
    print("Balance: ${currentWalletStatus.Balance}");

  }
  else {
    print ("invalid argument");
  }
}


// Renter Global Variables
DaemonUpdateCheck latestDaemonUpdateCheck = new DaemonUpdateCheck(true, "0.0.1");
ConsensusStatus latestConsensusStatus = new ConsensusStatus(10);

MinerStatus latestMinerStatus = new MinerStatus(true, "state", 10, 5);
RenterDownloadQueue latestRenterDownloadQueue = new RenterDownloadQueue(true, 10, 10, "dest", "nickname");
RenterFiles latestRenterFiles = new RenterFiles(true, "nickname", false, 0);
TransactionpoolTransactions latestTransactionpoolTransactions= new TransactionpoolTransactions("transaction");
WalletAddress latestWalletAddress = new WalletAddress("Address");
WalletStatus latestWalletStatus = new WalletStatus(10, 20, 123);

// Renter Get Functions
DaemonUpdateCheck getDaemonUpdateCheck(){
  return latestDaemonUpdateCheck.copy();
}
ConsensusStatus getConsensusStatus(){
  return latestConsensusStatus.copy();
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
// DaemonUpdateCheck latestDaemonUpdateCheck;
  http.get("http://localhost:9980/daemon/update/check").then((response){
    var json = JSON.decode(response.body);
    print(response.body);
    latestDaemonUpdateCheck.Available = json["Available"];
    latestDaemonUpdateCheck.Version = json["Version"];
  });
// ConsensusStatus latestConsensusStatus;

  http.get("http://localhost:9980/consensus/status").then((response){
    var json = JSON.decode(response.body);
    print(response.body);
    latestConsensusStatus.Height = json["Height"];
  });
  
// MinerStatus latestMinerStatus;
  http.get("http://localhost:9980/miner/status").then((response){
    var json = JSON.decode(response.body);
    print(response.body);
    latestMinerStatus.Mining = json["Mining"];
    latestMinerStatus.State = json["State"];
    latestMinerStatus.Threads = json["Threads"];
    latestMinerStatus.RunningThreads = json["RunningThreads"];
  });
// RenterDownloadQueue latestRenterDownloadQueue;
  http.get("http://localhost:9980/renter/downloadqueue").then((response){
    var json = JSON.decode(response.body);
    print(response.body);
    //May or may not have the parameters plus more for each
//    latestRenterDownloadQueue.Complete = json["Complete"];
//    latestRenterDownloadQueue.Filesize = json["Filesize"];
//    latestRenterDownloadQueue.Destination = json["Destination"];
//    latestRenterDownloadQueue.Nickname = json["Nickname"];
  });

  // RenterFiles latestRenterFiles;
  http.get("http://localhost:9980/renter/files").then((response){
    var json = JSON.decode(response.body);
    //May or may not have the parameters plus more for each

//    latestRenterFiles.Available = json["Available"];
//    latestRenterFiles.Nickname = json["Nickname"];
//    latestRenterFiles.Repairing = json["Repairing"];
//    latestRenterFiles.TimeRemaining = json["TimeRemaining"];
  });
// TransactionpoolTransactions latestTransactionpoolTransactions;
  http.get("http://localhost:9980/transactionpool/transactions").then((response){
    var json = JSON.decode(response.body);
    latestTransactionpoolTransactions.Complete = json["Complete"];
    latestTransactionpoolTransactions.Transactions = json["Transactions"];
  });
// WalletAddress latestWalletAddress;
  http.get("http://localhost:9980/wallet/address").then((response){
    var json = JSON.decode(response.body);
    latestWalletAddress.Address = json["Address"];
  });
  
// WalletStatus latestWalletStatus;
  http.get("http://localhost:9980/wallet/status").then((response){
    var json = JSON.decode(response.body);
    latestWalletStatus.Balance = json["Balance"];
    latestWalletStatus.FullBalance = json["FullBalance"];
    latestWalletStatus.NumAddress = json["NumAddress"];
  });
}



main(List<String> arguments) {
//  if (arguments.length == 0) {
//    print("Usage: <api-call> <args>");
//    return 0;
//  }
  // first arguement decides where to send it
  // $ dart main.dart host/config parameters
  
  var request = arguments[0];
  if (request.contains('daemon',0)) {
    parseDaemon(arguments);
  }
  else if(request.contains('consensus',0)){
    parseConsensus(arguments);
  }
  else if(request.contains('gateway',0)){
//    put your function here
  }
  else if(request.contains('host',0)){
    parseHost(arguments);
  }
  else if(request.contains('miner',0)){
    parseMiner(arguments);
  }
  else if(request.contains('renter',0)){
    parseRenter(arguments);
  }
  else if(request.contains('transactionpool',0)) {
    parseTransactionPool(arguments);
  }
  else if(request.contains('wallet',0)){
    parseWallet(arguments);
  }
  else{
    print('invalid arguement');
  }
//  Duration duration = new Duration(milliseconds:500);
//  new Timer.periodic(duration, updateGlobalVariables);
  
}
