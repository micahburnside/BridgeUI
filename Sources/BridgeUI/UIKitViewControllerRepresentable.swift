import SwiftUI
import UIKit

// Generic UIViewControllerRepresentable for any UIViewController
@available(iOS 13.0, *)
public struct UIKitViewControllerRepresentable<ViewController: UIViewController>: UIViewControllerRepresentable {

    // The initializer takes a closure that creates the desired ViewController
    private let makeViewController: () -> ViewController
    
    public init(_ makeViewController: @escaping () -> ViewController) {
        self.makeViewController = makeViewController
    }

    // This function makes the UIViewController that SwiftUI will present
    public func makeUIViewController(context: Context) -> ViewController {
        return makeViewController()
    }
    
    // This function updates the UIViewController (if needed)
    public func updateUIViewController(_ uiViewController: ViewController, context: Context) {
        // Typically not used unless the UIKit view controller needs to react to SwiftUI changes
    }
}
