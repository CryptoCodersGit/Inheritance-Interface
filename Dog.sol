// SPDX-License-Identifier: MIT
// Author: Crypto Coders
pragma solidity ^0.8.0;

import "./Animal.sol";

// ---------------------------------------------------------
// قرارداد Dog که از Animal ارث‌بری می‌کند
// ---------------------------------------------------------
// سگ یک حیوان است، پس از قرارداد Animal ارث‌بری می‌کند
// فقط تابع speak را بازنویسی می‌کند تا صدای مخصوص سگ را بازگرداند
contract Dog is Animal {

    // بازنویسی (override) تابع speak با خروجی مخصوص سگ
    function speak() public pure override returns (string memory) {
        return "Woof!";
    }
}
