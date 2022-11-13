//
//  ContentView.swift
//  InstagramInterface
//
//  Created by jhoan sebastian franco cardona on 12/11/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ScrollView{
                VStack{
                    Text("Jhoan")
                }
                .toolbar {
                    toolbarView()
                }
            }
        }
    }
    @ToolbarContentBuilder
    func toolbarView() -> some ToolbarContent{
        ToolbarItem(placement: .navigationBarLeading) {
            Button(action: {}) {
                Image("camera-Icon")
            }
        }
        ToolbarItem(placement: .principal) {
            Image("instagram-logo")
        }
        ToolbarItem(placement: .navigationBarTrailing) {
            HStack{
                Button(action: {}) {
                    Image("igtv")
                }
                Button(action: {}) {
                    Image("messanger")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
