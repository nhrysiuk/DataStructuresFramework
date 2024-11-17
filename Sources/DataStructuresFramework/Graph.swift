import Foundation

/// A class to represent a graph.
public class Graph<T: Hashable> {

    /// The adjacency list to represent the graph.
    private var adjacencyList: [T: [T]] = [:]

    /// A flag to determine whether the graph is directed or undirected.
    private let isDirected: Bool

    /// Initializes a new graph.
    ///
    /// - Parameter isDirected: A boolean flag indicating whether the graph is directed.
    ///   Defaults to `false` for an undirected graph.
    public init(isDirected: Bool = false) {
        self.isDirected = isDirected
    }

    /// Adds a vertex to the graph.
    ///
    /// - Parameter vertex: The vertex to add.
    /// - Note: If the vertex already exists, it will not be added again.
    public func addVertex(_ vertex: T) {
        guard adjacencyList[vertex] == nil else { return }
        adjacencyList[vertex] = []
    }

    /// Adds an edge between two vertices.
    ///
    /// - Parameters:
    ///   - source: The starting vertex of the edge.
    ///   - destination: The ending vertex of the edge.
    /// - Note: If the graph is undirected, the edge is added in both directions.
    public func addEdge(from source: T, to destination: T) {
        addVertex(source)
        addVertex(destination)
        adjacencyList[source]?.append(destination)

        if !isDirected {
            adjacencyList[destination]?.append(source)
        }
    }

    /// Retrieves the neighbors of a given vertex.
    ///
    /// - Parameter vertex: The vertex whose neighbors are to be retrieved.
    /// - Returns: An array of neighboring vertices.
    public func neighbors(of vertex: T) -> [T] {
        adjacencyList[vertex] ?? []
    }

    /// Performs Breadth-First Search (BFS) starting from a given vertex.
    ///
    /// - Parameter start: The starting vertex for the BFS.
    /// - Returns: An array of vertices visited during the BFS in the order they were visited.
    public func bfs(from start: T) -> [T] {
        guard adjacencyList[start] != nil else { return [] }

        var visited: Set<T> = []
        var queue: [T] = [start]
        var result: [T] = []

        while !queue.isEmpty {
            let current = queue.removeFirst()

            if !visited.contains(current) {
                visited.insert(current)
                result.append(current)
                queue.append(contentsOf: neighbors(of: current).filter { !visited.contains($0) })
            }
        }
        return result
    }

    /// Performs Depth-First Search (DFS) starting from a given vertex.
    ///
    /// - Parameter start: The starting vertex for the DFS.
    /// - Returns: An array of vertices visited during the DFS in the order they were visited.
    public func dfs(from start: T) -> [T] {
        guard adjacencyList[start] != nil else { return [] }

        var visited: Set<T> = []
        var result: [T] = []

        func dfsVisit(_ vertex: T) {
            if visited.contains(vertex) { return }
            visited.insert(vertex)
            result.append(vertex)

            for neighbor in neighbors(of: vertex) {
                dfsVisit(neighbor)
            }
        }

        dfsVisit(start)
        return result
    }

    /// Description of the graph
    public var description: String {
        var description = String()
        for (vertex, neighbors) in adjacencyList {
            description += ("\(vertex) -> \(neighbors)\n")
        }

        return description
    }
}
