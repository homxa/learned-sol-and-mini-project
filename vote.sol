// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract Votecampaign{

struct Candidtes{

    string name;
    uint256 votecount;
}

Candidtes[] public candidates;

struct Voter{
bool hasVoted;
uint256 votedIndex;

}
mapping(address=> Voter) public voter;
address owner;
constructor(){
    owner = msg.sender;
   
}

modifier  onlyOwner(){

require(msg.sender == owner,'Must be owner');
_;

} 

function addCandidate(string memory _name, uint256 index) public onlyOwner{

    candidates.push(Candidtes(_name,index));
}


function voting(uint256 index) public{
    Voter storage sender = voter[msg.sender];

    require(index < candidates.length,'invalideCandidate');

    require(!sender.hasVoted,'already voted');
    sender.hasVoted = true;
    sender.votedIndex = index;
    candidates[index].votecount +=  1;


}
function getcandidateNums() public view returns(uint256){


    return candidates.length;
}

}