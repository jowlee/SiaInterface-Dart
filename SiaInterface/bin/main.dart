// Copyright (c) 2015, <Joseph Lee>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:SiaInterface/SiaInterface.dart' as SiaInterface;
//import 'dart:io';
import 'package:http/http.dart' as http;
import 'Renter.dart';
import 'Host.dart';

void outputInfo(var jsonString) {
  print(jsonString.body);
}


void parseHost(var args) {
  var request = args[0];
  if (request.contains("announce", 4) && args.length == 1) {
    Host.announce();
  }
  else if (request.contains("config", 4) && args.length == 9) {
    Host.config(args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8]);
  }
  else if (request.contains("status", 4) && args.length == 1) {
    Host.status();
  }
  else {
    print ("invalid argument");
  }
}


void parseRenter(var args) {
  var request = args[0];
  var renter = new Renter();
  print(request);
  if (request.contains("downloadqueue", 6)) {
    renter.downloadqueue();
  }
  else if (request.contains("download", 6)) {
    var nickname = args[1];
    var destination = args[2];
    renter.download(nickname, destination);
  }
  
  else if (request.contains("files", 6)) {
    renter.files();
  }
  
  else if (request.contains("upload", 6)) {
    var source = args[1];
    var nickname = args[2];
    renter.upload(source, nickname);
  }
  
  else {
    print ("invalid argument");
  }
}





main(List<String> arguments) {
  if (arguments.length == 0) {
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
