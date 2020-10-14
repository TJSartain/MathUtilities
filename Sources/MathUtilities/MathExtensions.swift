//
//  MathExtensions.swift
//  
//
//  Created by TJ Sartain on 10/13/20.
//


extension Double
{
    func equals(_ x: Double, _ tolerance: Double? = 0) -> Bool
    {
        (x - tolerance!) <= self && self <= (x + tolerance!)
    }
}
