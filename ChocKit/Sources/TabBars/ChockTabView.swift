//
//  TabBarViewBuilder.swift
//  Catalog
//
//  Created by Nick Sarno on 11/13/21.
//

import SwiftUI
import UIKit

/// Set DisplayStyle to .vStack to position TabBar vertically below the Content. Use .zStack to put the TabBar in front of the Content .
/// 
public struct ChockTabView<Content:View, TabBar: View>: View, KeyboardReadable {
    
    public enum DisplayStyle {
        case vStack
        case zStack
    }
    
    @Binding private var selection: String
    @State private var isKeyboardVisible = false
    
    private let style: DisplayStyle
    private let tabBar: TabBar
    private let screenViews: Content
    
    public init(
        selection: Binding<String>,
        style: DisplayStyle = .vStack,
        @ViewBuilder content: @escaping () -> Content,
        @ViewBuilder tabBar: () -> TabBar) {
            self._selection = selection
            self.style = style
            self.screenViews = content()
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
                    getCurrentScreen(content: screenViews)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                if !isKeyboardVisible {
                    tabBar
                }
            }
            .onReceive(keyboardPublisher) { isKeyboardVisible in
                self.isKeyboardVisible  = isKeyboardVisible
            }
            
        case .zStack:
            ZStack(alignment: .bottom) {
                getCurrentScreen(content: screenViews)
                
                if !isKeyboardVisible {
                    tabBar
                }
            }
            .onReceive(keyboardPublisher) { isKeyboardVisible in
                self.isKeyboardVisible  = isKeyboardVisible
            }
        }
    }
}

extension ChockTabView {
    private func getCurrentScreen<Screens: View>(content: Screens) -> some View {
        content.variadic { children in
            children.first { child in
                let tag: String? = child[ChockTag.self].flatMap { $0 as? String }
                return tag == selection
            }
        }
    }
}

struct TabBarViewBuilder_Previews: PreviewProvider {
    

    struct PreviewView: View {
        @State var selection = "Home"
        
        // the default tagID is title, can be overridden. by choosing appropriate init.
        @State private var tabs: [ChockBarItem] = [
            ChockBarItem(title: "Home", systemName: "heart.fill", badgeCount: 2),
            ChockBarItem(title: "Browse", systemName: "magnifyingglass"),
            ChockBarItem(title: "Discover", systemName: "globe", badgeCount: 100),
            ChockBarItem(title: "Profile", systemName: "person.fill")
        ]
        
        var body: some View {
            ZStack {
                Color.indigo.ignoresSafeArea().opacity(0.3)
                ChockTabView(selection: $selection) {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.blue)
                        .edgesIgnoringSafeArea(.all)
                        .chockBarItem(tabs[0].tagID)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                                tabs[0].updateBadgeCount(to: (tabs[0].currentBadgeCount ?? 0) + 1)
                            }
                        }
                        .onDisappear() {
                            
                        }
                    
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.red)
                        .edgesIgnoringSafeArea(.all)
                        .chockBarItem(tabs[1].tagID)
                    
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.orange)
                        .edgesIgnoringSafeArea(.all)
                        .chockBarItem(tabs[2].tagID)
                    
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.green)
                        .edgesIgnoringSafeArea(.all)
                        .chockBarItem(tabs[3].tagID)
                    
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


