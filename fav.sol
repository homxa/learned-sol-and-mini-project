// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract UserFavnumber{
struct NewUsers{
 string name;
 uint256 num;

}
mapping(string=> uint256) public getuserFavNum;
NewUsers[] public listofUsers;

function addnewUsers(string memory _name, uint256 _num)public{
listofUsers.push(NewUsers(_name,_num));
getuserFavNum[_name] = _num;









}


}