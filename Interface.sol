// SPDX-License-Identifier: MIT
// Author: Crypto Coders

pragma solidity ^0.8.0;

// ------------------------------------------------------
// قرارداد ساده Counter که یک شمارنده دارد
// ------------------------------------------------------
contract Counter {
    // متغیر عمومی که مقدار شمارنده را نگه می‌دارد
    uint256 public count;

    // تابعی برای افزایش مقدار شمارنده به اندازه 1
    // این تابع external است یعنی فقط از بیرون قرارداد می‌توان آن را صدا زد
    function increment() external {
        count += 1;
    }
}

// ------------------------------------------------------
// تعریف یک رابط (Interface) از قرارداد Counter
// ------------------------------------------------------
// Interface فقط امضای توابع را نگه می‌دارد (بدون بدنه).
// اینترفیس اجازه می‌دهد بدون دسترسی به کد کامل قرارداد اصلی، فقط با آدرس آن قرارداد تعامل کنیم.
// کاربرد رایج آن زمانی است که بخواهیم با قراردادهای دیگر (مثلاً ERC20 یا قراردادهای خارجی) تعامل داشته باشیم.
interface ICounter {
    // فقط تعریف تابع‌های مورد نیاز (بدون پیاده‌سازی)
    // امکان استفاده از سازنده درون رابط امکان پذیر نیست
    // توابع باید فقط از نوع external باشند
    function count() external view returns (uint256);
    function increment() external;
}

// ------------------------------------------------------
// قرارداد MyContract که با استفاده از Interface با Counter تعامل می‌کند
// ------------------------------------------------------
contract MyContract {
    // متغیری از نوع ICounter تعریف می‌کنیم که به یک قرارداد Counter اشاره می‌کند
    ICounter public counter;

    // سازنده قرارداد، آدرس یک قرارداد Counter را دریافت می‌کند
    // و آن را به عنوان یک ICounter ذخیره می‌کند
    constructor(address _counter) {
        // در اینجا تبدیل آدرس به نوع ICounter انجام می‌شود
        counter = ICounter(_counter);
    }

    // تابعی که تابع increment از قرارداد Counter را صدا می‌زند
    // از طریق رابط (interface) این کار انجام می‌شود
    function incrementCounter() external {
        counter.increment();
    }

    // تابعی برای خواندن مقدار شمارنده از قرارداد Counter
    // با استفاده از متد count موجود در رابط
    function getCount() external view returns (uint256) {
        return counter.count();
    }
}
