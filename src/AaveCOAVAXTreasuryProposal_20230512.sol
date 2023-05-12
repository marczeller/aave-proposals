// SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

import {AaveV3Avalanche, AaveV3AvalancheAssets} from 'aave-address-book/AaveV3Avalanche.sol';
import {IAdminControlledEcosystemReserve} from 'lib/aave-v3-periphery/contracts/treasury/interfaces/IAdminControlledEcosystemReserve.sol';


/**
 * @title AaveCO retro-funding V3 proposal
 * @author @marczeller - Aave-Chan Initiative
 * @notice This proposal approves the AaveCO treasury to collect approved AVAX & BTC funds from Aave DAO treasury contracts.
 * Governance Forum Post: https://governance.aave.com/t/arc-aave-v3-retroactive-funding/9250
 * Snapshot: https://snapshot.org/#/aave.eth/proposal/bafkreia45d5m6y3o4b476ykp6q65v3zlecxvz6h57tdfhowqm5wb5nzdvq
 */
contract ProposalPayload {

    address public constant AAVE_CO_TREASURY = 0xa8F8E9c54e099c4fADB797f5196E07ce484824aF;
    address public constant AAVE_AVAX_COLLECTOR = AaveV3Avalanche.COLLECTOR;
    address public constant avWAVAX = 0xDFE521292EcE2A4f44242efBcD66Bc594CA9714B;
    address public constant aAvaWAVAX = AaveV3AvalancheAssets.WAVAX_A_TOKEN;
    address public constant avWBTC = 0x686bEF2417b6Dc32C50a3cBfbCC3bb60E1e9a15D;
    address public constant aAvaWBTC = AaveV3AvalancheAssets.WBTCe_A_TOKEN;

    uint256 public constant AMOUNT_avWAVAX = 19_415_700000000000000000;
    uint256 public constant AMOUNT_aAvaWAVAX = 9_584_300000000000000000;
    uint256 public constant AMOUNT_avWBTC = 1_81000000;
    uint256 public constant AMOUNT_aAvaWBTC = 1_08000000;

    function execute() external {

        IAaveEcosystemReserveController(AaveV3Avalanche.COLLECTOR_CONTROLLER).transfer(AAVE_AVAX_COLLECTOR, avWAVAX, AAVE_CO_TREASURY, AMOUNT_avWAVAX);
        IAaveEcosystemReserveController(AaveV3Avalanche.COLLECTOR_CONTROLLER).transfer(AAVE_AVAX_COLLECTOR, aAvaWAVAX, AAVE_CO_TREASURY, AMOUNT_aAvaWAVAX);
        IAaveEcosystemReserveController(AaveV3Avalanche.COLLECTOR_CONTROLLER).transfer(AAVE_AVAX_COLLECTOR, avWBTC, AAVE_CO_TREASURY, AMOUNT_avWBTC);
        IAaveEcosystemReserveController(AaveV3Avalanche.COLLECTOR_CONTROLLER).transfer(AAVE_AVAX_COLLECTOR, aAvaWBTC, AAVE_CO_TREASURY, AMOUNT_aAvaWBTC);
    }
}