//
// Created by Eugene Kazaev on 31/08/2018.
//

import Foundation
import UIKit

/// Helper class to build a chain of steps. Can not be used directly.
public struct LastStepInChainAssembly<ViewController: UIViewController, Context> {

    let previousSteps: [RoutingStep]

    init(previousSteps: [RoutingStep]) {
        self.previousSteps = previousSteps
    }

    /// Assembles all the provided settings.
    ///
    /// - Returns: The instance of `DestinationStep` with all the settings provided inside.
    public func assemble() -> DestinationStep<ViewController, Context> {
        return DestinationStep(chain(previousSteps))
    }

    private func chain(_ steps: [RoutingStep]) -> RoutingStep {
        guard let lastStep = steps.last else {
            fatalError("No steps provided to chain.")
        }

        let firstStep = steps.dropLast().reversed().reduce(lastStep, { (result, currentStep) in
            guard var step = currentStep as? BaseStep else {
                assertionFailure("\(currentStep) can not be chained to non chainable step \(result)")
                return currentStep
            }
            step.from(result)
            return step
        })

        return firstStep
    }

}
