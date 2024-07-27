// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;


contract  FallBack{

uint256 public  numbers;



// the recive is use for taking action when a user send eth direct to our contract with out using our founction

receive() external payable { 

numbers = 1;

}
//when a user try to call a function that is not in our function. then the fallback will execute

fallback() external payable {

    numbers = 2;
 }



}