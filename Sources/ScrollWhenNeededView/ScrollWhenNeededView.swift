//
//  ScrollWhenNeededView.swift
//
//
//  Created by Michael Colonna on 12/27/23.
//

import SwiftUI
import OSLog

/// A view that conditionally enables vertical scrolling for it's content.
///
/// This view automatically detects if the content exceeds the available height.
/// It enables scrolling when necessary and can optionally center the content vertically.
/// It's designed to dynamically adjust to content size, including responsiveness to accessibility font size changes.
public struct ScrollWhenNeededView<Content: View>: View {
    
    // MARK: - Properties
    // MARK: Private Properties
    @State private var contentHeight: CGFloat = 0
    @State private var shouldScroll: Bool = false
    
    // MARK: Accessible Properties
    /// Determines whether the content should be centered vertically in the container
    public let shouldCenterContentVertically: Bool
    
    /// The content of the view
    public let content: () -> Content

    // MARK: - Init
    /// Initializes the view with specified content and centering behavior
    ///
    /// - Parameters:
    ///   - shouldCenterContentVertically: A Boolean value indicating whether the content should be centered vertically.
    ///   - content: A closure returning the content of the view.
    public init(shouldCenterContentVertically: Bool = true, @ViewBuilder content: @escaping () -> Content) {
        self.shouldCenterContentVertically = shouldCenterContentVertically
        self.content = content
    }

    // MARK: - Views
    // MARK: Body
    public var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical, showsIndicators: shouldScroll) {
                content()
                    .background(GeometryReader { contentGeometry in
                        Color.clear
                            .onAppear {
                                updateContentHeight(with: contentGeometry.size.height, containerHeight: geometry.size.height)
                            }
                            .onChange(of: contentGeometry.size.height) { newHeight in
                                updateContentHeight(with: newHeight, containerHeight: geometry.size.height)
                            }
                    })
                .frame(minHeight: shouldCenterContentVertically ? geometry.size.height : 0)
            }
            .frame(height: geometry.size.height)
            .scrollDisabled(!shouldScroll)
        }
    }

    // MARK: - Private Methods
    /// Updates the content height and determines if scrolling is needed
    ///
    /// This method is responsive to changes in content size, including dynamic adjustments for accessibility font size changes.
    ///
    /// - Parameters:
    ///   - height: The height of the content.
    ///   - containerHeight: The height of the container.
    private func updateContentHeight(with height: CGFloat, containerHeight: CGFloat) {
        Logger.init(subsystem: "ScrollWhenNeededView", category: "ScrollView").debug(
            "Content Height: \(height); Container Height: \(containerHeight)"
        )

        DispatchQueue.main.async {
            let tolerance: CGFloat = 0.01  // A small tolerance to account for floating-point precision errors

            if shouldCenterContentVertically && (height < containerHeight || abs(height - containerHeight) < tolerance) {
                contentHeight = containerHeight
            } else {
                contentHeight = height
            }
            
            shouldScroll = contentHeight > containerHeight + tolerance
        }
    }
}
