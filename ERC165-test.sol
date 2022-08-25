pragma solidity >= 0.7.0 < 0.9.0;

interface IERC165 {
    function supportsInterface(bytes4 interfaceId) external view returns(bool);
    //function balanceOf(address _owner) external view returns(uint256);
}

contract ERC165 is IERC165 {
    // a byte caculation interface function
    function calFingerPrint() public view returns(bytes4) {
        return bytes4(keccak256('supportsInterface(bytes4)'));
        // return bytes4(keccak256('supportsInterface(bytes4)')^
        // keccak256('balanceOf(bytes4)'));

        // 0: bytes4: 0x8b81fe23
    }

    // hash table to keep track of contract fingerprint data of byte function conversion
    mapping(bytes4 => bool) private _supportedInterfaces;

    function supportsInterface(bytes4 interfaceId) external override view returns(bool) {
        return _supportedInterfaces[interfaceId];
    }

    constructor() {
        _registerInterface(0x01ffc9a7);
    }

    function _registerInterface(bytes4 interfaceId) public {
        require(interfaceId != 0xffffffff, 'ERC165: Invalid Interface');
        
        _supportedInterfaces[interfaceId] = true;
    }

    // add a function as an exxample for XOR
    //function balanceOf(address _owner) external override view returns(uint256) {
    //    return 5;
    //}
}