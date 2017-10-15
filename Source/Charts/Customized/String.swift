//
//  String.swift
//  Nivo
//
//  Created by Farzad on 10/7/1395 AP.
//  Copyright © 1395 AP Nivo. All rights reserved.
//

extension String
{
    var expression: NSExpression {
        return NSExpression(format:self)
    }
    
    func evaluateMathString() -> Double? {
        
        let strings = self.components(separatedBy: ["+", "-", "*", "/"])
        if strings.contains("") || self.contains("/\(NSLocalizedString("0", comment: ""))"){
            return nil
        }
        
        if let result = self.expression.expressionValue(with: nil, context: nil) as? Double {
            return result
        }
        return nil
    }
    
    func findOccurrencesOf(items: [String]) -> [String] {
        var occurrences: [String] = []
        
        for item in items {
            if self.range(of: item) != nil {
                occurrences.append(item)
            }
        }
        return occurrences
    }
    
    
    func trim() -> String
    {
        return trimmingCharacters(in: NSCharacterSet.whitespaces)
    }
    
    var first: String {
        return String(characters.prefix(1))
    }
    var last: String {
        return String(characters.suffix(1))
    }
    var lowercaseFirst: String {
        return first.lowercased() + String(characters.dropFirst())
    }
    
    func isNumber() -> Bool {
        var str = self
//        if str.characters.last == "." {
//            str.remove(at: str.index(before: str.endIndex))
//        }
        
        str = str.convertNumbersInTextToEnglish()
        //let numberCharacters = CharacterSet.decimalDigits.inverted
        //return !str.isEmpty && str.rangeOfCharacter(from: numberCharacters) == nil
      //  if str.toInt() != -1 {
      //      return true
      //  }
        if str.findOccurrencesOf(items: ["+", "-", "*", "/"]).count > 0 {
            return false
        }
        let r = str.toDouble()
        if  r != -0.0{
            return true
        }
        return false
    }
    
    func isNumberStringCharacter(_ string: String) -> Bool {
        switch string {
        case NSLocalizedString("000", comment: ""), NSLocalizedString("00", comment: ""), NSLocalizedString("0", comment: ""), NSLocalizedString("1", comment: ""), NSLocalizedString("2", comment: ""), NSLocalizedString("3", comment: ""), NSLocalizedString("4", comment: ""), NSLocalizedString("5", comment: ""), NSLocalizedString("6", comment: ""), NSLocalizedString("7", comment: ""), NSLocalizedString("8", comment: ""), NSLocalizedString("9", comment: ""):
            return true
        default: break
        }
        return false
    }
    
//    mutating func isNumberRegex() -> Bool {
//        let str = convertNumbersInTextToEnglish()
//        if Regex("[-+]?\\d+(\\.\\d+)?").isMatche(input: str) {
//            print("matches pattern")
//            return true
//        }
//        print("NOT matches pattern")
//        return false
//    }
    
    func toBool() -> Bool {
        return NSString(string: self).boolValue
    }
    
    func toInt32() -> Int32 {
        return Int32(toInt())
    }
    
    func toInt() -> Int {
        var str: String = replacingOccurrences(of: ",", with: "")
            .replacingOccurrences(of: "،", with:"")
            .replacingOccurrences(of: "+", with: "")
            .replacingOccurrences(of: "*", with: "")
            .replacingOccurrences(of: "/", with: "")
        str = str.convertNumbersInTextToEnglish()
        
        if self == "" {
            return -1
        }
        
        if str.lowercased().contains("e") {
            let d: Double? = Double(str)
            let result: Int? = Int(d ?? 0)
            return result ?? 0
        } else {
            let result: Int? = Int(str)
            return result ?? 0
        }
    }
    
    func toInt64() -> Int64 {
        var str: String = replacingOccurrences(of: ",", with: "")
            .replacingOccurrences(of: "،", with:"")
            .replacingOccurrences(of: "+", with: "")
            .replacingOccurrences(of: "*", with: "")
            .replacingOccurrences(of: "/", with: "")
        str = str.convertNumbersInTextToEnglish()
        
        if self == "" {
            return -1
        }
        
        if str.lowercased().contains("e") {
            let d: Double? = Double(str)
            let result: Int64? = Int64(d ?? 0)
            return result ?? 0
        } else {
            let result: Int64? = Int64(str)
            return result ?? 0
        }
    }
    
    func toDouble() -> Double {
        var str: String = replacingOccurrences(of: ",", with: "")
            .replacingOccurrences(of: "،", with:"")
            .replacingOccurrences(of: "+", with: "")
            .replacingOccurrences(of: "*", with: "")
            .replacingOccurrences(of: "/", with: "")
        str = str.convertNumbersInTextToEnglish()
        
        if self == "" {
            return -0.0
        }
        
        return Double(str) ?? -0.0
    }
    
    mutating func convertNumbersInTextToPersian() -> String {
        return replacingOccurrences(of: "\u{0030}", with: "\u{06F0}")
            .replacingOccurrences(of: "\u{0031}", with: "\u{06F1}")
            .replacingOccurrences(of: "\u{0032}", with: "\u{06F2}")
            .replacingOccurrences(of: "\u{0033}", with: "\u{06F3}")
            .replacingOccurrences(of: "\u{0034}", with: "\u{06F4}")
            .replacingOccurrences(of: "\u{0035}", with: "\u{06F5}")
            .replacingOccurrences(of: "\u{0036}", with: "\u{06F6}")
            .replacingOccurrences(of: "\u{0037}", with: "\u{06F7}")
            .replacingOccurrences(of: "\u{0038}", with: "\u{06F8}")
            .replacingOccurrences(of: "\u{0039}", with: "\u{06F9}")
    }
    
    mutating func convertNumbersInTextToEnglish() -> String {
        return replacingOccurrences(of: "\u{06F0}", with: "\u{0030}")
            .replacingOccurrences(of: "\u{06F1}", with: "\u{0031}")
            .replacingOccurrences(of: "\u{06F2}", with: "\u{0032}")
            .replacingOccurrences(of: "\u{06F3}", with: "\u{0033}")
            .replacingOccurrences(of: "\u{06F4}", with: "\u{0034}")
            .replacingOccurrences(of: "\u{06F5}", with: "\u{0035}")
            .replacingOccurrences(of: "\u{06F6}", with: "\u{0036}")
            .replacingOccurrences(of: "\u{06F7}", with: "\u{0037}")
            .replacingOccurrences(of: "\u{06F8}", with: "\u{0038}")
            .replacingOccurrences(of: "\u{06F9}", with: "\u{0039}")
    }
    
    mutating func convertFaNumberToEn() -> String {
        return replacingOccurrences(of: "٠", with: "0")
            .replacingOccurrences(of: "١", with: "1")
            .replacingOccurrences(of: "٢", with: "2")
            .replacingOccurrences(of: "٣", with: "3")
            .replacingOccurrences(of: "٤", with: "4")
            .replacingOccurrences(of: "٥", with: "5")
            .replacingOccurrences(of: "٦", with: "6")
            .replacingOccurrences(of: "٧", with: "7")
            .replacingOccurrences(of: "٨", with: "8")
            .replacingOccurrences(of: "٩", with: "9")
    }
    
}
