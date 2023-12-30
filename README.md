# SwiftUI - ScrollWhenNeededView
A view that conditionally enables vertical scrolling for it's content.  This view automatically detects if the content exceeds the available height. It enables scrolling when necessary and can optionally center the content vertically. It's designed to dynamically adjust to content size, including responsiveness to accessibility font size changes.

## Installation
Requirements:

- iOS 16+
- macOS 13+
- watchOS 9+

### Swift Package Manager
1. In Xcode, open your project and navigate to File → Add Package Dependencies...
2. Paste in the repository URL (github.com/mcolojr/ScrollWhenNeededView).
3. For Rules, select version.
4. Click Add Package.

## How to Use
Import the ScrollWhenNeededView package to your .swift file:
```swift
import ScrollWhenNeededView
```

Use it like you would a `ScrollView`:
```swift
ScrollWhenNeededView {
    // content here
}

ScrollWhenNeededView(shouldCenterContentVertically: false) {
    // content here
}
```

## Contribute
You can contribute to this project by helping me solve any [reported issues or feature requests](https://github.com/mcolojr/ScrollWhenNeededView/issues) and creating a pull request.

## License
ScrollWhenNeededView is released under the [MIT License](https://github.com/mcolojr/ScrollWhenNeededView/blob/main/LICENSE).
