pragma solidity ^0.5.10;

// based on the skeleton file TicTacToe.sol by
// https://github.com/spidfire

contract TicTacToe {
  uint[] board = new uint[](9);
  address player1;
  address player2;
  uint whoseTurn = 1;
  bool full = false;

  constructor() public{
    player1 = msg.sender;
  }

  function joinGame() public {
    require(!full);
    player2 = msg.sender;
    full = true;
  }

  function doMove(uint _place) public returns (uint){

    uint winner = checkWinner();
    if(winner == 1){
      return 1;
    }
    if (winner == 2){
      return 1;
    }
    // correct users is on turn
    if(whoseTurn == 1){
      if(msg.sender != player1) return 2;
    }else if(whoseTurn == 2){
      if(msg.sender != player2) return 2;
    }

    // is on the board
    if(_place < 0 || _place >= 9) return 3;

    // Is not already set
    if(board[_place] != 0) return 4;

    board[_place] = whoseTurn;
    whoseTurn = 3 - whoseTurn;

    return 0;
  }



  uint[][]  tests = [[0,1,2],[3,4,5],[6,7,8], [0,3,6],[1,4,7],[2,5,8], [0,4,8],[2,4,6]  ];
  // 0 1 2
  // 3 4 5
  // 6 7 8
  function checkWinner() public view returns (uint){
    for(uint i =0; i < 8;i++){
      uint[] memory b = tests[i];
      if(board[b[0]] != 0 && board[b[0]] == board[b[1]] && board[b[0]] == board[b[2]]) return board[b[0]];
    }

    return 0;
  }

  function currentState() public view returns(string memory, string memory) {
    string memory text = "No winner yet";
    uint winner = checkWinner();
    if(winner == 1){
      text = "Winner is X";
    }
    if (winner == 2){
      text = "Winner is O";
    }
    
    bytes memory out = new bytes(11);
    byte[] memory signs = new byte[](3);
    signs[0] = "-";
    signs[1] = "X";
    signs[2] = "O";
    bytes(out)[3] = "\n";
    bytes(out)[7] = "\n";

    for(uint i =0; i < 9;i++){
      bytes(out)[i + i/3] = signs[board[i]];

    }

    return (text, string(out));
  }

}
