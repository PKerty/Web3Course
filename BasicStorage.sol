//SPDX-License-Identifier: MIT
pragma solidity 0.8.19; // stating solidity version

//pragma solidity ^0.8.18 means it will work with the version stated and all the newers
//in our case only will work with 0.8.18
//Also can define ranges: pragma solidity >=0.8.18 <0.9.0

    /*
        We stopped using the array and the struct to actually use a mapping, where the key is the name and the
        value is it's favoriteNumber.
    */
contract SimpleStorage {

    //when mapping doesn't find the Key, it returns the default value of the Value type 
    mapping(string => uint256) public nameToFavoriteNumber;

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }

    uint256 myFavoriteNumber256; //0 now visibility changed

    function store( uint256 _favoriteNumber ) public {
        myFavoriteNumber256 = _favoriteNumber;
    }

    function retrieve() public view returns(uint256) {
        return myFavoriteNumber256;
    }
}
