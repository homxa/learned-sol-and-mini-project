// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract Aution {
    struct Item {
        uint256 id;
        string name;
        address payable highestBidder;
        uint256 highestBid;
        bool open;
    }
    mapping(uint256 => Item) public items;
    mapping(uint256 => mapping(address => uint256)) public bids;
    uint256 public itemCount;

    function createBid(string memory _name) public {
        itemCount++;
        items[itemCount] = Item(itemCount, _name, payable(address(0)), 0, true);
    }

    function placeBid(uint256 _id) public payable {
        Item storage item = items[_id];
        require(item.open, "Auction is closed");
        require(msg.value > item.highestBid, 'must be grateer than current bid');

        if(item.highestBidder != address(0)){
            payable(item.highestBidder).transfer(item.highestBid); 
        }

        item.highestBidder = payable(msg.sender) ;
        item.highestBid = msg.value;
    }

      function closeBid(uint _id) public{

Item storage item = items[_id];
require(item.open,'Bid already closed');
item.open = false;

}

function getItem(uint _id) public view returns (Item memory){

    return items[_id];
}
}
 

