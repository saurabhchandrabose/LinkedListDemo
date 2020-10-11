//
//  ContentView.swift
//  LinkedListDemo
//
//  Created by Saurabh Chandra Bose on 11/10/20.
//  Copyright © 2020 Saurabh Chandra Bose. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ViewModel
    @State private var item = ""
    
    var body: some View {
        VStack {
            Spacer()
            TextField("Add item to List", text: $item)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .multilineTextAlignment(.center)
                .font(Font.system(size: 18))
            Spacer()
            CustomButton(title: "Add", imageName: "plus.circle.fill") {
                self.addToList()
            }
            Spacer()
            CustomButton(title: "Remove All", imageName: "trash.fill") {
                self.deleteAllItem()
            }
            Spacer()
            Text(viewModel.descriptionList)
                .font(Font.system(size: 18))
            Spacer()
        }
        .padding()
        .background(Color.orange.opacity(0.7))
        .edgesIgnoringSafeArea(.all)
    }
    
    func addToList() {
        viewModel.add(item: self.item)
    }
    
    func deleteAllItem() {
        viewModel.deleteAll()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ViewModel())
    }
}
