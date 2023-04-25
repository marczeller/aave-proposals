// SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;
import {EthereumScript} from 'aave-helpers/ScriptUtils.sol';
import {GovHelpers} from 'aave-helpers/GovHelpers.sol';
import {AaveV3RiskParams_20230516} from 'src/AaveV3RiskParams_20230516/AaveV3RiskParams_20230516.sol';

contract DeployMainnetACIPayload is EthereumScript {
  function run() external broadcast {
    new AaveV3RiskParams_20230516();
  }
}

contract ACIPayloadProposal is EthereumScript {
  function run() external broadcast {
    GovHelpers.Payload[] memory payloads = new GovHelpers.Payload[](1);
    payloads[0] = GovHelpers.buildMainnet(
      0x8AFB5A7EC013fe08C36eFC9B3B48AFed9D53D901
    );
    GovHelpers.createProposal(
      payloads,
      0x899a2100c271e4cae958d3af62e74717ed2662dbd8ac6ffdc17c4d126ba966ec
    );
  }
}
