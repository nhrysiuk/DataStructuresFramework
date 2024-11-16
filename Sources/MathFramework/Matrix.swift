//
//  File.swift
//  MathFramework
//
//  Created by Анастасія Грисюк on 16.11.2024.
//

import Foundation

public class Matrix {
    
    private var data: [[Double]]
    let rows: Int
    let columns: Int
    
    public init(rows: Int, columns: Int, initialValue: Double = 0.0) {
        self.rows = rows
        self.columns = columns
        self.data = Array(repeating: Array(repeating: initialValue, count: columns), count: rows)
    }
    
    public init(fromArray array: [[Double]]) throws {
        guard let firstRow = array.first else {
            throw MatrixError.invalidDimensions
        }
        let columnCount = firstRow.count
        guard array.allSatisfy({ $0.count == columnCount }) else {
            throw MatrixError.invalidDimensions
        }
        self.rows = array.count
        self.columns = columnCount
        self.data = array
    }
    
    public subscript(row: Int, column: Int) -> Double {
        get {
            guard isValidIndex(row: row, column: column) else {
                fatalError("Index out of bounds")
            }
            return data[row][column]
        }
        set {
            guard isValidIndex(row: row, column: column) else {
                fatalError("Index out of bounds")
            }
            data[row][column] = newValue
        }
    }
    
    private func isValidIndex(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    
    public func transpose() -> Matrix {
        var transposed = Matrix(rows: columns, columns: rows)
        for i in 0..<rows {
            for j in 0..<columns {
                transposed[j, i] = self[i, j]
            }
        }
        return transposed
    }
    
    static func + (lhs: Matrix, rhs: Matrix) throws -> Matrix {
        guard lhs.rows == rhs.rows && lhs.columns == rhs.columns else {
            throw MatrixError.dimensionsMismatch
        }
        var result = Matrix(rows: lhs.rows, columns: lhs.columns)
        for i in 0..<lhs.rows {
            for j in 0..<lhs.columns {
                result[i, j] = lhs[i, j] + rhs[i, j]
            }
        }
        return result
    }
    
    static func - (lhs: Matrix, rhs: Matrix) throws -> Matrix {
        guard lhs.rows == rhs.rows && lhs.columns == rhs.columns else {
            throw MatrixError.dimensionsMismatch
        }
        var result = Matrix(rows: lhs.rows, columns: lhs.columns)
        for i in 0..<lhs.rows {
            for j in 0..<lhs.columns {
                result[i, j] = lhs[i, j] - rhs[i, j]
            }
        }
        return result
    }
    
    static func * (lhs: Matrix, scalar: Double) -> Matrix {
        var result = Matrix(rows: lhs.rows, columns: lhs.columns)
        for i in 0..<lhs.rows {
            for j in 0..<lhs.columns {
                result[i, j] = lhs[i, j] * scalar
            }
        }
        return result
    }
    
    static func * (lhs: Matrix, rhs: Matrix) throws -> Matrix {
        guard lhs.columns == rhs.rows else {
            throw MatrixError.dimensionsMismatch
        }
        var result = Matrix(rows: lhs.rows, columns: rhs.columns)
        for i in 0..<lhs.rows {
            for j in 0..<rhs.columns {
                for k in 0..<lhs.columns {
                    result[i, j] += lhs[i, k] * rhs[k, j]
                }
            }
        }
        return result
    }
    
    static func == (lhs: Matrix, rhs: Matrix) -> Bool {
        guard lhs.rows == rhs.rows && lhs.columns == rhs.columns else {
            return false
        }
        for i in 0..<lhs.rows {
            for j in 0..<lhs.columns {
                if lhs[i, j] != rhs[i, j] {
                    return false
                }
            }
        }
        return true
    }
    
    public func printMatrix() {
        for row in data {
            print(row)
        }
    }

    enum MatrixError: Error {
        case invalidDimensions
        case dimensionsMismatch
    }
}