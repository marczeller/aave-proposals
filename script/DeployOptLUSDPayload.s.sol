// SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

import {GovHelpers} from 'aave-helpers/GovHelpers.sol';
import {OptimismScript, EthereumScript} from 'aave-helpers/../script/Utils.s.sol';
import {AaveV3OPNewListings_20230327} from 'src/AaveV3OPNewListings_20230327/AaveV3OPNewListings_20230327.sol';

contract CreateProposal is EthereumScript {
  function run() external broadcast {
    GovHelpers.Payload[] memory payloads = new GovHelpers.Payload[](1);
    payloads[0] = GovHelpers.buildOptimism(0xF585F8cf39C1ef5353326e0352B9E237f9A52587);
    GovHelpers.createProposal(payloads, 0xfa17ef2b6d70703ca5f2919932559937352590b637cc8f1425bd6615311079a7);
  }
}

contract DeployPayloadOptimism is OptimismScript {
  function run() external broadcast {
    new AaveV3OPNewListings_20230327();
  }
}
