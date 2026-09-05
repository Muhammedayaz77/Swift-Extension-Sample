# Swift Extension Sample

A practical collection of reusable **Swift extensions for Foundation, UIKit, and SwiftUI**.

This project is maintained under **Hind Tech Group (HTG)** as a learning and reference repository for Swift and iOS development. The goal is to provide focused, readable, reusable extensions without helper classes or utility wrappers.

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

## Design Principles

- **Extensions only** — functionality is added directly to existing Swift or Apple types.
- **No helper classes** — avoid unnecessary wrapper and utility classes.
- **One type per file** — keeps the repository easy to navigate.
- **Readable formatting** — methods and statements use consistent Swift formatting.
- **Reusable functionality** — focus on common development needs rather than project-specific business logic.
- **Safe APIs where practical** — avoid unnecessary force unwrapping and recursive implementations.
- **Clear documentation** — each extension explains its purpose.

## Example

```swift
let name = "Hind Tech Group"
let length = name.getLength()

let data = try user.toJSONData()
let decodedUser = try data.decoded(as: User.self)

let view = UIView()
view.setSize(width: 100, height: 100)
```

## Future Scope

The project can continue to grow with additional extensions, unit tests, Swift Package Manager support, and expanded documentation while keeping the same extension-only design.

## Maintained By

**Hind Tech Group (HTG)**

HTG is the parent technology initiative for the Hind Tech ecosystem. Its technology-learning work includes iOS, Python, Android, SQL, Web Development, Programming Fundamentals, AI/ML, and emerging technologies.

## License

This repository is intended for learning, reference, and reusable development examples. Add an appropriate open-source license if the project is distributed as a formal open-source library.
