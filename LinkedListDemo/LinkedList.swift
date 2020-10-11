//
//  LinkedList.swift
//  LinkedListDemo
//
//  Created by Saurabh Chandra Bose on 11/10/20.
//  Copyright © 2020 Saurabh Chandra Bose. All rights reserved.
//

import Foundation

// MARK: - Node

public class Node<T> {
    var value: T
    var next: Node<T>?
    weak var previous: Node<T>?
    
    init(value: T) {
        self.value = value
    }
}


// MARK: - LinkedList

public class LinkedList<T>: CustomStringConvertible {
    
    fileprivate var head: Node<T>?
    private var tail: Node<T>?
    
    public var isEmpty: Bool {
        head == nil
    }
    
    public var first: Node<T>? {
        head
    }
    
    public var last: Node<T>? {
        tail
    }
    
    public var description: String {
        var text = "["
        var node = head
        
        while node != nil {
            text += "\(node!.value)"
            node = node?.next
            if node != nil {
                text += ", "
            }
        }
        
        return text + "]"
    }
    
    public func append(value: T) {
        let newNode = Node(value: value)
        
        if let lastNode = tail {
            lastNode.next = newNode
            newNode.previous = lastNode
        } else {
            head = newNode
        }
        tail = newNode
    }

    
    public func nodeAt(index: Int) -> Node<T>? {
        if index >= 0 {
            var currentNode = head
            var currentIndex = index
            
            while currentNode != nil {
                if currentIndex == 0 {
                    return currentNode
                }
                currentIndex -= 1
                currentNode = head!.next
            }
        }
        
        return nil
    }
    
    public func removeAll() {
        head = nil
        tail = nil
    }
    
    public func remove(node: Node<T>) -> T {
        let next = node.next
        let previous = node.previous
        
        if let prev = previous {
            prev.next = next
        } else {
            head = next
        }
        
        if let next = next {
            next.previous = previous
        } else {
            tail = previous
        }
        
        node.previous = nil
        node.next = nil
        
        return node.value
    }
    
    
}


