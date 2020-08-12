pragma solidity ^0.5.12;

contract MiniBank {

    // the contract owner
    address public owner;
    // the bank accounts mapper
    mapping (address => uint) private accounts;
    // event for deposit log
    event LogDeposit(address indexed accountAddress, uint amount);
    // event for withdraw log
    event LogWithdraw(address indexed withdrawAddress, uint amount);

    constructor()  public {
        // 1. set the owner to your current account 
        // add the code here
    }

    /// Deposit amount into MiniBank
    /// @return User balance after the deposit is made
    function deposit() public payable returns (uint) {
        
        require((accounts[msg.sender] + msg.value) >= accounts[msg.sender]);
        
        // 2. add msg.value to the user account
        // add the code here
       
        
        emit LogDeposit(msg.sender, msg.value); 
        return accounts[msg.sender];
    }

    /// Withdraw amount from MiniBank
    /// @param withdraw amount
    /// @return The ramaining balance 
    function withdraw(uint withdrawAmount) public returns (uint) {
        require(withdrawAmount <= accounts[msg.sender]);
        // 3. decrease user balance
        // add the code here
        
        msg.sender.transfer(withdrawAmount);
        
        // 4. emit LogWithdraw event
        // add the code here
       
        return accounts[msg.sender];
    }

    /// @return The user balance
     function balance() view public returns (uint) {
        return accounts[msg.sender];
    }
}
