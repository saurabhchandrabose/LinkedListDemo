//
//  CustomButton.swift
//  LinkedListDemo
//
//  Created by Saurabh Chandra Bose on 11/10/20.
//  Copyright © 2020 Saurabh Chandra Bose. All rights reserved.
//

import SwiftUI

struct CustomButton: View {
    let title: String
    let imageName: String
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            self.action()
        }) {
            Text(title).font(.body)
            Image(systemName: imageName)
        }
        .frame(width: 150, height: 30, alignment: .center)
        .padding()
        .foregroundColor(.orange)
        .background(Color.black)
        .cornerRadius(12)
    }
}
