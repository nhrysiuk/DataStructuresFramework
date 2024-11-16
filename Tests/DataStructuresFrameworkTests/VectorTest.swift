//
//  Test.swift
//  DataStructuresFramework
//
//  Created by Анастасія Грисюк on 16.11.2024.
//

import Testing
@testable import DataStructuresFramework

struct VectorTest {

    @Test func createEmpty() async throws {
        let vector = Vector(components: [])
        #expect(vector.dimension == 0)
    }

    @Test func create() async throws {
        let vector = Vector(components: [1, 2, 3])
        #expect(vector.dimension == 3)
        #expect(vector.magnitude() == 3.7416573867739413)
        #expect(vector.description == "[1.0, 2.0, 3.0]")
    }

    @Test func getMagnitude() async throws {
        let vector = Vector(components: [4])
        let vector2 = Vector(components: [1, 1, 1, 1])
        #expect(vector.magnitude() == 4)
        #expect(vector2.magnitude() == 2)
    }

    @Test func createWithZero() async throws {
        let vector = Vector(components: [0, 0, 0])
        #expect(vector.dimension == 3)
        #expect(vector.magnitude() == 0)
        #expect(vector.description == "[0.0, 0.0, 0.0]")
    }

    @Test func add() async throws {
        let vector1 = Vector(components: [1, 2, 3])
        let vector2 = Vector(components: [4, 5, 6])
        let result = vector1 + vector2
        #expect(result?.dimension == 3)
        #expect(result?.description == "[5.0, 7.0, 9.0]")

    }

    @Test func failableAdd() async throws {
        let vector1 = Vector(components: [1, 2, 3])
        let vector2 = Vector(components: [4, 5, 6, 7])
        let result = vector1 + vector2
        #expect(result == nil)
    }

    @Test func subtract() async throws {
        let vector1 = Vector(components: [1, 2, 3])
        let vector2 = Vector(components: [4, -5, 8])
        let result = vector1 - vector2
        #expect(result?.dimension == 3)
        #expect(result?.description == "[-3.0, 7.0, -5.0]")
    }

    @Test func failableSubtract() async throws {
        let vector1 = Vector(components: [1, 2, 3])
        let vector2 = Vector(components: [4, 5, 6, 7])
        let result = vector1 - vector2
        #expect(result == nil)
    }

    @Test func multiplyByScalar() async throws {
        let vector1 = Vector(components: [1, 2, 3])
        let scalar = 4.0
        let result = vector1 * scalar
        #expect(result.description == "[4.0, 8.0, 12.0]")
    }

    @Test func multiply() async throws {
        let vector1 = Vector(components: [1, 2, 3])
        let vector2 = Vector(components: [4, 5, 6])
        let result = vector1 * vector2
        #expect(result == 32.0)
    }

    @Test func failableMultiply() async throws {
        let vector1 = Vector(components: [1, 2, 3])
        let vector2 = Vector(components: [4, 5, 6, 7])
        let result = vector1 * vector2
        #expect(result == nil)
    }

    @Test func normalize() async throws {
        let vector1 = Vector(components: [1, 2, 3])
        let result = vector1.normalize()
        #expect(result.description == "[0.2672612419124244, 0.5345224838248488, 0.8017837257372732]")
    }
}
