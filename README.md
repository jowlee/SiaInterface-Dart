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
  * Available bool
  * Version   string
- getConsensusStatus()
  * Height       int
  * CurrentBlock [32]byte
  * Target       [32]byte
- getHostStatus() 
  * TotalStorage     int
  * MinFilesize      int
  * MaxFilesize      int
  * MinDuration      int
  * MaxDuration      int
  * WindowSize       int
  * Price            int
  * Collateral       int
  * StorageRemaining int
  * NumContracts     int
- getMinerStatus()
  * Mining         bool
  * State          string
  * Threads        int
  * RunningThreads int
  * Address        [32]byte
- getRenterDownloadQueue()
  * Complete    bool
  * Filesize    uint64
  * Received    uint64
  * Destination string
  * Nickname    string
- getRenterFiles()
  * Available       bool
  * Nickname        String
  * Repairing       bool
  * TimeRemaining   int
- getTransactionpoolTransactions()
  * Transactions []consensus.Transaction
- getWalletAddress()
  * Address string
- getWalletStatus()
  * Balance      int
  * FullBalance  int
  * NumAddresses int
  
i.e.  To retrive these variables, call: SiaInterface.getRenterFiles().Nickname
  
      

