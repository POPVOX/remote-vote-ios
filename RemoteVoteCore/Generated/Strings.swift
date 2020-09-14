// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name
public enum Strings {

  public enum Hud {
    public enum Message {
      /// Success
      public static let success = Strings.tr("Localizable", "HUD.message.success")
      public enum Error {
        /// Network Error
        public static let network = Strings.tr("Localizable", "HUD.message.error.network")
      }
    }
  }

  public enum Login {
    public enum Activation {
      /// Click the link to log in.
      public static let directions = Strings.tr("Localizable", "Login.Activation.directions")
      /// (This step helps protect your security)
      public static let explanation = Strings.tr("Localizable", "Login.Activation.explanation")
      /// Check your inbox
      public static let prompt = Strings.tr("Localizable", "Login.Activation.prompt")
    }
    public enum Placeholder {
      public enum TextField {
        /// Email
        public static let email = Strings.tr("Localizable", "Login.placeholder.textField.email")
      }
    }
    public enum Prompt {
      /// Enter email to receive your sign-in link.
      public static let email = Strings.tr("Localizable", "Login.prompt.email")
    }
    public enum Title {
      public enum Button {
        /// Log In
        public static let login = Strings.tr("Localizable", "Login.title.button.login")
      }
    }
  }

  public enum Voting {
    public enum Components {
      public enum Confirmation {
        /// votes “%@” on
        public static func choice(_ p1: Any) -> String {
          return Strings.tr("Localizable", "Voting.Components.Confirmation.choice", String(describing: p1))
        }
        /// Representative %@ %@
        public static func representative(_ p1: Any, _ p2: Any) -> String {
          return Strings.tr("Localizable", "Voting.Components.Confirmation.representative", String(describing: p1), String(describing: p2))
        }
        /// at %@ on %@
        public static func timestamp(_ p1: Any, _ p2: Any) -> String {
          return Strings.tr("Localizable", "Voting.Components.Confirmation.timestamp", String(describing: p1), String(describing: p2))
        }
        public enum Footer {
          /// By clicking “confirm vote,” you attest and affirm that you are the constitutionally elected public official named above
          public static let confirmVote = Strings.tr("Localizable", "Voting.Components.Confirmation.footer.confirmVote")
        }
        public enum Title {
          public enum Button {
            /// Change vote
            public static let changeVote = Strings.tr("Localizable", "Voting.Components.Confirmation.title.button.changeVote")
            /// Confirm vote
            public static let confirmVote = Strings.tr("Localizable", "Voting.Components.Confirmation.title.button.confirmVote")
            /// Vote confirmed
            public static let voteConfirmed = Strings.tr("Localizable", "Voting.Components.Confirmation.title.button.voteConfirmed")
          }
        }
      }
      public enum Contact {
        /// Contact %@ via %@ or by %@ %@
        public static func body(_ p1: Any, _ p2: Any, _ p3: Any, _ p4: Any) -> String {
          return Strings.tr("Localizable", "Voting.Components.Contact.body", String(describing: p1), String(describing: p2), String(describing: p3), String(describing: p4))
        }
        /// Got questions?
        public static let prompt = Strings.tr("Localizable", "Voting.Components.Contact.prompt")
        public enum Link {
          public enum Body {
            /// email
            public static let email = Strings.tr("Localizable", "Voting.Components.Contact.link.body.email")
            /// phone
            public static let phone = Strings.tr("Localizable", "Voting.Components.Contact.link.body.phone")
          }
        }
        public enum Subject {
          /// RemoteVote App Issue
          public static let email = Strings.tr("Localizable", "Voting.Components.Contact.subject.email")
        }
      }
      public enum Summary {
        /// (Open votes will appear here when they begin)
        public static let emptyState = Strings.tr("Localizable", "Voting.Components.Summary.emptyState")
      }
    }
    public enum Header {
      public enum Body {
        /// Vote in progress
        public static let active = Strings.tr("Localizable", "Voting.Header.body.active")
        /// No pending vote
        public static let inactive = Strings.tr("Localizable", "Voting.Header.body.inactive")
      }
    }
    public enum Timer {
      /// Time remaining:
      public static let prompt = Strings.tr("Localizable", "Voting.Timer.prompt")
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name

// MARK: - Implementation Details

extension Strings {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    Bundle(for: BundleToken.self)
  }()
}
// swiftlint:enable convenience_type
