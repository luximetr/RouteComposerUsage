//
//  XibFactory.swift
//  RouteComposer
//
//  Created by Eugene Kazaev on 09/02/2018.
//

import Foundation
import UIKit

/// The `Factory` that creates a `UIViewController` from a Xib file.
public struct XibFactory<VC: UIViewController, C>: Factory {

    public typealias ViewController = VC

    public typealias Context = C

    /// A Xib file name
    public let nibName: String?

    /// A `Bundle` instance
    public let bundle: Bundle?

    /// Constructor
    ///
    /// - Parameters:
    ///   - nibName: A Xib file name
    ///   - bundle: A `Bundle` instance if needed
    public init(nibName: String? = nil, bundle: Bundle? = nil) {
        self.nibName = nibName
        self.bundle = bundle
    }

    public func build(with context: C) throws -> VC {
        let viewController = ViewController(nibName: nibName, bundle: bundle)
        return viewController
    }

}
