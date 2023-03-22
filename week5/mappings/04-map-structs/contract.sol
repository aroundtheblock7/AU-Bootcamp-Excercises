// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Contract {
	struct User {
		uint balance;
		bool isActive;
	}

	mapping(address => User) public users;

	function createUser() external {
		require(!users[msg.sender].isActive);
		//Option 1:
		// users[msg.sender] = User(100, true);

		//Option 2:
		// User storage user = users[msg.sender];
		// user.balance = 100;
		// user.isActive = true;	

		//Option 3:
		users[msg.sender] = User ({
			isActive: true,
			balance: 100
		});
	}
}