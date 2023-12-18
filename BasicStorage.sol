//SPDX-License-Identifier: MIT
pragma solidity 0.8.19; // stating solidity version

//pragma solidity ^0.8.18 means it will work with the version stated and all the newers
//in our case only will work with 0.8.18
//Also can define ranges: pragma solidity >=0.8.18 <0.9.0

    /*
        We can set up our favoriteNumber and read it using the new function and leaving default visibility
    */
contract SimpleStorage {
    
        uint256 favoriteNumber256; //0 now visibility changed
        function store(uint256 _favoriteNumber) public {
            favoriteNumber256 = _favoriteNumber;
        }
        function retrieve() public view returns(uint256) {
            retrun favoriteNumber256;
        }
}
