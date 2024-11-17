import Testing
@testable import DataStructuresFramework

struct MatrixTest {

    @Test func create() async throws {
        let matrix = Matrix(fromArray: [])
        #expect(matrix == nil)

        let matrix2 = Matrix(fromArray: [[0.0, 0.0, 0.0], [0.0, 0.0, 0.0], [0.0, 0.0, 0.0]])
        #expect(matrix2?.description == "0.0 0.0 0.0\n0.0 0.0 0.0\n0.0 0.0 0.0")
    }

    @Test func createZeroMatrix() async throws {
        let matrix = Matrix(rows: 3, columns: 3)
        #expect(matrix.description == "0.0 0.0 0.0\n0.0 0.0 0.0\n0.0 0.0 0.0")
    }

    @Test func getByIndex() async throws {
        let matrix = Matrix(rows: 3, columns: 3)
        #expect(matrix[0, 0] == 0.0)
    }

    @Test func useIndex() async throws {
        let matrix = Matrix(rows: 3, columns: 3)
        #expect(matrix[0, 0] == 0.0)

        matrix[0, 0] = 1.0
        #expect(matrix[0, 0] == 1.0)
    }

    @Test func transpose() async throws {
        let matrix = Matrix(fromArray: [[1.0, 2.0, 0.0], [3.0, 5.0, 10.0], [7.0, 9.0, 5.0]])
        let matrix2 = matrix?.transpose()

        #expect(matrix2?.description == "1.0 3.0 7.0\n2.0 5.0 9.0\n0.0 10.0 5.0")
    }

    @Test func add() async throws {
        let matrix = Matrix(fromArray: [[1.0, 2.0, 0.0], [3.0, 5.0, 10.0]])
        let matrix2 = Matrix(fromArray: [[1.0, 2.0, 0.0], [3.0, 5.0, 10.0]])
        guard let matrix, let matrix2 else { return }
        let matrix3 = matrix + matrix2

        #expect(matrix3?.description == "2.0 4.0 0.0\n6.0 10.0 20.0")
    }

    @Test func subtract() async throws {
        let matrix = Matrix(fromArray: [[1.0, 2.0, 0.0], [3.0, 5.0, 10.0]])
        let matrix2 = Matrix(fromArray: [[1.0, 2.0, 0.0], [3.0, 5.0, 10.0]])
        guard let matrix, let matrix2 else { return }
        let matrix3 = matrix - matrix2
        
        guard let matrix3 else { return }

        #expect(matrix3 == Matrix(rows: 2, columns: 3))
        #expect(matrix3.description == "0.0 0.0 0.0\n0.0 0.0 0.0")
    }
}
