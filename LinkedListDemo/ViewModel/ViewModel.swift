//
//  ViewModel.swift
//  LinkedListDemo
//
//  Created by Saurabh Chandra Bose on 11/10/20.
//  Copyright © 2020 Saurabh Chandra Bose. All rights reserved.
//

import SwiftUI

class ViewModel: ObservableObject {
    @Published private var model: Model<String> = createList()
    
    static private let listName = "List"
    
    static private func createList() -> Model<String> {
        Model<String>(name: listName, list: LinkedList<String>())
    }
    
    public var descriptionList: String {
        model.list.description
    }
    
    public func add(item: String) {
        model.list.append(value: item)
        changeListName()
    }
    
    public func deleteAll() {
        model.list.removeAll()
        changeListName()
    }
    
    // just to observe changes in model to reflect in view.
    private func changeListName() {
        model.name = ViewModel.listName
    }
    
}




