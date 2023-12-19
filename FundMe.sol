// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;


import {PriceConverter} from "./PriceConverter.sol";


error NotOwner();

contract FundMe {
    using PriceConverter for uint256;
    uint256 public constant MIN_USD = 5 * 1e18;
    address[] public funders;
    mapping(address funder => uint256 amountFunded) public addressToAmountFunded;

    address immutable owner;

    constructor() {
        owner = msg.sender;
    }
    
    receive() external payable {
        fund();
    }


    fallback() external payable {
        fund();
    }

    function fund() public payable{
        //require(getConversionRate(msg.value) >= MIN_USD , "NOT ENOUGH ETH");
        //using library:
        require(msg.value.getConversionRate() >= MIN_USD, "NOT ENOUGH ETH");
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] += msg.value;

    } 

    function withdraw() public onlyOwner{
        for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++) {
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }
        funders = new address[](0);
        //cast to payable to be able to use transfer. Transfer throws error. To keep in execution send is better since it returns a boolean
        //payable(msg.sender).transfer(address(this).balance);
        //bool sendSuccess =  payable(msg.sender).send(address(this).balance);
        //in this way we revert the function since it failed.
        //require(sendSuccess, "withdrawal failed"); 

        (bool callSucces, ) = payable(msg.sender).call{
            value: address(this).balance
        }("");
        require(callSucces, "CalledFailed");

    }

    

    modifier onlyOwner() {
        if(msg.sender != owner) {
            revert NotOwner();
        }
       //require(msg.sender == owner, "Address is not owner");
        _;
    }

}

