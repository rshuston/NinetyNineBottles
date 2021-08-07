//
//  NumberConverter.swift
//  NinetyNineBottles
//
//  Created by Robert Huston on 8/4/21.
//

import Foundation

class NumberConverter {
    
    class func toPhrase(number: Int) -> String {
        let trillionsTriplet = number / 1_000_000_000_000
        let billionsTriplet = (number - trillionsTriplet * 1_000_000_000_000) / 1_000_000_000
        let millionsTriplet = (number - trillionsTriplet * 1_000_000_000_000 - billionsTriplet * 1_000_000_000) / 1_000_000
        let thousandsTriplet = (number - trillionsTriplet * 1_000_000_000_000 - billionsTriplet * 1_000_000_000 - millionsTriplet * 1_000_000) / 1_000
        let hundredsTriplet = number - trillionsTriplet * 1_000_000_000_000 - billionsTriplet * 1_000_000_000 - millionsTriplet * 1_000_000 - thousandsTriplet * 1_000
        
        var result = tripletToPhrase(trillionsTriplet, tripletName: "trillion ")
        result += tripletToPhrase(billionsTriplet, tripletName: "billion ")
        result += tripletToPhrase(millionsTriplet, tripletName: "million ")
        result += tripletToPhrase(thousandsTriplet, tripletName: "thousand ")
        result += tripletToPhrase(hundredsTriplet, tripletName: "")

        result = result.trimmingCharacters(in: .whitespaces).replacingOccurrences(of: "  ", with: " ")
        return result
    }
    
    private class func tripletToPhrase(_ triplet: Int, tripletName: String) -> String {
        var result = ""
        
        let hundreds = triplet / 100
        result = hundredsToPhrase(hundreds)
        
        let tensDoublet = triplet - hundreds * 100
        switch tensDoublet {
            case 10:
                result += " ten"
            case 11:
                result += " eleven"
            case 12:
                result += " twelve"
            case 13:
                result += " thirteen"
            case 14:
                result += " fourteen"
            case 15:
                result += " fifteen"
            case 16:
                result += " sixteen"
            case 17:
                result += " seventeen"
            case 18:
                result += " eighteen"
            case 19:
                result += " nineteen"
            default:
                let tens = tensDoublet / 10
                let ones = triplet - hundreds * 100 - tens * 10
                result += " " + tensToPhrase(tens) + " " + onesToPhrase(ones)
        }
        result = result.trimmingCharacters(in: .whitespaces).replacingOccurrences(of: "  ", with: " ")
        return result != "" ? result + " " + tripletName : ""
    }
    
    private class func hundredsToPhrase(_ hundreds: Int) -> String {
        let phrase = onesToPhrase(hundreds)
        return phrase != "" ? phrase + " hundred" : ""
    }

    private class func tensToPhrase(_ tens: Int) -> String {
        let result: String
        switch tens {
            case 2:
                result = "twenty"
            case 3:
                result = "thirty"
            case 4:
                result = "forty"
            case 5:
                result = "fifty"
            case 6:
                result = "sixty"
            case 7:
                result = "seventy"
            case 8:
                result = "eighty"
            case 9:
                result = "ninety"
            default:
                result = ""
        }
        return result
    }

    private class func onesToPhrase(_ ones: Int) -> String {
        let result: String
        switch ones {
            case 1:
                result = "one"
            case 2:
                result = "two"
            case 3:
                result = "three"
            case 4:
                result = "four"
            case 5:
                result = "five"
            case 6:
                result = "six"
            case 7:
                result = "seven"
            case 8:
                result = "eight"
            case 9:
                result = "nine"
            default:
                result = ""
        }
        return result
    }

}
