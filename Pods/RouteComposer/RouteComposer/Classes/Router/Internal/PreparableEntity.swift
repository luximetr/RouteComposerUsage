//
// Created by Eugene Kazaev on 2018-11-06.
//

import Foundation

protocol PreparableEntity {

    var isPrepared: Bool { get }

}

extension PreparableEntity {

    func assertIfNotPrepared() {
        if !isPrepared {
            assertionFailure("Internal inconsistency: prepare(with:) method has never been " +
                    "called for \(String(describing: self)).")
        }
    }

}
