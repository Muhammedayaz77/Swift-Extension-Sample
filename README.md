# Reusable Swift Developer Toolkit

A practical collection of reusable **Swift extensions for Foundation, UIKit, and SwiftUI**.

Built under **Hind Tech Group (HTG)** as a developer-focused reference and reusable toolkit for everyday iOS development. The project keeps common functionality close to the types developers already use, without unnecessary helper or utility classes.

## What This Toolkit Provides

- Reusable extensions for common Swift and Apple framework types
- Foundation helpers for data, dates, collections, URLs, and persistence
- UIKit helpers for everyday UI development
- SwiftUI helpers for modern declarative interfaces
- Readable, documented APIs designed for reuse across projects
- Consistent Swift formatting enforced through `swift-format` and GitHub Actions

## Project Structure

```text
Swift-Extension-Sample/
├── Foundation/
│   ├── ArrayExtensionClass.swift
│   ├── BundleExtensionClass.swift
│   ├── CalendarExtensionClass.swift
│   ├── DataExtensionClass.swift
│   ├── DateExtensionClass.swift
│   ├── DictionaryExtensionClass.swift
│   ├── NSObjectExtensionClass.swift
│   ├── StringExtensionClass.swift
│   ├── URLExtensionClass.swift
│   ├── UserDefaultsExtensionClass.swift
│   └── ExtentionsClass.swift
│
├── UIKit/
│   ├── UIColorExtensionClass.swift
│   ├── UIFontExtensionClass.swift
│   ├── UIImageExtensionClass.swift
│   ├── UIImageViewExtensionClass.swift
│   ├── UIViewExtensionClass.swift
│   ├── UILabelExtensionClass.swift
│   ├── UIButtonExtensionClass.swift
│   ├── UITextFieldExtensionClass.swift
│   ├── UITextViewExtensionClass.swift
│   ├── UIScrollViewExtensionClass.swift
│   ├── UITableViewExtensionClass.swift
│   ├── UICollectionViewExtensionClass.swift
│   ├── UIViewControllerExtensionClass.swift
│   ├── UIScreenExtensionClass.swift
│   └── UIDeviceExtensionClass.swift
│
└── SwiftUI/
    ├── ViewExtensionClass.swift
    ├── ColorExtensionClass.swift
    ├── ImageExtensionClass.swift
    └── BindingExtensionClass.swift
```

## Extension Categories

### Foundation

Extensions for common Swift and Foundation types:

- `String`
- `Array`
- `Dictionary`
- `Date`
- `Calendar`
- `Data`
- `URL`
- `Bundle`
- `UserDefaults`
- `NSObject`
- `Optional`
- `Encodable` / `Decodable`

### UIKit

Reusable extensions for everyday iOS UI development:

- `UIView`
- `UIViewController`
- `UILabel`
- `UIButton`
- `UITextField`
- `UITextView`
- `UIImage`
- `UIImageView`
- `UIColor`
- `UIFont`
- `UITableView`
- `UICollectionView`
- `UIScrollView`
- `UIScreen`
- `UIDevice`

### SwiftUI

Modern SwiftUI extensions for:

- `View`
- `Color`
- `Image`
- `Binding`

## Why It Is Useful

The toolkit is intended for functionality that can be reused across multiple iOS applications rather than tied to one product or business domain.

For example:

```swift
let name = "Hind Tech Group"
let length = name.getLength()

let data = try user.toJSONData()
let decodedUser = try data.decoded(as: User.self)

let view = UIView()
view.setSize(width: 100, height: 100)
```

The same style of reusable functionality can be carried from one iOS project to another, reducing repeated boilerplate and keeping common operations easy to discover.

## Design Principles

- **Extensions only** — functionality is added directly to existing Swift or Apple types.
- **No helper classes** — avoid unnecessary wrapper and utility classes.
- **One type per file** — keeps the repository easy to navigate.
- **Readable formatting** — methods and statements follow consistent Swift formatting.
- **Reusable functionality** — focus on common development needs instead of project-specific business logic.
- **Safe APIs where practical** — avoid unnecessary force unwrapping and recursive implementations.
- **Clear documentation** — each extension explains its purpose.
- **Scalable structure** — Foundation, UIKit, and SwiftUI are separated so the toolkit can grow cleanly.

## Quality and Consistency

The repository includes a shared `.swift-format` configuration and GitHub Actions formatting checks. This keeps formatting rules consistent as the toolkit grows and prevents every contributor from having to manually inspect each file for basic style issues.

## Future Scope

The toolkit can continue to evolve with:

- Additional high-value extensions
- Unit tests for reusable APIs
- Swift Package Manager support
- More usage examples
- Expanded API documentation

New functionality should remain focused on genuinely reusable developer needs rather than adding methods only to increase the extension count.

## Maintained By

**Hind Tech Group (HTG)**

HTG is the parent technology initiative for the Hind Tech ecosystem. Its technology-learning work includes iOS, Python, Android, SQL, Web Development, Programming Fundamentals, AI/ML, and emerging technologies.

## License

This repository is intended for learning, reference, and reusable development examples. Add an appropriate open-source license if the project is distributed as a formal open-source library.
