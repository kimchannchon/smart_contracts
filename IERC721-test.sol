// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IERC721 {    
 
    function balanceOf(address _owner) external view returns (uint256);
    function ownerOf(uint256 _tokenId) external view returns (address);   
    function transferFrom(address _from, address _to, uint256 _tokenId) external;   
}

contract ERC721Test is IERC721 {

    function calc() public view returns(bytes4) {
        return bytes4(keccak256('balanceOf(bytes4)')^
        keccak256('ownerOf(bytes4)')^
        keccak256('transferFrom(bytes4)'));
    }

    function balanceOf(address _owner) public override view returns(uint256) {        
        return 3;
    }
    
    function ownerOf(uint256 _tokenId) public override view returns (address) {
        return msg.sender;
    }

    function transferFrom(address _from, address _to, uint256 _tokenId) public override {
        uint x = 3;
    }
}