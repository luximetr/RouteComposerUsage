//
//  ContextTask.swift
//  RouteComposer
//
//  Created by Eugene Kazaev on 27/02/2018.
//

import Foundation
import UIKit

/// The task to be applied after a `UIViewController` was created or found.
public protocol ContextTask {

    /// A`UIViewController` type associated with this `ContextTask`
    associatedtype ViewController: UIViewController

    /// A Context type associated with this `ContextTask`
    associatedtype Context

    /// The `Router` will call this method before the navigation process. If the `ContextTask` is not able to
    /// be applied to a view controller it should throw an exception.
    ///
    /// - Parameters:
    ///   - context: The `Context` instance provided to the `Router`
    /// - Throws: The `RoutingError` if `ContextTask` can't be applied.
    mutating func prepare(with context: Context) throws

    /// The method that will be called by the `Router` to run `ContextTask` immediately after `UIViewController` been created
    /// or found
    ///
    /// - Parameters:
    ///   - viewController: The `UIViewController` instance described in the step that `ContextTask` attached to
    ///   - context: The `Context` instance that was passed to the `Router`
    func apply(on viewController: ViewController, with context: Context) throws

}

public extension ContextTask {

    /// Default implementation does nothing
    mutating func prepare(with context: Context) throws {

    }

}

public extension ContextTask where Context == Any? {

    /// The `Router` will call this method before the navigation process. If the `ContextTask` is not able to
    /// be applied to a view controller it should throw an exception.
    ///
    /// - Throws: The `RoutingError` if `ContextTask` can't be applied.
    mutating func prepare() throws {
        try prepare(with: nil)
    }

    /// The method that will be called by the `Router` to run `ContextTask` immediately after `UIViewController` been created
    /// or found
    ///
    /// - Parameters:
    ///   - viewController: The `UIViewController` instance described in the step that `ContextTask` attached to
    func apply(on viewController: ViewController) throws {
        try apply(on: viewController, with: nil)
    }

}

public extension ContextTask where Context == Void {

    /// The `Router` will call this method before the navigation process. If the `ContextTask` is not able to
    /// be applied to a view controller it should throw an exception.
    ///
    /// - Throws: The `RoutingError` if `ContextTask` can't be applied.
    mutating func prepare() throws {
        try prepare(with: ())
    }

    /// The method that will be called by the `Router` to run `ContextTask` immediately after `UIViewController` been created
    /// or found
    ///
    /// - Parameters:
    ///   - viewController: The `UIViewController` instance described in the step that `ContextTask` attached to
    func apply(on viewController: ViewController) throws {
        try apply(on: viewController, with: ())
    }

}
