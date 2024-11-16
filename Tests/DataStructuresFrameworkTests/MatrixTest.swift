import Testing
@testable import DataStructuresFramework

struct MatrixTest {

    @Test func createZeroMatrix() async throws {
        let matrix = Matrix(rows: 3, columns: 3)
        #expect(matrix.description == "0.0 0.0 0.0\n0.0 0.0 0.0\n0.0 0.0 0.0")
    }

}
