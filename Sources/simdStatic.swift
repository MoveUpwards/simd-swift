//
//  simdStatic.swift
//  
//
//  Created by Damien Noël Dubuisson on 05/10/2021.
//

#if os(macOS) || os(iOS)
import Darwin
#elseif os(Linux) || CYGWIN
import Glibc
#endif

// Will define all static helpers for simd

// MARK: - Double

/// Reciprocal square root.
public func rsqrt(_ x: Double) -> Double { return 1.0 / sqrt(x) }

//public func rsqrt(_ x: Double) -> Double { // Not used as x = 25.0 result 0.19968952216623773 instead of 0.2
//    let halfx = 0.5 * x
//    var i = x.bitPattern
//    i = 0x5fe6eb50c7b537a9 - (i >> 1)
//    var y = Double(bitPattern: i)
//    y = y * (1.5 - (halfx * y * y))
//    return y
//}

// MARK: - simd_double3

public func simd_length_squared(_ __x: simd_double3) -> Double {
    return __x.x*__x.x + __x.y*__x.y + __x.z*__x.z
}

public func simd_normalize(_ __x: simd_double3) -> simd_double3 {
    let magnitude = sqrt(simd_length_squared(__x))
    return .init(__x.x / magnitude, __x.y / magnitude, __x.z / magnitude)
}

public func simd_cross(_ __x: simd_double3, _ __y: simd_double3) -> simd_double3 {
    return .init(__x.y*__y.z - __x.z*__y.y,
                 __x.z*__y.x - __x.x*__y.z,
                 __x.x*__y.y - __x.y*__y.x)
}
