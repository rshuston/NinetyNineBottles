//
//  NumberConverterTests.swift
//  NinetyNineBottlesTests
//
//  Created by Robert Huston on 8/4/21.
//

import XCTest
@testable import NinetyNineBottles

class NumberConverterTests: XCTestCase {

    // MARK: - Single Digit
    
    func test_GeneratesSingleDigit_0() throws {
        let result = NumberConverter.toPhrase(number: 0)
        XCTAssertEqual(result, "")
    }
    
    func test_GeneratesSingleDigit_1() throws {
        let result = NumberConverter.toPhrase(number: 1)
        XCTAssertEqual(result, "one")
    }
    
    func test_GeneratesSingleDigit_2() throws {
        let result = NumberConverter.toPhrase(number: 2)
        XCTAssertEqual(result, "two")
    }
    
    func test_GeneratesSingleDigit_3() throws {
        let result = NumberConverter.toPhrase(number: 3)
        XCTAssertEqual(result, "three")
    }
    
    func test_GeneratesSingleDigit_4() throws {
        let result = NumberConverter.toPhrase(number: 4)
        XCTAssertEqual(result, "four")
    }
    
    func test_GeneratesSingleDigit_5() throws {
        let result = NumberConverter.toPhrase(number: 5)
        XCTAssertEqual(result, "five")
    }
    
    func test_GeneratesSingleDigit_6() throws {
        let result = NumberConverter.toPhrase(number: 6)
        XCTAssertEqual(result, "six")
    }
    
    func test_GeneratesSingleDigit_7() throws {
        let result = NumberConverter.toPhrase(number: 7)
        XCTAssertEqual(result, "seven")
    }
    
    func test_GeneratesSingleDigit_8() throws {
        let result = NumberConverter.toPhrase(number: 8)
        XCTAssertEqual(result, "eight")
    }
    
    func test_GeneratesSingleDigit_9() throws {
        let result = NumberConverter.toPhrase(number: 9)
        XCTAssertEqual(result, "nine")
    }

    // MARK: - Double Digit
    
    func test_GeneratesDoubleDigit_10() throws {
        let result = NumberConverter.toPhrase(number: 10)
        XCTAssertEqual(result, "ten")
    }
    
    func test_GeneratesDoubleDigit_11() throws {
        let result = NumberConverter.toPhrase(number: 11)
        XCTAssertEqual(result, "eleven")
    }
    
    func test_GeneratesDoubleDigit_12() throws {
        let result = NumberConverter.toPhrase(number: 12)
        XCTAssertEqual(result, "twelve")
    }
    
    func test_GeneratesDoubleDigit_13() throws {
        let result = NumberConverter.toPhrase(number: 13)
        XCTAssertEqual(result, "thirteen")
    }
    
    func test_GeneratesDoubleDigit_14() throws {
        let result = NumberConverter.toPhrase(number: 14)
        XCTAssertEqual(result, "fourteen")
    }
    
    func test_GeneratesDoubleDigit_15() throws {
        let result = NumberConverter.toPhrase(number: 15)
        XCTAssertEqual(result, "fifteen")
    }
    
    func test_GeneratesDoubleDigit_16() throws {
        let result = NumberConverter.toPhrase(number: 16)
        XCTAssertEqual(result, "sixteen")
    }
    
    func test_GeneratesDoubleDigit_17() throws {
        let result = NumberConverter.toPhrase(number: 17)
        XCTAssertEqual(result, "seventeen")
    }
    
    func test_GeneratesDoubleDigit_18() throws {
        let result = NumberConverter.toPhrase(number: 18)
        XCTAssertEqual(result, "eighteen")
    }
    
    func test_GeneratesDoubleDigit_19() throws {
        let result = NumberConverter.toPhrase(number: 19)
        XCTAssertEqual(result, "nineteen")
    }

    func test_GeneratesDoubleDigit_20() throws {
        let result = NumberConverter.toPhrase(number: 20)
        XCTAssertEqual(result, "twenty")
    }

    func test_GeneratesDoubleDigit_21() throws {
        let result = NumberConverter.toPhrase(number: 21)
        XCTAssertEqual(result, "twenty one")
    }

    func test_GeneratesDoubleDigit_22() throws {
        let result = NumberConverter.toPhrase(number: 22)
        XCTAssertEqual(result, "twenty two")
    }

    func test_GeneratesDoubleDigit_23() throws {
        let result = NumberConverter.toPhrase(number: 23)
        XCTAssertEqual(result, "twenty three")
    }

    func test_GeneratesDoubleDigit_24() throws {
        let result = NumberConverter.toPhrase(number: 24)
        XCTAssertEqual(result, "twenty four")
    }

    func test_GeneratesDoubleDigit_25() throws {
        let result = NumberConverter.toPhrase(number: 25)
        XCTAssertEqual(result, "twenty five")
    }

    func test_GeneratesDoubleDigit_26() throws {
        let result = NumberConverter.toPhrase(number: 26)
        XCTAssertEqual(result, "twenty six")
    }

    func test_GeneratesDoubleDigit_27() throws {
        let result = NumberConverter.toPhrase(number: 27)
        XCTAssertEqual(result, "twenty seven")
    }

    func test_GeneratesDoubleDigit_28() throws {
        let result = NumberConverter.toPhrase(number: 28)
        XCTAssertEqual(result, "twenty eight")
    }

    func test_GeneratesDoubleDigit_29() throws {
        let result = NumberConverter.toPhrase(number: 29)
        XCTAssertEqual(result, "twenty nine")
    }

