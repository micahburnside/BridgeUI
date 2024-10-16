# BridgeUI

**BridgeUI** is a Swift package that provides an easy and reusable way to integrate `UIKit` components into `SwiftUI`. It allows developers to wrap any `UIViewController` or `UIView` and display them seamlessly in a SwiftUI view, simplifying the reuse of existing UIKit code within a SwiftUI project.

## Features

- **Generic `UIViewControllerRepresentable`**: Wrap and embed any `UIViewController` in SwiftUI.
- **Generic `UIViewRepresentable`**: Embed any `UIView` inside a SwiftUI view.
- Provides easy-to-use, reusable code for integrating UIKit components into SwiftUI without boilerplate.
- Extensible to fit various UIKit components like `UILabel`, `UIButton`, or custom view controllers.

## Installation

You can integrate **BridgeUI** using Swift Package Manager (SPM).

### Swift Package Manager

To add **BridgeUI** to your Swift project:

1. In Xcode, select **File > Swift Packages > Add Package Dependency**.
2. Enter the URL of this repository.
3. Choose the latest version and add it to your project.

## Usage

### Embedding a `UIViewController` in SwiftUI

To embed a `UIViewController` into SwiftUI, you can use the `UIKitViewControllerRepresentable` struct. Here’s an example:

```swift
import SwiftUI
import BridgeUI  // Import the BridgeUI package

// Example UIViewController to be embedded
class ExampleViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
    }
}

// Use the generic wrapper from BridgeUI in your SwiftUI view
struct ContentView: View {
    var body: some View {
        VStack {
            Text("SwiftUI View with UIKit ViewController")
            
            // Embedding ExampleViewController using BridgeUI
            UIKitViewControllerRepresentable {
                ExampleViewController()
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}

### Embedding a `UIView` in SwiftUI

You can also embed a UIView into SwiftUI using the UIViewWrapper struct from BridgeUI:

import SwiftUI
import BridgeUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("SwiftUI View with UIKit UILabel")
            
            // Embedding UILabel using UIViewWrapper from BridgeUI
            UIViewWrapper(makeUIView: {
                let label = UILabel()
                label.text = "This is a UILabel from UIKit"
                label.textColor = .red
                label.textAlignment = .center
                return label
            })
            .frame(height: 50)
            .padding()
        }
    }
}
