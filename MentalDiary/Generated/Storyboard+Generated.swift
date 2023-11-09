// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

// swiftlint:disable sorted_imports
import Foundation
import UIKit

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length implicit_return

// MARK: - Storyboard Scenes

// swiftlint:disable explicit_type_interface identifier_name line_length type_body_length type_name
internal enum Storyboard {
  internal enum Home: StoryboardType {
    internal static let storyboardName = "Home"

    internal static let initialScene = InitialSceneType<MentalDiary.HomeViewController>(storyboard: Self.self)

    internal static let homeViewController = SceneType<MentalDiary.HomeViewController>(storyboard: Self.self, identifier: "HomeViewController")
  }
  internal enum LaunchScreen: StoryboardType {
    internal static let storyboardName = "LaunchScreen"

    internal static let initialScene = InitialSceneType<UIKit.UIViewController>(storyboard: Self.self)
  }
  internal enum Media: StoryboardType {
    internal static let storyboardName = "Media"

    internal static let mediaViewController = SceneType<MentalDiary.MediaViewController>(storyboard: Self.self, identifier: "MediaViewController")
  }
  internal enum Profile: StoryboardType {
    internal static let storyboardName = "Profile"

    internal static let profileViewController = SceneType<MentalDiary.ProfileViewController>(storyboard: Self.self, identifier: "ProfileViewController")
  }
  internal enum Rate: StoryboardType {
    internal static let storyboardName = "Rate"

    internal static let rateViewController = SceneType<MentalDiary.RateViewController>(storyboard: Self.self, identifier: "RateViewController")
  }
  internal enum Share: StoryboardType {
    internal static let storyboardName = "Share"

    internal static let shareViewController = SceneType<MentalDiary.ShareViewController>(storyboard: Self.self, identifier: "ShareViewController")
  }
}
// swiftlint:enable explicit_type_interface identifier_name line_length type_body_length type_name

// MARK: - Implementation Details

internal protocol StoryboardType {
  static var storyboardName: String { get }
}

internal extension StoryboardType {
  static var storyboard: UIStoryboard {
    let name = self.storyboardName
    return UIStoryboard(name: name, bundle: BundleToken.bundle)
  }
}

internal struct SceneType<T: UIViewController> {
  internal let storyboard: StoryboardType.Type
  internal let identifier: String

  internal func instantiate() -> T {
    let identifier = self.identifier
    guard let controller = storyboard.storyboard.instantiateViewController(withIdentifier: identifier) as? T else {
      fatalError("ViewController '\(identifier)' is not of the expected class \(T.self).")
    }
    return controller
  }

  @available(iOS 13.0, tvOS 13.0, *)
  internal func instantiate(creator block: @escaping (NSCoder) -> T?) -> T {
    return storyboard.storyboard.instantiateViewController(identifier: identifier, creator: block)
  }
}

internal struct InitialSceneType<T: UIViewController> {
  internal let storyboard: StoryboardType.Type

  internal func instantiate() -> T {
    guard let controller = storyboard.storyboard.instantiateInitialViewController() as? T else {
      fatalError("ViewController is not of the expected class \(T.self).")
    }
    return controller
  }

  @available(iOS 13.0, tvOS 13.0, *)
  internal func instantiate(creator block: @escaping (NSCoder) -> T?) -> T {
    guard let controller = storyboard.storyboard.instantiateInitialViewController(creator: block) else {
      fatalError("Storyboard \(storyboard.storyboardName) does not have an initial scene.")
    }
    return controller
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
