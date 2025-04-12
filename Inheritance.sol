// SPDX-License-Identifier: MIT
// Author: Crypto Coders

pragma solidity ^0.8.0;

/*
    ساختار ارث‌بری در این پروژه به شکل زیر است:

        A
       / \
      B   C
     / \ / 
    F  D,E

    - این ساختار شامل چند قرارداد است که به صورت سلسله‌مراتبی از یکدیگر ارث‌بری می‌کنند.
    - هدف این مثال نشان دادن نحوه‌ی مدیریت توابع `override` و `super` در ارث‌بری چندگانه (Multiple Inheritance) است.
*/

// -----------------------------
// قرارداد پایه A
// -----------------------------
contract A {
    // تابع foo در این قرارداد به صورت virtual تعریف شده
    // تا قراردادهای فرزند بتوانند آن را بازنویسی (override) کنند
    function foo() public pure virtual returns (string memory) {
        return "A";
    }
}

// -----------------------------
// قرارداد B از A ارث‌بری می‌کند
// -----------------------------
contract B is A {
    // اینجا تابع foo از A را override می‌کنیم
    function foo() public pure virtual override returns (string memory) {
        return "B";
    }
}

// -----------------------------
// قرارداد C هم از A ارث‌بری می‌کند
// -----------------------------
contract C is A {
    // C هم تابع foo را override می‌کند
    function foo() public pure virtual override returns (string memory) {
        return "C";
    }
}

// -----------------------------
// قرارداد D از B و C ارث‌بری می‌کند
// -----------------------------
// چون هم B و هم C تابع foo را بازنویسی کرده‌اند، D باید مشخص کند که کدام یک را استفاده کند
// بنابراین از override(B, C) استفاده شده است
contract D is B, C {
    function foo() public pure override(B, C) returns (string memory) {
        // super.foo() در اینجا طبق ترتیب ارث‌بری (C آخرین ارث‌گیرنده) تابع C را صدا می‌زند
        return super.foo(); // "C"
    }
}

// -----------------------------
// قرارداد E نیز دقیقاً مانند D از B و C ارث‌بری می‌کند
// -----------------------------
contract E is B, C {
    function foo() public pure override(B, C) returns (string memory) {
        // اینجا نیز super به ترتیب ارث‌بری نگاه می‌کند: C آخرین در لیست است
        return super.foo(); // "C"
    }
}

// -----------------------------
// قرارداد F از A و B ارث‌بری می‌کند
// -----------------------------
// توجه: چون B خودش از A ارث‌بری کرده، ترتیب ارث‌بری باید از عمومی‌ترین (A) به خصوصی‌ترین (B) باشد
contract F is A, B {
    function foo() public pure override(A, B) returns (string memory) {
        // super.foo() در اینجا به تابع foo در B اشاره می‌کند
        return super.foo(); // "B"
    }
//تابع والد که صرفا ویژگی نام خانوادگی دارد
// از طریق سازنده ان را مقدار دهی میکنیم
contract Parents{
    string public  lastname;
    constructor(string memory _LastName){
        lastname =_LastName;
    }
}
//تابع فرزند که از والد ارث بری کرده و ویژگی های خود را نیز دارد
contract Child is Parents("babaki") {
    function  Firstname() public pure returns(string memory){ return "ali"; }
}

}
