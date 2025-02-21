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

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            (Text(prefix + " ")
                .font(.system(size: 14))
                .foregroundColor(.vlBrown)
                .fontWeight(.semibold)
             + styledText(from: description))
                .lineLimit(expanded ? nil : 4)
                .animation(.linear, value: expanded)
            
            Button(action: {
                withAnimation(.linear) {
                    expanded.toggle()
                }
            }) {
                Text(expanded ? "Show less" : "Read more")
                    .font(.system(size: 14))
                    .fontWeight(.medium)
                    .foregroundColor(.vlBrown)
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


