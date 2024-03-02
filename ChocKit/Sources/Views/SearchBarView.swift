
//
//  SearchTextView.swift
//  FlickrApp
//
//  Created by Alex Vaiman on 26/02/2024.
//

/*The SearchBarView is a customizable SwiftUI search bar component designed for simple search functionality within iOS applications. It offers flexibility in styling, supports clear button functionality*/
                                                                                
import SwiftUI

public struct SearchBarView: View {
    
    public enum SearchBarViewStyle {
        case standard
        case shadow(shadow: ChockShadow = ChockShadow(radius: 8, opacity: 0.7))
    }
    
    @Binding var searchText: String
    private let height: CGFloat
    private let placeholder: String
    private let textColor: Color
    private let placeholderTextColor: Color
    private let backgroundColor: Color
    private let accentColor: Color
    private let style: SearchBarViewStyle

    public init(searchText: Binding<String>, placeholder: String = "Search", textColor: Color = .black, placeholderTextColor: Color = .gray, backgroundColor: Color = .white, accentColor: Color = .black, style: SearchBarViewStyle = .standard, height: CGFloat = 8) {
        self._searchText = searchText
        self.placeholder = placeholder
        self.textColor = textColor
        self.placeholderTextColor = placeholderTextColor
        self.backgroundColor = backgroundColor
        self.accentColor = accentColor
        self.style = style
        self.height = height
    }

    public var body: some View {
        switch style {
        case .standard:
            standard
        case .shadow(let shadow):
            self.shadow(shadow: shadow)
        }
    }
    
    private var standard: some View {
        searchBarNoFrame
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(accentColor, lineWidth: 2)
                    .background(backgroundColor)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
            )
        
    }
    
    private func shadow(shadow: ChockShadow) -> some View {
        searchBarNoFrame
            .background(
                RoundedRectangle(cornerRadius: 25)
                    .fill(backgroundColor)
                    .shadow(
                        color: accentColor.opacity(shadow.opacity),
                        radius: shadow.radius, x: shadow.x, y: 5
                    )
            )
    }
    
    private var searchBarNoFrame: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(
                    searchText.isEmpty ?
                    placeholderTextColor : accentColor
                )
            
            TextField("", text: $searchText, prompt: Text(placeholder).foregroundColor(placeholderTextColor))
                .foregroundStyle(textColor)
                .disableAutocorrection(true)
                .keyboardType(.alphabet)
                .overlay(
                    Image(systemName: "xmark.circle.fill")
                        .padding(height)
                        .offset(x: height)
                        .foregroundColor(accentColor)
                        .opacity(searchText.isEmpty ? 0.0 : 1.0)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            UIApplication.shared.endEditing()
                            searchText = ""
                        }
                    
                    ,alignment: .trailing
                )
        }
        .font(.headline)
        .padding(height)
    }
}

public struct SearchBarView_Previews: PreviewProvider, View {
    @State private var searchText = ""

    public static var previews: some View {
        Self()
    }

    public var body: some View {
        Group {
            SearchBarView(searchText: $searchText, backgroundColor: .white, style: .shadow())
                .padding()
                .previewLayout(.sizeThatFits)
            SearchBarView(searchText: $searchText, backgroundColor: .white)
                .padding()
                .previewLayout(.sizeThatFits)
        }
    }
}

