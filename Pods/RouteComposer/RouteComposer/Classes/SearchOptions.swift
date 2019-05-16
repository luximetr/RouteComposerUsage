//
// Created by Eugene Kazaev on 04/09/2018.
//

import Foundation

/// A set of options for the `findViewController` method
public struct SearchOptions: OptionSet, CaseIterable, CustomStringConvertible {

    public let rawValue: Int

    public init(rawValue: Int) {
        self.rawValue = rawValue
    }

    /// Compare to a view controller provided
    public static let current = SearchOptions(rawValue: 1 << 0)

    /// If a view controller is a container, search in its visible view controllers
    public static let visible = SearchOptions(rawValue: 1 << 1)

    /// If a view controller is a container, search in all the view controllers it contains
    public static let contained = SearchOptions(rawValue: 1 << 2)

    /// Start search from the view controller provided and search in all view controllers it presented
    public static let presented = SearchOptions(rawValue: 1 << 3)

    /// Start search from the view controller provided and search in all view controllers that are presenting it
    public static let presenting = SearchOptions(rawValue: 1 << 4)

    /// Start search from the view controller provided and search in all its parent view controllers
    public static let parent = SearchOptions(rawValue: 1 << 5)

    /// If a view controller is a container, search in all the view controllers it contains
    public static let currentAllStack: SearchOptions = [.current, .contained]

    /// If a view controller is a container, search in all visible view controllers it contains
    public static let currentVisibleOnly: SearchOptions = [.current, .visible]

    /// Iterate through the all visible view controllers in the stack.
    public static let allVisible: SearchOptions = [.currentVisibleOnly, .presented, .presenting]

    /// Iterate through the all view controllers in the stack.
    public static let fullStack: SearchOptions = [.current, .contained, .presented, .presenting]

    /// Iterate through the all view controllers on the current level and all the view controllers
    /// presented from the current level.
    public static let currentAndUp: SearchOptions = [.currentAllStack, .presented]

    /// Iterate through the all view controllers on the current level and all the view controllers
    /// that are presenting the current level.
    public static let currentAndDown: SearchOptions = [.currentAllStack, .presenting]

    public static var allCases: [SearchOptions] {
        return [.current, .visible, .contained, .presented, .presenting, .parent]
    }

    public var description: String {
        return [SearchOptions.current, .visible, .contained, .presented, .presenting, .parent].compactMap({ option in
            guard self.contains(option) else {
                return nil
            }
            switch option {
            case .current: return "current"
            case .visible: return "visible"
            case .contained: return "contained"
            case .presented: return "presented"
            case .presenting: return "presenting"
            case .parent: return "parent"
            default:
                assertionFailure("Unknown SearchOptions")
                return nil
            }
        }).joined(separator: ", ")
    }

}
