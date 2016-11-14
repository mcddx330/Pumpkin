//
//  PKTextSet.swift
//  Pumpkin
//
//  Created by dimbow. on 2/5/15.
//  Copyright (c) 2015 dimbow. All rights reserved.
//

extension String {
    /*
     * Separate string to array by separator.
     */
    public func PKSeparateStrings(separator: Character) -> [String] {
        return self.characters.split(separator: separator).map(String.init);
    }

    /*
     * Separate string to array by separator and count string.
     */
    public func PKSeparateStringsWithStringLength(separator: Character) -> [Int: (count: Int, string: String)] {
        let string_map = self.characters.split(separator: separator).map(String.init);

        var result: [Int: (count: Int, string: String)] = [0: (count: 0, string: "")];
        var i:Int = 0;
        for map in string_map {
            result[i] = (
                count: map.characters.count,
                string: map
            )
            i += 1;
        }

        return result;
    }
}
