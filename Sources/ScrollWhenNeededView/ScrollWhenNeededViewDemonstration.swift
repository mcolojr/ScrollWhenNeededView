//
//  ScrollWhenNeededViewDemonstration.swift
//
//
//  Created by Michael Colonna on 12/27/23.
//

import SwiftUI

struct ScrollWhenNeededViewDemonstration: View {
    
    // MARK: - Properties
    // MARK: Private Properties
    @State private var itemCount: Int = 10

    // MARK: - Views
    // MARK: Body
    var body: some View {
        NavigationStack {
            ScrollWhenNeededView {
                VStack {
                    #if os(watchOS)
                    HStack {
                        Button(action: { itemCount = max(itemCount - 1, 0) }) {
                            Text("-")
                        }
                        .padding()
                        
                        Button(action: { itemCount += 1 }) {
                            Text("+")
                        }
                        .padding()
                    }
                    #else
                    Stepper("Number of Items: \(itemCount)", value: $itemCount, in: 0...30)
                        .padding()
                    #endif
                    
                    ForEach(0..<itemCount, id: \.self) { index in
                        Text("Item \(index)").padding()
                            .frame(maxWidth: .infinity)
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .navigationTitle("ScrollWhenNeededView")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

// MARK: - Preview
struct ScrollWhenNeededViewDemonstration_Previews: PreviewProvider {
    static var previews: some View {
        ScrollWhenNeededViewDemonstration()
    }
}
