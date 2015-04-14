// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:SiaInterface/SiaInterface.dart' as SiaInterface;
//import 'dart:html';
//import 'dart:io';

void outputInfo(var jsonString) {
  print(jsonString);
}

void parseHost(var requestList) {
  var request = requestList[0].substring(4,requestList[0].length);
  switch (request) {
    case 'announce':
      var url = "http://localhost:9980/host/announce";
        var jsonString = HttpRequest.getString(url).then(outputInfo);
      break;
    case 'config':
      
      break;
    case 'status':
      
      break;
    default:
      print("invalid argument");
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
    case 'daemon':
      print("test");
//      parseDaemon(arguments);
      break;
    case 'consensus':
//      executeOpen();
      break;
    case 'gateway':
//      executeApproved();
      break;
    case 'host':
      parseHost(arguments);
      break;
    case 'miner':
//      executeApproved();
      break;
    case 'renter':
//      executeApproved();
      break;
    case 'transactionpool':
//      executeApproved();
      break;
    case '/wallet':
//      executeApproved();
      break;      
    default:
      print('nothing works');
  }
  
}
