// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import {WithChainIdValidation} from './WithChainIdValidation.sol';
import {GovHelpers} from 'aave-helpers/GovHelpers.sol';

contract CreateMainnetProposal is WithChainIdValidation {
  constructor() WithChainIdValidation(1) {}
}

contract ARBWSTETHProposal is CreateMainnetProposal {
  bytes32 internal IPFS_HASH = 0x88483d979386f2743b5801e8875b6157d4ff776ca89e45173a5da22229b816a4;

  function run() external {
    GovHelpers.Payload[] memory payloads = new GovHelpers.Payload[](1);
    payloads[0] = GovHelpers.buildArbitrum(
      0xCDB9ea7F9443fA9e8ba6EBC9Ef41C3ed75939663
    );
    vm.startBroadcast();
    GovHelpers.createProposal(
      payloads,
      IPFS_HASH
    );
    vm.stopBroadcast();
  }
}
