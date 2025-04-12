// SPDX-License-Identifier: MIT
// Author: Crypto Coders
pragma solidity ^0.8.0;

// ---------------------------------------------------------
// رابط (Interface) برای حیوانات
// ---------------------------------------------------------
// در اینجا یک interface به نام IAnimal تعریف شده که فقط امضای یک تابع دارد.
// اینترفیس برای تعریف "رفتار مورد انتظار" از کلاس‌هایی مثل Animal استفاده می‌شود.
// تمام قراردادهایی که از اینترفیس IAnimal استفاده می‌کنند، باید تابع move را پیاده‌سازی کنند.
interface IAnimal {
    function move() external returns (string memory);
}
