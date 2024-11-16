import Testing
@testable import DataStructuresFramework

struct StackTest {

    @Test func addElements() async throws {
        var stack = Stack<Int>()
        stack.push(1)
        stack.push(2)
        stack.push(3)
        #expect(stack.description == "3\n2\n1")
    }

    @Test func deleteElements() async throws {
        var stack = Stack<Int>()
        stack.push(1)
        stack.push(2)
        stack.push(3)
        #expect(stack.pop() == 3)
        #expect(stack.pop() == 2)
        #expect(stack.pop() == 1)
        #expect(stack.isEmpty)
    }

    @Test func deleteElementsInEmptyStack() async throws {
        var stack = Stack<Int>()
        #expect(stack.pop() == nil)
    }

    @Test func isEmpty() async throws {
        var stack = Stack<Int>()
        #expect(stack.isEmpty)
        stack.push(1)
        #expect(!stack.isEmpty)
    }
}
