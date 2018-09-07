//  Anagrams.swift
//  Created on 2018/9/7
//  Description <#文件描述#>

//  Copyright © 2018年 Huami inc. All rights reserved.
//  @author tongxing(tongxing@huami.com)

import Foundation
func checkWord(word: String, isAnagramOfWord: String) -> Bool {
    let noWhitespaceOriginalString = word.replacingOccurrences(of: " ", with: "").lowercased()
    
    let noWhitespaceComparisonString = isAnagramOfWord.replacingOccurrences(of: " ", with: "").lowercased()
    
    if noWhitespaceOriginalString.count != noWhitespaceComparisonString.count {
        return false
    }
    
    // If they have no content, default to true.
    if noWhitespaceOriginalString.count == 0 {
        return true
    }
    
    // If the strings are the same, they must be anagrams of each other!
    if noWhitespaceOriginalString == noWhitespaceComparisonString {
        return true
    }
    
    var dict = [Character: Int]()
    
    for character in noWhitespaceOriginalString {
        let originalWordIndex = noWhitespaceOriginalString.index(of: character)
        let comparedWordIndex = noWhitespaceOriginalString.index(originalWordIndex!, offsetBy: 0)
        let comparedWordCharacter = noWhitespaceComparisonString[comparedWordIndex...comparedWordIndex]
        dict[character] = (dict[character] ?? 0) + 1
        for cha in comparedWordCharacter{
            dict[cha] = (dict[cha] ?? 0) - 1
        }
    }
    
    // Loop through the entire dictionary. If there's a value that isn't 0, the strings aren't anagrams.
    for key in dict.keys {
        if (dict[key] != 0) {
            return false
        }
    }
    // Everything in the dictionary must have been 0, so the strings are balanced.
    return true
}
