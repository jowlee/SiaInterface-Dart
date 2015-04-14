// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:SiaInterface/SiaInterface.dart' as SiaInterface;
import 'dart:html';

void parseHost(var requestList) {
  var request = requestList[0].substring(4,requestList[0].length);
  if (request == "announce") {
    // print success if true
  }
  else if (request == "config") {
    // do config stuff
  }
  else if (request == "status") {
    // print status output
  }
}

void renter(var param) {
  
  if (param.substring(7, 15) == "downloadqueue") {
    // do downloadqueue
  }
  else if (param.substring(7, 15) == "download") {
    // do download stuff
  }
  else if (param.substring(7, 12) == "files") {
    // do files stuff
  }
  else if (param.substring(7, 13) == "upload") {
    HttpRequest.getString('http://localhost:9980').then(
        (result) => print('Request complete: $result'));
  }
}

main(List<String> arguments) {
  if (arguments.length == 0) {
    return 0;
  }
  // first arguement decides where to send it
  // $ dart main.dart host/config parameters
  var request = arguments[0];
  if(request.substring(0, 6) == 'daemon') {
//      executeClosed();
  }
  else if(request.substring(0, 9) == 'consensus'){
//    put your function here
  }
  else if(request.substring(0, 7) == 'gateway'){
//    put your function here
  }
  else if(request.substring(0, 5) == 'host'){
//    put your function here
  }
  else if(request.substring(0, 5) == 'miner'){
//    put your function here
  }
  else if(request.substring(0, 6) == 'renter'){
    renter(request);
  }
  else if(request.substring(0, 15) == 'transactionpool'){
//    put your function here
  }
  else if(request.substring(0, 6) == 'wallet'){
//    put your function here
  }
  else{
    print('nothing works');
  }
  
}
