//
//  UIViewWrapper.swift
//  BridgeUI
//
//  Created by Micah Burnside on 10/16/24.
//


import SwiftUI
import UIKit

// A generic wrapper for any UIView
@available(iOS 13.0, *)
public struct UIViewWrapper<UIViewType: UIView>: UIViewRepresentable {
    
    // Closures for creating and updating the UIView
    private let makeUIViewClosure: () -> UIViewType
    private let updateUIViewClosure: (UIViewType) -> Void
    
    // Initializer takes closures for creating and updating the UIView
    public init(makeUIView: @escaping () -> UIViewType, updateUIView: @escaping (UIViewType) -> Void = { _ in }) {
        self.makeUIViewClosure = makeUIView
        self.updateUIViewClosure = updateUIView
    }

    // Creates the UIView instance for SwiftUI
    public func makeUIView(context: Context) -> UIViewType {
        return makeUIViewClosure()
    }
    
    // Updates the UIView when SwiftUI state changes
    public func updateUIView(_ uiView: UIViewType, context: Context) {
        updateUIViewClosure(uiView)
    }
}
