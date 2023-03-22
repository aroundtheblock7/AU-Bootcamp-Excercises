// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

contract Contract {
	enum Choices { Yes, No }
	
	struct Vote {
		Choices choice;
		address voter;
	}

	Vote none = Vote(Choices(0), address(0));

	Vote[] public votes; 

	function createVote(Choices choice) external {
		require(!hasVoted(msg.sender));
		votes.push(Vote(choice, msg.sender));
	}

	function findVote(address voter) internal view returns(Vote storage) {
		for(uint i = 0; i < votes.length; i++) {
			if(votes[i].voter == voter) {
				return votes[i];
			}
		}
		return none;
	}

	function hasVoted(address voter) public view returns(bool) {
		return findVote(voter).voter == voter;
	}

	function hasVoted2(address _address) external view returns (bool isIndeed) {
		for(uint i=0; i<votes.length; i++) {
			if(votes[i].voter == _address) {
				return votes[i].voter == _address;
			}
		}
	}

	function findChoice(address voter) external view returns(Choices) {
		return findVote(voter).choice;
	}

	function findChoice2(address _address) external view returns (Choices choice) {
		for(uint i=0; i<votes.length; i++) {
			if(votes[i].voter == _address) {
				return votes[i].choice;
			}
		}
	}

	function changeVote(Choices choice) external {
		Vote storage vote = findVote(msg.sender);
		require(vote.voter != none.voter);
		vote.choice = choice;
	}
}