
pragma solidity ^0.5.0;

contract Storage {


address[] public owners;
     
       
       /*
      struct Transaction {
            address destination;
            uint value;
           string tranType;
            bool executed;
            uint confirmCount;
            string currentState;
            uint256 creationDate;
    }
    */
    
      struct Transaction {
            address destination;
            uint value;
            string tranType;
            bool executed;
            uint confirmCount;
            uint rejectCount;
            string currentState;
            uint256 creationDate;
            uint256 transferDate;
      }
    
    //Other data structs.
    
    //registered users
    address[] regUsers;
    
    //check for registered users
    mapping(address => bool) isRegUser;
    
    //max num of users
    uint maxNumOfUsers = 32;
    
    //money deposited by each account
    mapping(address => uint) tokensDeposited;
    
    //to check for the owner
    mapping (address => bool) public isOwner;
    
    //its current value be used as a transaction id
    uint public transactionCount=100;
    
    //max no of wei
    uint256 maxWEI = 32000000000000000000;   //equivalent to 32 ethers
    
    //current no,. of wei
    uint256 curWEI = 0;
    
    // transaction related data structs
 
     //all transactionids (corresponds to the withdrawal request)
    uint[] newtrxids;
    
    //between txid and Transaction struct
    mapping (uint => Transaction) public transactions;
    
    //between txid and address,to know who has confirmed the transactions.
    mapping(uint => address[]) scores; 
    
    //storing addresses of users whoever has confirmed the transaction.
    mapping(uint => address[]) confirmedTxToAddrMapping;
    
    //storing addresses of users whoever has confirmed the transaction.
    mapping(uint => address[]) rejectedTxToAddrMapping;
    
    //mapping between user and the most recent withdrawal request.
    mapping(address => Transaction) recentWithdrawRequest;
    
    mapping(address => mapping(uint => bool)) hasConfirmed;
    
    //adding addr that rejected the transaction.
      //  rejectedTxToAddrMapping[txid].push(msg.sender);
 
}