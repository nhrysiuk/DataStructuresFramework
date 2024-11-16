import Foundation

/// A class representing a mathematical vector with various operations.
public class Vector {

    /// The components of the vector.
    private var components: [Double]

    /// The dimension of the vector (number of components).
    public var dimension: Int {
        return components.count
    }

    /// Initializes a vector with the given components.
    /// - Parameter components: An array of `Double` values representing the vector's components.
    public init(components: [Double]) {
        self.components = components
    }

    /// Accesses the component at the specified index.
    /// - Parameter index: The index of the component to access.
    /// - Returns: The value of the component at the specified index.
    /// - Note: Triggers a runtime error if the index is out of bounds.
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

    /// Adds two vectors.
    /// - Parameters:
    ///   - lhs: The first vector.
    ///   - rhs: The second vector.
    /// - Returns: A new vector representing the sum of the two vectors.
    public static func + (lhs: Vector, rhs: Vector) -> Vector? {
        guard lhs.dimension == rhs.dimension else {
            return nil
        }
        var result = [Double]()
        for i in 0..<lhs.dimension {
            result.append(lhs[i] + rhs[i])
        }
        return Vector(components: result)
    }

    /// Subtracts one vector from another.
    /// - Parameters:
    ///   - lhs: The first vector.
    ///   - rhs: The second vector.
    /// - Returns: A new vector representing the difference between the two vectors.
    public static func - (lhs: Vector, rhs: Vector) -> Vector? {
        guard lhs.dimension == rhs.dimension else {
            return nil
        }
        var result = [Double]()
        for i in 0..<lhs.dimension {
            result.append(lhs[i] - rhs[i])
        }
        return Vector(components: result)
    }

    /// Multiplies a vector by a scalar.
    /// - Parameters:
    ///   - lhs: The vector.
    ///   - scalar: The scalar value to multiply.
    /// - Returns: A new vector scaled by the given scalar.
    public static func * (lhs: Vector, scalar: Double) -> Vector {
        var result = [Double]()
        for i in 0..<lhs.dimension {
            result.append(lhs[i] * scalar)
        }
        return Vector(components: result)
    }

    /// Computes the dot product of two vectors.
    /// - Parameters:
    ///   - lhs: The first vector.
    ///   - rhs: The second vector.
    /// - Returns: The dot product of the two vectors.
    public static func * (lhs: Vector, rhs: Vector) -> Double? {
        guard lhs.dimension == rhs.dimension else {
            return  nil
        }
        var result = 0.0
        for i in 0..<lhs.dimension {
            result += lhs[i] * rhs[i]
        }
        return result
    }

    /// Calculates the magnitude (length) of the vector.
    /// - Returns: The magnitude of the vector.
    public func magnitude() -> Double {
        var sum = 0.0
        for i in 0..<dimension {
            sum += components[i] * components[i]
        }
        return sqrt(sum)
    }

    /// Normalizes the vector to a unit vector.
    /// - Returns: A normalized vector with magnitude 1.
    public func normalize() -> Vector {
        let mag = magnitude()
        return self * (1 / mag)
    }

    /// A textual representation of the vector.
    public var description: String {
        let innerPart = components.map { "\($0)" }.joined(separator: ", ")
        return "[\(innerPart)]"
    }
}
