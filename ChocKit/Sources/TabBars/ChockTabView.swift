//
//  TabBarViewBuilder.swift
//  Catalog
//
//  Created by Nick Sarno on 11/13/21.
//

import SwiftUI

/// Custom tab bar with lazy loading.
///
/// Tabs are loaded lazily, as they are selected. Each tab's .onAppear will only be called on first appearance. Set DisplayStyle to .vStack to position TabBar vertically below the Content. Use .zStack to put the TabBar in front of the Content .
public struct ChockTabView<Content:View, TabBar: View>: View, KeyboardReadable {
    
    public enum DisplayStyle {
        case vStack
        case zStack
    }
    
    @State private var isKeyboardVisible = false
    let style: DisplayStyle
    let content: Content
    let tabBar: TabBar
    
    public init(
        style: DisplayStyle = .vStack,
        @ViewBuilder content: () -> Content,
        @ViewBuilder tabBar: () -> TabBar) {
            self.style = style
            self.content = content()
            self.tabBar = tabBar()
        }
    
    public var body: some View {
        layout
    }
    
    @ViewBuilder var layout: some View {
        switch style {
        case .vStack:
            VStack(spacing: 0) {
                ZStack {
                    content
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                if !isKeyboardVisible {
                    tabBar
                }
            }
        case .zStack:
            ZStack(alignment: .bottom) {
                content
                
                if !isKeyboardVisible {
                    tabBar
                }
            }
        }
    }
}

struct TabBarViewBuilder_Previews: PreviewProvider {
    
    struct PreviewView: View {
        @State var selection: ChockBarItem = ChockBarItem(title: "Home", iconName: "heart.fill")
        @State private var tabs: [ChockBarItem] = [
            ChockBarItem(title: "Home", iconName: "heart.fill", badgeCount: 2),
            ChockBarItem(title: "Browse", iconName: "magnifyingglass"),
            ChockBarItem(title: "Discover", iconName: "globe", badgeCount: 100),
            ChockBarItem(title: "Profile", iconName: "person.fill")
        ]
        
        var body: some View {
            ZStack {
                Color.indigo.ignoresSafeArea().opacity(0.3)
                ChockTabView {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.blue)
                        .tabBarItem(tab: tabs[0], selection: selection)
                        .edgesIgnoringSafeArea(.all)
                    
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.red)
                        .onAppear {
                            tabs[0].updateBadgeCount(to: 20)
                        }
                        .tabBarItem(tab: tabs[1], selection: selection)
                        .edgesIgnoringSafeArea(.all)
                    
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.orange)
                        .tabBarItem(tab: tabs[2], selection: selection)
                        .edgesIgnoringSafeArea(.all)
                    
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.green)
                        .tabBarItem(tab: tabs[3], selection: selection)
                        .edgesIgnoringSafeArea(.all)
                    
                } tabBar: {
                    ChockBarDefaultView(
                        tabs: tabs,
                        selection: $selection,
                        accentColor: .red,
                        defaultColor: .white,
                        backgroundColor: .indigo,
                        font: .subheadline,
                        iconSize: 20,
                        spacing: 6,
                        insetPadding: 12,
                        outerPadding: 12,
                        cornerRadius: 30,
                        shadow: ChockShadow(radius: 8, color: .black, y:  5))
                    
                }
            }
        }
    }
    
    static var previews: some View {
        PreviewView()
    }
}
