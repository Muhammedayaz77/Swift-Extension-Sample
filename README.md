# Swift Extension Sample

A practical collection of reusable **Swift extensions for Foundation and UIKit**.

This project is maintained under **Hind Tech Group (HTG)** as a reference repository for iOS and Swift development. The goal is to keep commonly useful extensions organized, readable, and easy to reuse across projects.

## About

Swift extensions are a simple way to add focused functionality to existing Apple types without modifying their original implementation. This repository collects practical examples for everyday iOS development.

The project has been reorganized from a single mixed extension file into dedicated files by type. Each category contains small, reusable methods with comments explaining what the method does.

## Extension Categories

| # | File | Type | Focus |
|---|---|---|---|
| 1 | `StringExtensionClass.swift` | `String` | Text operations and validation |
| 2 | `ArrayExtensionClass.swift` | `Array` | Collection utilities |
| 3 | `DictionaryExtensionClass.swift` | `Dictionary` | Key-value utilities |
| 4 | `DateExtensionClass.swift` | `Date` | Date conversion and comparison |
| 5 | `CalendarExtensionClass.swift` | `Calendar` | Calendar calculations |
| 6 | `UIColorExtensionClass.swift` | `UIColor` | RGB, Hex and color utilities |
| 7 | `UIFontExtensionClass.swift` | `UIFont` | Font styling and sizing |
| 8 | `UIImageExtensionClass.swift` | `UIImage` | Image conversion and manipulation |
| 9 | `UIImageViewExtensionClass.swift` | `UIImageView` | Image-view styling and helpers |
| 10 | `UIViewExtensionClass.swift` | `UIView` | Layout, styling and animations |
| 11 | `UILabelExtensionClass.swift` | `UILabel` | Label styling and text helpers |
| 12 | `UIButtonExtensionClass.swift` | `UIButton` | Button styling and state helpers |
| 13 | `UITextFieldExtensionClass.swift` | `UITextField` | Input, padding and styling |
| 14 | `UITextViewExtensionClass.swift` | `UITextView` | Text editing and sizing |
| 15 | `UIScrollViewExtensionClass.swift` | `UIScrollView` | Scrolling and content helpers |
| 16 | `UITableViewExtensionClass.swift` | `UITableView` | Table registration and navigation |
| 17 | `UICollectionViewExtensionClass.swift` | `UICollectionView` | Collection registration and navigation |
| 18 | `UIViewControllerExtensionClass.swift` | `UIViewController` | Presentation and navigation helpers |
| 19 | `UIScreenExtensionClass.swift` | `UIScreen` | Screen dimensions and scale |
| 20 | `UIDeviceExtensionClass.swift` | `UIDevice` | Device and battery information |
| 21 | `URLExtensionClass.swift` | `URL` | URL and file-path helpers |
| 22 | `DataExtensionClass.swift` | `Data` | Encoding, JSON and data utilities |
| 23 | `NSObjectExtensionClass.swift` | `NSObject` | Runtime and object helpers |
| 24 | `BundleExtensionClass.swift` | `Bundle` | App and resource information |
| 25 | `UserDefaultsExtensionClass.swift` | `UserDefaults` | Local preference storage |

## Usage

Each file extends the corresponding Apple type directly. For example:

```swift
let name = "Hind Tech Group"
let length = name.getLength()

let color = UIColor.colorWithHexString("#007AFF")

let view = UIView()
view.roundedCorners(radius: 12)
```

No wrapper object is required. The extensions are available directly on the supported type once the source files are included in the project target.

## Design Principles

- **One type per extension file** — keeps the code easy to find and maintain.
- **Practical methods** — examples focus on common iOS development needs.
- **Clear naming** — method names describe the operation, such as `getLength()`, `getTopSafeArea()`, and `colorWithHexString(_:)`.
- **Simple documentation** — every utility includes a short comment describing its purpose.
- **Safe handling where practical** — newer examples avoid unnecessary force unwrapping and provide optional results when an operation can fail.
- **UIKit and Foundation focused** — the repository is intended as a reusable learning and reference collection.

## Legacy File

`ExtentionsClass.swift` is retained as a small compatibility file for the original project structure. The actual extensions have been moved into dedicated category files to avoid a large mixed source file.

## Project Structure

```text
Swift-Extension-Sample/
├── StringExtensionClass.swift
├── ArrayExtensionClass.swift
├── DictionaryExtensionClass.swift
├── DateExtensionClass.swift
├── CalendarExtensionClass.swift
├── UIColorExtensionClass.swift
├── UIFontExtensionClass.swift
├── UIImageExtensionClass.swift
├── UIImageViewExtensionClass.swift
├── UIViewExtensionClass.swift
├── UILabelExtensionClass.swift
├── UIButtonExtensionClass.swift
├── UITextFieldExtensionClass.swift
├── UITextViewExtensionClass.swift
├── UIScrollViewExtensionClass.swift
├── UITableViewExtensionClass.swift
├── UICollectionViewExtensionClass.swift
├── UIViewControllerExtensionClass.swift
├── UIScreenExtensionClass.swift
├── UIDeviceExtensionClass.swift
├── URLExtensionClass.swift
├── DataExtensionClass.swift
├── NSObjectExtensionClass.swift
├── BundleExtensionClass.swift
├── UserDefaultsExtensionClass.swift
└── ExtentionsClass.swift
```

## Maintained By

**Hind Tech Group (HTG)**

HTG is the parent technology initiative for the Hind Tech ecosystem. Its technology-learning work includes iOS, Python, Android, SQL, Web Development, Programming Fundamentals, AI/ML, and emerging technologies.

This repository is part of the iOS/Swift development work maintained under HTG.

## License

This repository is intended for learning, reference, and reusable development examples. Add an appropriate open-source license to the repository if you plan to distribute the code as a formal open-source project.
