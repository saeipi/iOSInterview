//
//  Double+KSExtensions.swift
//  ZeroShare
//
//  Created by saeipi on 2019/11/8.
//  Copyright © 2019 saeipi. All rights reserved.
//

import Foundation

extension Double {
    
    /// 转化为字符串格式
    ///
    /// - Parameters:
    ///   - minimum: 设置最小小数点后的位数
    ///   - maximum: 设置最大小数点后的位数
    ///   - minimumInteger: 设置数值的整数部分允许的最小位数
    /// - Returns:
    public func ks_toString(_ minimum: Int = 2, maximum: Int = 8, minimumInteger: Int = 1) -> String {
        let valueDecimalNumber = NSDecimalNumber(value: Double(self) as Double)
        let twoDecimalPlacesFormatter = NumberFormatter()
        twoDecimalPlacesFormatter.maximumFractionDigits = maximum
        twoDecimalPlacesFormatter.minimumFractionDigits = minimum
        twoDecimalPlacesFormatter.minimumIntegerDigits = minimumInteger
        return twoDecimalPlacesFormatter.string(from: valueDecimalNumber)!
    }
    
    public func ks_indexToString() -> String {
        return String.init(format: "%.0f", self)
    }
}
