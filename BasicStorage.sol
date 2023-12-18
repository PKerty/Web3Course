//SPDX-License-Identifier: MIT
pragma solidity 0.8.19; // stating solidity version

//pragma solidity ^0.8.18 means it will work with the version stated and all the newers
//in our case only will work with 0.8.18
//Also can define ranges: pragma solidity >=0.8.18 <0.9.0

    /*
        Created person struct and defined some friends.
    */
contract SimpleStorage {

    struct Person {
        uint256 favoriteNumber256;
        string name;
    }

    Person public Patrick = Person(7, "Patrick"); //asuming creation with fields defined in order

    Person public Patty = Person({ //declaration explicitly relating value to Field
        favoriteNumber256: 7,
        name: "Patty"
    });

    uint256 myFavoriteNumber256; //0 now visibility changed

    function store( uint256 _favoriteNumber ) public {
        myFavoriteNumber256 = _favoriteNumber;
    }

    function retrieve() public view returns(uint256) {
        return myFavoriteNumber256;
    }
}
