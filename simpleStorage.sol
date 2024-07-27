// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;
//we import userfavnumber file in here
import {UserFavnumber} from   './fav.sol';
contract StorageFactory{
    //here we are creating type of userfavnumber just like struct
UserFavnumber[] public userFavNums;
function createSimpleStorageContract()public{
    // to deploy a contract by another one we need to add the new in front of it

    UserFavnumber newuserNum  = new  UserFavnumber();
    
userFavNums.push(newuserNum);
}

function sfstore(string memory _name, uint256 _num) public{
//the contract that is been deploy and stored above we accecss it and use the functions in that contract
UserFavnumber myfavNumber = userFavNums[0];
myfavNumber.addnewUsers(_name, _num);

}
function getUsers(string memory _name) public view returns(uint256){
//the contract that is been deploy and stored above we accecss it and use the functions in that contract

UserFavnumber myfavNumber = userFavNums[0];
 return myfavNumber.getuserFavNum(_name);


}


  
}