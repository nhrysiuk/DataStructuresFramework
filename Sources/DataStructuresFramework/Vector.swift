//
//  File.swift
//  MathFramework
//
//  Created by Анастасія Грисюк on 16.11.2024.
//

import Foundation

public class Vector {
    private var components: [Double]

    public var dimension: Int {
        return components.count
    }

    public init(components: [Double]) {
        self.components = components
    }

    public subscript(index: Int) -> Double {
        get {
            guard index >= 0 && index < dimension else {
                fatalError("Index out of bounds")
            }
            return components[index]
        }
        set {
            guard index >= 0 && index < dimension else {
                fatalError("Index out of bounds")
            }
            components[index] = newValue
        }
    }

    public static func + (lhs: Vector, rhs: Vector) throws -> Vector {
        guard lhs.dimension == rhs.dimension else {
            throw VectorError.dimensionsMismatch
        }
        var result = [Double]()
        for i in 0..<lhs.dimension {
            result.append(lhs[i] + rhs[i])
        }
        return Vector(components: result)
    }

    public static func - (lhs: Vector, rhs: Vector) throws -> Vector {
        guard lhs.dimension == rhs.dimension else {
            throw VectorError.dimensionsMismatch
        }
        var result = [Double]()
        for i in 0..<lhs.dimension {
            result.append(lhs[i] - rhs[i])
        }
        return Vector(components: result)
    }

    public static func * (lhs: Vector, scalar: Double) -> Vector {
        var result = [Double]()
        for i in 0..<lhs.dimension {
            result.append(lhs[i] * scalar)
        }
        return Vector(components: result)
    }

    public static func * (lhs: Vector, rhs: Vector) throws -> Double {
        guard lhs.dimension == rhs.dimension else {
            throw VectorError.dimensionsMismatch
        }
        var result = 0.0
        for i in 0..<lhs.dimension {
            result += lhs[i] * rhs[i]
        }
        return result
    }

    public func magnitude() -> Double {
        var sum = 0.0
        for i in 0..<dimension {
            sum += components[i] * components[i]
        }
        return sqrt(sum)
    }

    public func normalize() -> Vector {
        let mag = magnitude()
        return self * (1 / mag)
    }

    public func printVector() {
        print(components)
    }

    public enum VectorError: Error {
        case dimensionsMismatch
    }
}
