//
//  CustomCell.swift
//  Shopping List
//
//  Created by Tony Hong on 3/12/22.
//

import SwiftUI

struct CustomCell: View {
    var imageName: String
    var itemName: String
    var quantity: Int
    var body: some View {
        HStack{
            Image(imageName).resizable()
                .aspectRatio(contentMode:.fit)
                .frame(width: 50, height: 50, alignment: .leading)
            Text(itemName).font(.system(size:20))
            Spacer()
            Text(String(quantity))
                .padding(.trailing,5)
        }
    }
}

