//
//  ExpandableDescription.swift
//  Voltis Labs
//
//  Created by Macintosh HD on 21/02/2025.
//

import SwiftUI

struct ExpandableDescription: View {
    let prefix: String
    let description: String

    @State private var expanded: Bool = false
    @State private var fullHeight: CGFloat = 0
    @State private var truncatedHeight: CGFloat = 0

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            ZStack(alignment: .bottomTrailing) {
                (Text(prefix + " ")
                    .foregroundColor(.vlBrown)
                    .font(.system(size: 14))
                    .fontWeight(.semibold)
                 + styledText(from: description))
                    .lineLimit(expanded ? nil : 4)
                    .background(
                        GeometryReader { geo in
                            Color.clear
                                .onAppear {
                                    if expanded {
                                        fullHeight = geo.size.height
                                    } else {
                                        truncatedHeight = geo.size.height
                                    }
                                }
                                .onChange(of: geo.size.height) { newHeight in
                                    if expanded {
                                        fullHeight = newHeight
                                    } else {
                                        truncatedHeight = newHeight
                                    }
                                }
                        }
                    )
                
          
                if !expanded && fullHeight > truncatedHeight {
                    Button(action: {
                        withAnimation {
                            expanded = true
                        }
                    }) {
                        Text("Read more")
                            .foregroundColor(.vlBrown)
                            .font(.system(size: 14))
                            .fontWeight(.medium)
                            .padding(4)
                            .background(Color.white)
                    }
                    // Adjust these paddings as needed so the button sits at the end of the 4th line.
                    .padding(.trailing, 2)
                    .padding(.bottom, 2)
                }
            }
            
            // When expanded, show a "Show less" button below.
            if expanded && (fullHeight > truncatedHeight) {
                Button(action: {
                    withAnimation {
                        expanded = false
                    }
                }) {
                    Text("Show less")
                        .foregroundColor(.vlBrown)
                        .font(.system(size: 14))
                        .fontWeight(.medium)
                }
            }
        }
    }

    func styledText(from text: String) -> Text {
        if let firstRange = text.range(of: "product") {
            if let secondRange = text.range(of: "product", range: firstRange.upperBound..<text.endIndex) {
                let before = String(text[..<secondRange.lowerBound])
                let word = String(text[secondRange])
                let after = String(text[secondRange.upperBound...])
                
                return Text(before).foregroundColor(.vlBrown)
                    .font(.system(size: 14))
                    + Text(word).foregroundColor(.blue)
                    .font(.system(size: 14))
                    + Text(after).foregroundColor(.vlBrown)
                    .font(.system(size: 14))
            }
        }
        return Text(text).foregroundColor(.vlBrown)
    }
    }


