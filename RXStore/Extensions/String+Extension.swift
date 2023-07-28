//
//  String+Extension.swift
//  RXStore
//
//  Created by Мельник Дмитрий on 27.07.2023.
//

import UIKit

extension String {

    var length: Int {
        return count
    }

    subscript (index: Int) -> String {
        return self[index ..< index + 1]
    }

    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, length) ..< length]
    }

    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }

    subscript (rang: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, rang.lowerBound)),
                                            upper: min(length, max(0, rang.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
}

extension String {
    func heightOfString(usingFont font: UIFont) -> CGFloat {
        return sizeOfString(usingFont: font).height
    }

    private func sizeOfString(usingFont font: UIFont) -> CGSize {
        let fontAttributes = [NSAttributedString.Key.font: font]
        return self.size(withAttributes: fontAttributes)
    }
}

extension String {
    func chunked(into size: Int) -> [String] {
        return stride(from: 0, to: count, by: size).map {
            String(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
