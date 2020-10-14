//
//  MathExtensions.swift
//  
//
//  Created by TJ Sartain on 10/13/20.
//

import UIKit

extension Int
{
    func pin(_ a: Int, _ b: Int) -> Int
    {
        let m = (a > self ? a : self)
        return (m < b ? m : b)
    }
    
    func factorial() -> Int
    {
        if self == 1 || self == 0 {
            return 1
        } else if self < 0 {
            return -1
        }
        return self * (self-1).factorial()
    }
    
    var radians: CGFloat
    {
        CGFloat(self).radians
    }
    
}


extension Double
{
    func equals(_ x: Double, _ tolerance: Double? = 0) -> Bool
    {
        (x - tolerance!) <= self && self <= (x + tolerance!)
    }
}
