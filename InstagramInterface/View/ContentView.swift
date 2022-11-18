//
//  ContentView.swift
//  InstagramInterface
//
//  Created by jhoan sebastian franco cardona on 12/11/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var viewModel = ViewModel()
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(named: "tabBar-bg")
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                Divider()
                    .overlay(
                        Color("primary")
                            .frame(height: 1)
                            .opacity(0.4)
                    )
                ScrollView{
                    VStack{
                        storyList
                        Divider()
                            .overlay(
                                Color("primary")
                                    .frame(height: 1)
                                    .opacity(0.4)
                            )
                        ForEach(viewModel.timelineList){ timeline in
                            TimeLineView(timeLine: timeline)
                        }
                        Color.clear.padding(.bottom, 25)
                    }
                    .toolbar {
                        toolbarView()
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    var storyList: some View{
        ScrollView(.horizontal, showsIndicators: false) {
            HStack{
                ForEach(viewModel.storyList){ story in
                    StoryView(story: story)
                }
            }
            .padding(.leading, 20)
            .padding(.vertical, 8)
        }
    }
    
    @ToolbarContentBuilder
    func toolbarView() -> some ToolbarContent{
        ToolbarItem(placement: .navigationBarLeading) {
            Button(action: {}) {
                Image("camera-Icon")
                    .renderingMode(.template)
                    .foregroundColor(Color("primary"))
            }
        }
        ToolbarItem(placement: .principal) {
            Image("instagram-logo")
                .renderingMode(.template)
                .foregroundColor(Color("primary"))
        }
        ToolbarItem(placement: .navigationBarTrailing) {
            HStack{
                Button(action: {}) {
                    Image("igtv")
                        .renderingMode(.template)
                        .foregroundColor(Color("primary"))
                }
                Button(action: {}) {
                    Image("messanger")
                        .renderingMode(.template)
                        .foregroundColor(Color("primary"))
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
