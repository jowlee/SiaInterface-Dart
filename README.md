# SiaInterface-Dart
A rebuild of the Sia interface using google dart

Contributors: Joseph Lee, Matthew Vitting, Andrew Kaiser

---

Import files into project library
Type "import 'package:SiaInterface/SiaInterface.dart' as SiaInterface;" at the top of the proeject to include the files.

Refer to https://github.com/NebulousLabs/Sia/blob/master/doc/API.md for the Sia API

Functions:   
SiaInterface.update();  
This is pulls data from the server and makes a call every 500 milliseconds to retrieve new data.   
Every data point is updated with this function.   
  
To retrieve information, call: SiaInterface.getSomeFunctionName()
These functions return objects with accessable variables
- getDaemonUpdateCheck()
- getConsensusStatus()
- getHostStatus() 
- getMinerStatus()
- getRenterDownloadQueue()
- getRenterFiles()
- getTransactionpoolTransactions()
- getWalletAddress()
- getWalletStatus()
  
i.e.  To retrive these variables, call: SiaInterface.getRenterFiles().Nickname
  
      

