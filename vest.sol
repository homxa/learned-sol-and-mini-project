// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract Vesting{

address immutable owner;

struct VestingShecdule{

uint start;
uint duration;
uint totalAmount;
uint released;

 }


mapping(address=> VestingShecdule) public vestingshecdule;

constructor(){
 owner = msg.sender;


}

modifier onlyAdmin(){

require(owner == msg.sender,'only admin can creae a vesting schedule');
_;

}

uint  private currentTime = block.timestamp;

function createVestingSchedule(address _userAdd, uint start,uint duration,uint totalAmount, uint realeased) public onlyAdmin{
    vestingshecdule[_userAdd] = VestingShecdule(start,duration,totalAmount,realeased);
}

function release(address _useradd) public {

VestingShecdule storage userVested = vestingshecdule[_useradd];

require(block.timestamp > userVested.start,' vesting have not yet started');

uint256  vestedAmount  = (block.timestamp - userVested.start) * userVested.totalAmount /userVested.duration;
 uint releasable = vestedAmount - userVested.released;

 require(releasable > 0,'insuffienct found');
 userVested.released += releasable;
(bool callSuccess, ) = payable (msg.sender).call{value: releasable}('');
 
 require(callSuccess,'Faild to withdraw ');

}


function getVest(address _add) public view returns (VestingShecdule memory){
 return  vestingshecdule[_add];


}

}