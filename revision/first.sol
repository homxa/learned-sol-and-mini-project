// SPDX-License-Identifier: MIT

pragma solidity 0.8.18;
contract First{


struct UserFavNums{

string name;
uint256 number;

}

UserFavNums[] public listofusers;

mapping(string=> uint256) public username; 

function addusernum(string memory _name,uint256 _num) public{

listofusers.push(UserFavNums(_name,_num));
username[_name] = _num;

}

function getUser(uint256 _num) public view returns(string memory,uint256){
 UserFavNums memory  users   =listofusers[_num];
 return (users.name,users.number);

} 

}