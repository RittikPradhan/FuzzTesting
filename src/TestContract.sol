//SPDX-LIcense-Identifier: None

pragma solidity 0.8.17;

contract TestContract {

    mapping(address => uint256) private balances;

    event Added(address, uint256);
    event Withdrawn(address, uint256);

    function getBalance(address user) external view returns (uint256) {
        return balances[user];
    }

    function add(address user) external payable {
        balances[user] += msg.value;
        emit Added(user, msg.value);
    } 

    function withdraw(address user, uint256 amount) external {
        require(balances[user] >= amount);
        balances[user] -= amount;
        (bool success, ) = payable(user).call{value: amount}("");
        require(success, "failed");
    }
}