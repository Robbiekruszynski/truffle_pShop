pragma solidity >=0.4.22 <0.8.0;

contract Adoption {
    address[16] public adopters;

    //We've defined a single variable: adopters. This is an array of Ethereum addresses. Arrays contain one type and can have a fixed or variable length. In this case the type is address and the length is 16.

    //You'll also notice adopters is public. Public variables have automatic getter methods, but in the case of arrays a key is required and will only return a single value. Later, we'll write a function to return the whole array for use in our UI.

    function adopt(uint256 petId) public returns (uint256) {
        require(petId >= 0 && petId <= 15);
        adopters[petId] = msg.sender;
        return petId;
    }

    //In Solidity the types of both the function parameters and output must be specified. In this case we'll be taking in a petId (integer) and returning an integer.

    // We are checking to make sure petId is in range of our adopters array. Arrays in Solidity are indexed from 0, so the ID value will need to be between 0 and 15. We use the require() statement to ensure the ID is within range.

    // If the ID is in range, we then add the address that made the call to our adopters array. The address of the person or smart contract who called this function is denoted by msg.sender.

    // Finally, we return the petId provided as a confirmation.

    function getAdopters() public view returns (address[16] memory) {
        return adopters;
    }
}

// Since adopters is already declared, we can simply return it. Be sure to specify the return type (in this case, the type for adopters) as address[16] memory. memory gives the data location for the variable.

// The view keyword in the function declaration means that the function will not modify the state of the contract.
