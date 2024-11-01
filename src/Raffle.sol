// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity >=0.8.0;


/**
 * @title Raffle contract
 * @author Khoi Tran
 * @notice Create a simple raffle
 * @dev Implements Chainlink VRFv2.5
 */ 
// import {VRFConsumerBaseV2Plus} from "@chainlink/contracts/src/v0.8/vrf/dev/VRFConsumerBaseV2Plus.sol";
// import {VRFV2PlusClient} from "@chainlink/contracts/src/v0.8/vrf/dev/libraries/VRFV2PlusClient.sol";

contract Raffle {
  error SendMoreToEnterRaffle();
  uint256 private immutable i_entranceFee;
  address payable[] private s_players;
  uint256 private immutable i_interval;
  uint256 private s_lastTimeStamp;

  // Events:
  event RaffleEntered(address indexed player);
  constructor(uint256 entranceFee, uint256 interval) {
    i_entranceFee = entranceFee;
    i_interval = interval;
    s_lastTimeStamp = block.timestamp;
  }

  function enterRaffle() payable external {
    // require(msg.value >= i_entranceFee, 'Not enought ETH sent!');
    if (msg.value < i_entranceFee) {
      revert SendMoreToEnterRaffle();
    }
    s_players.push(payable(msg.sender));
    emit RaffleEntered(msg.sender);
  }

  function pickWinner() public {
    if ((block.timestamp - s_lastTimeStamp) < i_interval) {
      revert();
    }
    // requestId = s_vrfCoordinator.requestRandomWords(
    //   VRFV2PlusClient.RandomWordsRequest({
    //     keyHash: s_keyHash,
    //     subId: s_subscriptionId,
    //     requestConfirmations: requestConfirmations,
    //     callbackGasLimit: callbackGasLimit,
    //     numWords: numWords,
    //     extraArgs: VRFV2PlusClient._argsToBytes(
    //       VRFV2PlusClient.ExtraArgsV1({nativePayment: false})
    //     )
    //   })
    // );
    // get or random number
  }
  
  function getEntranceFee() external returns(uint256) {
    return i_entranceFee;
  }
}