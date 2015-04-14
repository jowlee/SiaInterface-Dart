// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:SiaInterface/SiaInterface.dart' as SiaInterface;
//import 'dart:html';
//import 'dart:io';
import 'package:http/http.dart' as http;

void outputInfo(var jsonString) {
  print(jsonString);
}


void parseHost(var requestList) {
  var request = requestList[0];
  if (request.contains("announce", 4)) {
    
  }
  else if (request.contains("config", 4)) {
    var url = "http://localhost:9980/host/announce";
    http.get(url).then((outputInfo));
  }
  else if (request.contains("status", 4)) {
    
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
    parseHost(arguements)
  }
  else if(request.contains('miner',0)){
//    put your function here
  }
  else if(request.contains('renter',0)){
//    renter(request);
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
