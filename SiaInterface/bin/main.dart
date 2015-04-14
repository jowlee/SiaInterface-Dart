// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:SiaInterface/SiaInterface.dart' as SiaInterface;
import 'dart:html';

void parseHost(var requestList) {
  var request = requestList[0].substring(4,requestList[0].length);
  if (request == "announce") {
    // do announce stuff
  }
  else if (request == "config") {
    // do config stuff
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
  switch (request) {
    case '/daemon':
//      executeClosed();
      break;
    case '/consensus':
//      executeOpen();
      break;
    case '/gateway':
//      executeApproved();
      break;
    case '/host':
//      executeApproved();
      break;
    case '/miner':
//      executeApproved();
      break;
    case request.substring(0,5) == 'renter':
      renter(request);
      break;
    case request.substring(0,15) == 'transactionpool':
//      executeApproved();
      break;
    case request.substring(0,6) == 'wallet':
//      executeApproved();
      break;      
    default:
      print('nothing works');
  }
  
}
