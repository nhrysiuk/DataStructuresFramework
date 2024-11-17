import Testing
@testable import DataStructuresFramework

struct GraphTest {

    @Test func create() async throws {
        let graph = Graph<Int>()
        #expect(graph.neighbors(of: 0).isEmpty)
    }

    @Test func addEdge() async throws {
        let graph = Graph<Int>()
        graph.addEdge(from: 0, to: 1)
        graph.addEdge(from: 0, to: 2)
        #expect(graph.neighbors(of: 0).contains(1))
        #expect(!graph.neighbors(of: 1).contains(2))
    }

    @Test func addVertex() async throws {
        let graph = Graph<Int>()
        graph.addVertex(0)
        graph.addVertex(1)
        #expect(!graph.neighbors(of: 0).contains(1))
        #expect(!graph.neighbors(of: 1).contains(0))
    }

    @Test func getNeighbors() async throws {
        let graph = Graph<Int>()
        graph.addVertex(0)
        graph.addVertex(1)
        #expect(graph.neighbors(of: 0).isEmpty)
        #expect(graph.neighbors(of: 5).isEmpty) // non-existing vertex
        graph.addEdge(from: 0, to: 1)
        graph.addEdge(from: 0, to: 2)
        graph.addEdge(from: 0, to: 3)
        #expect(graph.neighbors(of: 0) == [1, 2, 3])
    }

    @Test func bfs() async throws {
        let graph = Graph<Int>()
        #expect(graph.bfs(from: 0).isEmpty)
        graph.addEdge(from: 0, to: 1)
        graph.addEdge(from: 0, to: 2)
        graph.addEdge(from: 0, to: 3)
        graph.addEdge(from: 1, to: 2)
        #expect(graph.bfs(from: 0) == [0, 1, 2, 3])
        #expect(graph.bfs(from: 1) == [1, 0, 2, 3])
    }

    @Test func dfs() async throws {
        let graph = Graph<Int>()
        #expect(graph.dfs(from: 0).isEmpty)
        graph.addEdge(from: 0, to: 1)
        graph.addEdge(from: 0, to: 2)
        graph.addEdge(from: 0, to: 3)
        graph.addEdge(from: 1, to: 2)
        graph.addEdge(from: 2, to: 3)
        graph.addEdge(from: 1, to: 3)
        graph.addEdge(from: 1, to: 4)
        #expect(graph.dfs(from: 0) == [0, 1, 2, 3, 4])
        #expect(graph.dfs(from: 1) == [1, 0, 2, 3, 4])
    }
}
