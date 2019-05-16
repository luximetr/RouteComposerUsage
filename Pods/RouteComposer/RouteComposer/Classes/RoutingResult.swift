//
// Created by Eugene Kazaev on 19/12/2017.
// Copyright (c) 2017 HBC Tech. All rights reserved.
//

import Foundation

/// The result of the navigation process
///
/// - success: The request to process the navigation resulted in a successful navigation to the destination.
/// - failure: The request to process the navigation was not successful.
public enum RoutingResult {

    /// The request to process the navigation resulted in a successful navigation to the destination.
    case success

    /// The request to process the navigation was not successful.
    case failure(Error)

}

public extension RoutingResult {

    /// Returns `true` if `RoutingResult` is `success`
    var isSuccessful: Bool {
        guard case .success = self else {
            return false
        }
        return true
    }

    /// Returns SDK's `Result` value.
    var value: Result<Void, Error> {
        switch self {
        case .success:
            return .success(())
        case .failure(let error):
            return .failure(error)
        }
    }

    /// Returns the `Error` instance of the `RoutingResult`.
    /// - Throws: The `RoutingError` if `RoutingResult` is `success`.
    func getError() throws -> Error {
        guard case let .failure(error) = self else {
            throw RoutingError.generic(.init("Navigation is successful"))
        }
        return error
    }

}
