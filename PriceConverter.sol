//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

library PriceConverter {

    function getPrice() internal view returns(uint256) {
        // ETH/USD Sepolia-ETH Contract address: 0x694AA1769357215DE4FAC081bf1f309aDC325306
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (, uint256 price, , , ) = priceFeed.latestRoundData();

        //we need our price to have same amount of decimals as msg.value, since the latter has 18 decimals and price has only 8, we can do the following
        return uint256(price * 1e10);

    }

    function getConversionRate(uint256 ethAmount) internal view returns(uint256){
        uint256 ethPrice = getPrice();
        //ALWAYS MULTIPLY FIRST ALSO TAKE INTO ACCOUNT HOW MANY DECIMALS UR NUMBERS HAVE
        return  (ethPrice * ethAmount) / 1e18;

    }
}
