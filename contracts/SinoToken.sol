//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.6.0 <0.8.0;
import "openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";
import "openzeppelin-solidity/contracts/access/Ownable.sol";
import "openzeppelin-solidity/contracts/token/ERC20/ERC20Burnable.sol";
import "hardhat/console.sol";
contract SinoToken is ERC20("SinoToken", "SMT"), ERC20Burnable, Ownable {
    uint256 private cap = 50_000_000_000 * 10 ** uint256(18);
    constructor() {
        console.log("owner: %s maxcap: %s", msg.sender, cap);
        _mint(msg.sender, cap);
        transferOwnership(msg.sender);
    }
    function mint(address to, uint256 amount) public onlyOwner {
        require(ERC20.totalSupply() + amount <= cap, "Floppy: cap exceeded");
        _mint(to, amount);
    }
}
