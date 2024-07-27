// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;
import {PriceConverter} from './priceconverter.sol';


// check only oneOwner modifier belkwo for more info
error NotOwner();

contract FundMe{

    using PriceConverter for uint256;
address[]  public founders;
    uint256 minimuvalue = 5e18;
mapping(address=> uint256) public usersFunder;
// payable allow the function to deal with money of crypto stuff

function fund() public payable {



// allow users to send $
// have minimum $ to be sent
//the require check if the amount is not grater than 1eth then i alart the user and refund them back

//it will also undo every action the function has done
//if it is grater that then the transact will work

//msg= give us in fo about what the user is tying to send, the gas fee they paid and others

// msg.value return a uint256 so it can called conversion rate and pass the value of us authomatically
//if the conversionrate accept 2 params then only the second value you will have to put manually
require(msg.value.conversionRate() >  minimuvalue,'you dont fav enthoug ETH to send'); // 1e18 = 1ETH = 1000000000000000000 wei
founders.push(msg.sender);
//msg.sender hold the user wallet address
usersFunder[msg.sender] += msg.value;

}

address public owner;

//contructor is a function that is call right when the contract is deployed

constructor(){
  //msg sender= the addresss of the deplyer
owner = msg.sender;


}

function withdraw()public onlyowner{

for(uint256 founderIndex = 0; founderIndex < founders.length;  founderIndex ++){
 address founder = founders[founderIndex];
  usersFunder[founder] = 0;
  }



  founders = new address[](0); 

  // to transfer
//transfer will automatica;;y revert if the trafer fails

  //payable (msg.sender).transfer(address(this).balance);
  // to send
//send  will not  automatica;;y revert if the send  fails
// it return boolean if it faild, that why we have to add the require to revrt if failed



 //bool sendStatus = payable(msg.sender).send(address(this).balance);

//require is use for reverting transaction if false

//require(sendStatus,'send failed');
//call  can be use to call any eth functinon
//call return to values one is boolean other is the value from the function called


// revert does same thing as require but it does not accept params

(bool callSuccess, ) = payable (msg.sender).call{value: address(this).balance}('');

require(callSuccess, 'sending faild');
// same as


// if(!callSuccess){
//   revert();
// }
  }

// similar to express midillerware
//we have to call it after the function name and public  keyword
modifier  onlyowner(){
// _; == if we put it at the top it means the function that we call it with will first exsecute,
// vise-visa if we call it bellow
require(msg.sender == owner,'must be woner');

_;


// if you use  if stattement and the error notOwenr and revert it will save us some gas


// if(msg.sender != owner){
//   revert  NotOwner();
// }

}
//when a user send eth to our contract with out calling the fund function 
receive() external payable { 


fund();


}


fallback() external payable { 
fund();

}

}             