// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import 'forge-std/Test.sol';
import {AaveV3Avalanche, AaveV3AvalancheAssets} from 'aave-address-book/AaveV3Avalanche.sol';
import {AaveV3AvaxretrofundingPayload} from '../../contracts/mainnet/AaveV3AvaxretrofundingPayload.sol';
import {AaveV3Helpers, ReserveConfig, ReserveTokens, IERC20} from '../../../lib/aave-helpers/AaveV3Helpers.sol';

contract AaveV3PolCapsPayloadTest is Test {
  using stdStorage for StdStorage;
  AaveV3AvaxretrofundingPayload public proposalPayload;

  address public constant WBTCe = AaveV3AvalancheAssets.WBTCe_UNDERLYING;
  address public constant aAvaWBTC = AaveV3AvalancheAssets.WBTCe_A_TOKEN;
  address public constant GUARDIAN_AVALANCHE = 0xa35b76E4935449E33C56aB24b23fcd3246f13470;
  address public constant CURRENT_ACL_SUPERADMIN = 0x4365F8e70CF38C6cA67DE41448508F2da8825500;


  function setUp() public {
    vm.createSelectFork(vm.rpcUrl('avalanche'), 26963792);
  }
}
