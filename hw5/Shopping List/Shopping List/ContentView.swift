//
//  ContentView.swift
//  Shopping List
//
//  Created by Tony Hong on 3/11/22.
//

import SwiftUI

struct ContentView: View {
    var fruit_list = [
        Items(image_Name: "banana", item_Name: "Bananas", itemQuantity: 3),
        Items(image_Name: "apple", item_Name: "Apples", itemQuantity: 4),
        Items(image_Name: "strawberries", item_Name: "Strawberries", itemQuantity: 10)
    ]
    var meat_list = [
        Items(image_Name: "samon", item_Name: "Samon", itemQuantity: 3),
        Items(image_Name: "meat", item_Name: "Meat", itemQuantity: 5)
        
    ]
    var other_list = [
        Items(image_Name: "eggs", item_Name: "Eggs", itemQuantity: 12),
        Items(image_Name: "pancakes", item_Name: "Pancakes", itemQuantity: 4)
    ]
    var body: some View {
        NavigationView{
            List{
                Section(header: Text("Fruits")){
                    ForEach(fruit_list){fruit in
                        CustomCell(imageName: fruit.imageName , itemName: fruit.itemName, quantity: fruit.quantity).navigationTitle("ShoppingList")
                        
                    }
                }
                Section(header: Text("Meats")) {
                    ForEach(meat_list){meat in
                        CustomCell(imageName: meat.imageName , itemName: meat.itemName, quantity: meat.quantity)
                    }
                    
                }
                Section(header: Text("Other")) {
                    ForEach(other_list){other in
                        CustomCell(imageName: other.imageName , itemName: other.itemName, quantity: other.quantity)
                    }
                    
                }
            }
        }
    }
}

class Items:Identifiable {
    let imageName: String
    
    let itemName: String
    
    let quantity: Int
    
    init(image_Name: String, item_Name: String, itemQuantity: Int){
        self.imageName = image_Name
        self.itemName = item_Name
        self.quantity = itemQuantity
    }
}
