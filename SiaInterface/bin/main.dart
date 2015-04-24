// Copyright (c) 2015, <Joseph Lee>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:SiaInterface/SiaInterface.dart' as SiaInterface;
//import 'dart:io';
//import 'package:http/http.dart' as http;
import 'Renter.dart';
import 'Host.dart';
import 'Response.dart';

void outputInfo(var jsonString) {
  print(jsonString.body);
}
bool assertSize(var args, int length, int name) {
  if (args.length-1 != length) {
    print("$name should have $length parameter(s)");
    return false;
  }
  return true;
}

void parseHost(var args) {
  var request = args[0];
  if (request.contains("announce", 4)) {
    if (!assertSize(args, 0, request)) {return;}
    String url = "http://localhost:9980/host/announce";
    HostAnnounceResponse host = Response.getData(url);
  }
  else if (request.contains("config", 4)) {
    if (!assertSize(args, 8, request)) {return;}
    String url = "http://localhost:9980/host/announce";
    url += '?totalStorage=${args[1]}&minFilesize=${args[2]}&maxFilesize=${args[3]}&minDuration=${args[4]}&maxDuration=${args[4]}&windowSize=${args[6]}&price=${args[7]}&collateral=${args[8]}';
    HostConfigResponse host = Response.getData(url);
  }
  else if (request.contains("status", 4)) {
    if (!assertSize(args, 0, request)) {return;}
    var url = "http://localhost:9980/host/status";
    HostStatusResponse host = Response.getData(url);
  }
  else {
    print ("invalid argument");
  }
}


void parseRenter(var args) {
  var request = args[0];
  print(request);
  if (request.contains("downloadqueue", 6)) {
    Renter.downloadqueue();
  }
  else if (request.contains("download", 6)) {
    var nickname = args[1];
    var destination = args[2];    
    Renter.download(nickname, destination);

  }
  
  else if (request.contains("files", 6)) {
    Renter.files();
  }
  
  else if (request.contains("upload", 6)) {
    var source = args[1];
    var nickname = args[2];
    Renter.upload(source, nickname);
  }
  
  else {
    print ("invalid argument");
  }
}





main(List<String> arguments) {
  if (arguments.length == 0) {
    print("Usage: <api-call> <args>");
    return 0;
  }
  // first arguement decides where to send it
  // $ dart main.dart host/config parameters
  var request = arguments[0];
  if (request.contains('daemon',0)) {
    print("daemon");
  }
  else if(request.contains('consensus',0)){
//    put your function here
  }
  else if(request.contains('gateway',0)){
//    put your function here
  }
  else if(request.contains('host',0)){
    parseHost(arguments);
  }
  else if(request.contains('miner',0)){
//    put your function here
  }
  else if(request.contains('renter',0)){
    parseRenter(arguments);
  }
  else if(request.contains('transactionpool',0)) {
//    put your function here
  }
  else if(request.contains('wallet',0)){
//    put your function here
  }
  else{
    print('invalid arguement');
  }
  
}
