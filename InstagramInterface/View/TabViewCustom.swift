//
//  TabViewCustom.swift
//  InstagramInterface
//
//  Created by jhoan sebastian franco cardona on 16/11/22.
//

import SwiftUI

enum TabViewIcons: String, CaseIterable{
    case home
    case magnifier
    case plusIcon = "plus-icon"
    case heart
    case profile
}

struct TabViewCustom: View {
    @State private var selectedTab: TabViewIcons = .home
    
    var icons: [TabViewIcons] = {
        var icon = TabViewIcons.allCases
        icon.removeLast()
        return icon
    }()
    
    init(){
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTab) {
                ContentView()
                    .tag(TabViewIcons.home)
                    .ignoresSafeArea()
                Color.red
                    .tag(TabViewIcons.magnifier)
                    .ignoresSafeArea()
                Color.blue
                    .tag(TabViewIcons.plusIcon)
                    .ignoresSafeArea()
                Color.pink
                    .tag(TabViewIcons.heart)
                    .ignoresSafeArea()
                Color.yellow
                    .tag(TabViewIcons.profile)
                    .ignoresSafeArea()
            }
            VStack(spacing: 0) {
                Divider().overlay(Color("primary")).frame(height: 1).opacity(0.4)
                HStack{
                    ForEach(icons, id: \.self){ item in
                        Button {
                            selectedTab = item
                        } label: {
                            let selected = item == selectedTab ? "-selected" : ""
                            Image(item.rawValue+selected)
                                .renderingMode(.template)
                                .foregroundColor(Color("primary"))
                        }
                        Spacer()
                    }
                    Button {
                        selectedTab = .profile
                    } label: {
                        Image("person-3")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 23, height: 23)
                            .clipShape(Circle())
                            .overlay(
                                Circle()
                                    .stroke(Color("primary"))
                                    .opacity(selectedTab == .profile ? 0.5 : 0.1)
                                    .padding(-4)
                            )
                    }

                }
                .padding(.top, 10)
                .padding(.horizontal, 26)
                .background(Color("tabBar-bg"))
            .frame(maxWidth: .infinity, alignment: .center)
            }
        }
    }
}

struct TabViewCustom_Previews: PreviewProvider {
    static var previews: some View {
        TabViewCustom()
    }
}
