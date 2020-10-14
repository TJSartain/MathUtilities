# MathUtilities

Helpful math utilities and extensions.


    public func pin<T: Comparable>(_ n: T, _ a: T, _ b: T) -> T
    public func distance(_ p1: CGPoint, _ p2: CGPoint) -> CGFloat
    public func det(_ a: CGFloat, _ b: CGFloat, _ c: CGFloat, _ d: CGFloat) -> CGFloat
    public func det(_ m: [CGFloat]) -> CGFloat
    public func ln(_ n: CGFloat) -> CGFloat
    public func rnd(between n: Int, and m: Int) -> Int // between n and m
    public func rnd(between n: CGFloat, and m: CGFloat) -> CGFloat // between n and m
    public func lerp(_ start: CGFloat, _ end: CGFloat, _ pct: CGFloat) -> CGFloat
    public func roots(a: CGFloat, b: CGFloat, c: CGFloat) -> [CGFloat]?
    public func roots(a: Double, b: Double, c: Double) -> [Double]
    public func powerFit(_ x: [CGFloat], _ y: [CGFloat]) -> (a: CGFloat, b: CGFloat)
    public func exponentialFit(_ x: [CGFloat], _ y: [CGFloat]) -> (a: CGFloat, b: CGFloat)
    public func analyzeRange(_ pts: [CGFloat]) -> [String: CGFloat]?
