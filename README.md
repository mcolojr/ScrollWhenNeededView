# ScrollWhenNeededView
A view that conditionally enables vertical scrolling for it's content.  This view automatically detects if the content exceeds the available height. It enables scrolling when necessary and can optionally center the content vertically. It's designed to dynamically adjust to content size, including responsiveness to accessibility font size changes.

## How to Use
Use it like you would a `ScrollView`.
```swift
ScrollWhenNeededView {
    // content here
}

ScrollWhenNeededView(shouldCenterContentVertically: false) {
    // content here
}
```
