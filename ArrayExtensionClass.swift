//
//  ArrayExtensionClass.swift
//  Swift-Extension-Sample
//
//  Hind Tech Group (HTG)
//

import Foundation

extension Array where Element: Equatable {
    /// Removes duplicate elements while preserving their original order.
    mutating func removeDuplicates() {
        var result: [Element] = []
        for value in self where !result.contains(value) { result.append(value) }
        self = result
    }

    /// Returns an array containing only unique elements.
    func getUniqueArray() -> [Element] { var copy = self; copy.removeDuplicates(); return copy }

    /// Returns true when the array contains no elements.
    func isEmptyArray() -> Bool { isEmpty }

    /// Returns true when the array contains the supplied element.
    func containsElement(_ element: Element) -> Bool { contains(element) }

    /// Returns the first element matching the supplied element.
    func getFirstElement() -> Element? { first }

    /// Returns the last element in the array.
    func getLastElement() -> Element? { last }

    /// Returns the element at an index without crashing for an invalid index.
    func getElement(at index: Int) -> Element? { indices.contains(index) ? self[index] : nil }

    /// Returns a safe slice of the array for the supplied range.
    func getElements(from: Int, to: Int) -> [Element] {
        guard from >= 0, from < count, to >= from else { return [] }
        return Array(self[from...min(to, count - 1)])
    }

    /// Returns a reversed copy of the array.
    func getReversedArray() -> [Element] { Array(reversed()) }

    /// Returns a shuffled copy without changing the original array.
    func getShuffledArray() -> [Element] { shuffled() }

    /// Returns a random element from the array.
    func getRandomElement() -> Element? { randomElement() }

    /// Returns true when the array has more than one element.
    func hasMultipleElements() -> Bool { count > 1 }

    /// Returns the number of elements in the array.
    func getCount() -> Int { count }

    /// Returns true when the array contains the supplied element.
    func hasElement(_ element: Element) -> Bool { contains(element) }

    /// Removes the first occurrence of the supplied element.
    mutating func removeFirstElement(_ element: Element) { if let index = firstIndex(of: element) { remove(at: index) } }

    /// Removes all occurrences of the supplied element.
    mutating func removeAllElements(_ element: Element) { removeAll { $0 == element } }

    /// Returns the array with one element appended.
    func addingElement(_ element: Element) -> [Element] { self + [element] }

    /// Returns the array with multiple elements appended.
    func addingElements(_ elements: [Element]) -> [Element] { self + elements }

    /// Returns the first element when available, otherwise a supplied default value.
    func getFirstOrDefault(_ defaultValue: Element) -> Element { first ?? defaultValue }

    /// Returns the last element when available, otherwise a supplied default value.
    func getLastOrDefault(_ defaultValue: Element) -> Element { last ?? defaultValue }
}