    func test_GeneratesDoubleDigit_30() throws {
        let result = NumberConverter.toPhrase(number: 30)
        XCTAssertEqual(result, "thirty")
    }

    func test_GeneratesDoubleDigit_33() throws {
        let result = NumberConverter.toPhrase(number: 33)
        XCTAssertEqual(result, "thirty three")
    }

    func test_GeneratesDoubleDigit_40() throws {
        let result = NumberConverter.toPhrase(number: 40)
        XCTAssertEqual(result, "forty")
    }

    func test_GeneratesDoubleDigit_44() throws {
        let result = NumberConverter.toPhrase(number: 44)
        XCTAssertEqual(result, "forty four")
    }

    func test_GeneratesDoubleDigit_50() throws {
        let result = NumberConverter.toPhrase(number: 50)
        XCTAssertEqual(result, "fifty")
    }

    func test_GeneratesDoubleDigit_55() throws {
        let result = NumberConverter.toPhrase(number: 55)
        XCTAssertEqual(result, "fifty five")
    }

    func test_GeneratesDoubleDigit_60() throws {
        let result = NumberConverter.toPhrase(number: 60)
        XCTAssertEqual(result, "sixty")
    }

    func test_GeneratesDoubleDigit_66() throws {
        let result = NumberConverter.toPhrase(number: 66)
        XCTAssertEqual(result, "sixty six")
    }

    func test_GeneratesDoubleDigit_70() throws {
        let result = NumberConverter.toPhrase(number: 70)
        XCTAssertEqual(result, "seventy")
    }

    func test_GeneratesDoubleDigit_77() throws {
        let result = NumberConverter.toPhrase(number: 77)
        XCTAssertEqual(result, "seventy seven")
    }

    func test_GeneratesDoubleDigit_80() throws {
        let result = NumberConverter.toPhrase(number: 80)
        XCTAssertEqual(result, "eighty")
    }

    func test_GeneratesDoubleDigit_88() throws {
        let result = NumberConverter.toPhrase(number: 88)
        XCTAssertEqual(result, "eighty eight")
    }

    func test_GeneratesDoubleDigit_90() throws {
        let result = NumberConverter.toPhrase(number: 90)
        XCTAssertEqual(result, "ninety")
    }

    func test_GeneratesDoubleDigit_99() throws {
        let result = NumberConverter.toPhrase(number: 99)
        XCTAssertEqual(result, "ninety nine")
    }

    // MARK: - Triple Digit
    
    func test_GeneratesTripleDigit_100() throws {
        let result = NumberConverter.toPhrase(number: 100)
        XCTAssertEqual(result, "one hundred")
    }

    func test_GeneratesTripleDigit_101() throws {
        let result = NumberConverter.toPhrase(number: 101)
        XCTAssertEqual(result, "one hundred one")
    }

    func test_GeneratesTripleDigit_111() throws {
        let result = NumberConverter.toPhrase(number: 111)
        XCTAssertEqual(result, "one hundred eleven")
    }

    func test_GeneratesTripleDigit_123() throws {
        let result = NumberConverter.toPhrase(number: 123)
        XCTAssertEqual(result, "one hundred twenty three")
    }

    func test_GeneratesTripleDigit_234() throws {
        let result = NumberConverter.toPhrase(number: 234)
        XCTAssertEqual(result, "two hundred thirty four")
    }

    func test_GeneratesTripleDigit_345() throws {
        let result = NumberConverter.toPhrase(number: 345)
        XCTAssertEqual(result, "three hundred forty five")
    }

    func test_GeneratesTripleDigit_456() throws {
        let result = NumberConverter.toPhrase(number: 456)
        XCTAssertEqual(result, "four hundred fifty six")
    }

    func test_GeneratesTripleDigit_550() throws {
        let result = NumberConverter.toPhrase(number: 550)
        XCTAssertEqual(result, "five hundred fifty")
    }

    func test_GeneratesTripleDigit_606() throws {
        let result = NumberConverter.toPhrase(number: 606)
        XCTAssertEqual(result, "six hundred six")
    }

    func test_GeneratesTripleDigit_713() throws {
        let result = NumberConverter.toPhrase(number: 713)
        XCTAssertEqual(result, "seven hundred thirteen")
    }

    func test_GeneratesTripleDigit_811() throws {
        let result = NumberConverter.toPhrase(number: 811)
        XCTAssertEqual(result, "eight hundred eleven")
    }

    func test_GeneratesTripleDigit_999() throws {
        let result = NumberConverter.toPhrase(number: 999)
        XCTAssertEqual(result, "nine hundred ninety nine")
    }

    // MARK: - Large Numbers
    
    func test_GeneratesThousands_1000() throws {
        let result = NumberConverter.toPhrase(number: 1000)
        XCTAssertEqual(result, "one thousand")
    }

    func test_GeneratesMillions_2000000() throws {
        let result = NumberConverter.toPhrase(number: 2000000)
        XCTAssertEqual(result, "two million")
    }

    func test_GeneratesBillions_3000000000() throws {
        let result = NumberConverter.toPhrase(number: 3000000000)
        XCTAssertEqual(result, "three billion")
    }

    func test_GeneratesBigAssNumber() throws {
        let result = NumberConverter.toPhrase(number: 123456789111)
        XCTAssertEqual(result, "one hundred twenty three billion four hundred fifty six million seven hundred eighty nine thousand one hundred eleven")
    }

}
