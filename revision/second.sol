
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
import {First} from './first.sol';

contract Second{


    First[] internal deployArray;


    function deploy() public {
First first = new First();
deployArray.push(first);

    }

    function add(string memory _name, uint256 _num) public{
First first = deployArray[0];
first.addusernum(_name, _num);


    }

    function get(uint256 _num) public view returns(string memory,uint256) {

First first = deployArray[0];
  
 return first.getUser(_num);

    }
}