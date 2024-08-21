// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TokenVesting {
    struct VestingSchedule {
        uint start;
        uint duration;
        uint totalAmount;
        uint released;
    }

    mapping(address => VestingSchedule) public vestingSchedules;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function createVestingSchedule(address _beneficiary, uint _start, uint _duration, uint _totalAmount) public {
        require(msg.sender == owner, "Only owner can create vesting schedules.");
        vestingSchedules[_beneficiary] = VestingSchedule(_start, _duration, _totalAmount, 0);
    }

    function release() public {
        VestingSchedule storage schedule = vestingSchedules[msg.sender];
        require(block.timestamp > schedule.start, "Vesting period has not started.");
        uint vestedAmount = (block.timestamp - schedule.start) * schedule.totalAmount / schedule.duration;
        uint releasable = vestedAmount - schedule.released;
        require(releasable > 0, "No tokens to release.");

        schedule.released += releasable;
        payable(msg.sender).transfer(releasable);
    }

    function getVestingSchedule(address _beneficiary) public view returns (VestingSchedule memory) {
        return vestingSchedules[_beneficiary];
    }
}
