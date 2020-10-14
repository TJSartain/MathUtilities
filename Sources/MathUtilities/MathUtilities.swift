import UIKit
import CGExtensions

public func pin<T: Comparable>(_ n: T, _ a: T, _ b: T) -> T
{
    let m = (a > n ? a : n)
    return (m < b ? m : b)
}

public func distance(_ p1: CGPoint, _ p2: CGPoint) -> CGFloat
{
    let dx = p1.x - p2.x
    let dy = p1.y - p2.y
    return sqrt(dx*dx + dy*dy)
}

public func det(_ a: CGFloat, _ b: CGFloat, _ c: CGFloat, _ d: CGFloat) -> CGFloat
{
    return a*d - b*c
}

public func det(_ m: [CGFloat]) -> CGFloat
{
    return 0
}

public func ln(_ n: CGFloat) -> CGFloat
{
    return log(n) / CGFloat(log(M_E))
}

public func rnd(between n: Int, and m: Int) -> Int // between n and m
{
    return Int.random(in: 0...abs(m-n)) + min(n, m)
}

public func rnd(between n: CGFloat, and m: CGFloat) -> CGFloat // between n and m
{
    return CGFloat.random(in: 0...abs(m-n)) + min(n, m)
}

public func lerp(_ start: CGFloat, _ end: CGFloat, _ pct: CGFloat) -> CGFloat
{
    return start + pct * (end-start)
}

public func roots(a: CGFloat, b: CGFloat, c: CGFloat) -> [CGFloat]?
{
    let discriminant = b*b - 4*a*c
    if a == 0 || discriminant < CGFloat.tolerance {    // no real roots
        return nil
    } else if discriminant.equals(0) {      // one root
        return [-b / (2*a)]
    } else {                                // two roots
        let x1 = (-b + sqrt(discriminant)) / (2*a)
        let x2 = (-b - sqrt(discriminant)) / (2*a)
        return [x1, x2]
    }
}

public func roots(a: Double, b: Double, c: Double) -> [Double]
{
    let discriminant = b*b - 4*a*c
    if a == 0 || discriminant < Double(CGFloat.tolerance) { // no real roots
        return []
    } else if discriminant.equals(0) {                      // one root
        return [-b / (2*a)]
    } else {                                                // two roots
        let x1 = (-b + sqrt(discriminant)) / (2*a)
        let x2 = (-b - sqrt(discriminant)) / (2*a)
        return [x1, x2]
    }
}

public func powerFit(_ x: [CGFloat], _ y: [CGFloat]) -> (a: CGFloat, b: CGFloat)
{
    var lnx: CGFloat = 0
    var lny: CGFloat = 0
    var lnxy: CGFloat = 0
    var lnx2: CGFloat = 0
    for i in 1...x.count {
        let lnxi = ln(x[i-1])
        let lnyi = ln(y[i-1])
        lnx += lnxi
        lny += lnyi
        lnxy += lnxi * lnyi
        lnx2 += lnxi * lnxi
    }
    let N = CGFloat(x.count)
    let b = (lnxy - lnx * lny / N) / (lnx2 - lnx * lnx / N)
    let a = exp((lny - b * lnx) / N)
    return (a, b)
}

public func exponentialFit(_ x: [CGFloat], _ y: [CGFloat]) -> (a: CGFloat, b: CGFloat)
{
    var xsum: CGFloat = 0
    var lny: CGFloat = 0
    var xlny: CGFloat = 0
    var x2: CGFloat = 0
    for i in 1...x.count {
        let lnyi = ln(y[i-1])
        lny += lnyi
        xlny += x[i-1] * lnyi
        xsum += x[i-1]
        x2 += x[i-1] * x[i-1]
    }
    let N = CGFloat(x.count)
    let b = (xlny - xsum * lny / N) / (x2 - xsum * xsum / N)
    let a = exp(lny / N - b * xsum / N)
    return (a, b)
}

public func analyzeRange(_ pts: [CGFloat]) -> [String: CGFloat]?
{
    guard
        pts.max() != nil,
        pts.min() != nil
        else { return nil }
    
    var bases: [CGFloat] = [1, 2.5, 5]
    if pts.max()! > 1000 {
        bases = [1, 2, 2.5, 5]
    }
    var p10 = -1
    var baseIndex = 1
    var increment, min, max, divs: CGFloat
    repeat {
        increment = bases[baseIndex] * pow(10, CGFloat(p10))
        min = floor(pts.min()! / increment) * increment
        max = ceil(pts.max()! / increment) * increment
        divs = (max - min) / increment
        baseIndex += 1
        if baseIndex >= bases.count {
            baseIndex = 0
            p10 += 1
        }
    } while divs > 8
    return ["min": min,
            "max": max,
            "divs": divs,
            "range": (max - min),
            "inc": divs == 0 ? 0 : (max - min) / divs]
}
