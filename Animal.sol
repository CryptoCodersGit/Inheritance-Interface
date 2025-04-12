// SPDX-License-Identifier: MIT
// Author: Crypto Coders
pragma solidity ^0.8.0;

import "./IAnimal.sol";

// ---------------------------------------------------------
// قرارداد پایه Animal که رابط IAnimal را پیاده‌سازی می‌کند
// ---------------------------------------------------------
// این قرارداد یک کلاس پایه برای حیوانات است که می‌تواند توسط حیوانات خاص مانند سگ، گربه و ... ارث‌بری شود.
contract Animal is IAnimal {
    
    // متد speak صدا زدن حیوان را برمی‌گرداند
    // با virtual علامت‌گذاری شده تا در قراردادهای فرزند (مثل Dog) بازنویسی شود
    function speak() public virtual returns (string memory) {
        return "Some sound"; // صدای پیش‌فرض
    }

    // پیاده‌سازی تابع move که در رابط IAnimal تعریف شده بود
    // چون در رابط وجود دارد، باید override شود
    function move() external pure override returns (string memory) {
        return "Moving...";
    }
}
