# CiderKit.Tween

A pure Swift tweening library that complies with Swift 6 Strict Concurrency.

It was primarily designed to work with [CiderKit](https://github.com/chsxf/CiderKit), but it is completely agnostic and can be used within any project.

![](https://img.shields.io/badge/Platforms-macOS%2014%2B%20%7C%20iOS%2013%2B%20%7C%20iPadOS%2013%2B%20%7C%20tvOS%2013%2B%20%7C%20visionOS%201%2B-orange)
![](https://img.shields.io/badge/Swift-6.2%20%7C%206.1%20%7C%206.0-orange)
[![Lint, Build & Test](https://github.com/chsxf/CiderKit.Tween/actions/workflows/swift.yml/badge.svg)](https://github.com/chsxf/CiderKit.Tween/actions/workflows/swift.yml)
[![](https://img.shields.io/badge/gitmoji-%20😜%20😍-FFDD67.svg)](https://gitmoji.dev/)

# Features

This package provides tweens to animate values of various types with linear or non-linear interpolation.

The supported types are:

- `Int` (+ `SIMD2` to `SIMD64` variants)
- `UInt` (+ `SIMD2` to `SIMD64` variants)
- `Float` (+ `SIMD2` to `SIMD64` variants)
- `Double` (+ `SIMD2` to `SIMD64` variants)
- `CGFloat` 
- `CGPoint`
- `CGRect`
- `CGSize`
- `String` (with optional scrambled text)

## Planned Features and Improvements

- [ ] [`SpriteKit`](https://developer.apple.com/documentation/spritekit) specialized tweens
- [ ] Bridge to [`SKAction`](https://developer.apple.com/documentation/spritekit/skaction)
- [ ] watchOS Support
- [X] String specialized tweens (between two strings, with scrambled text, etc.)
- [X] Loops
- [X] Sequences

# Getting Started

[Full documentation](https://chsxf.github.io/CiderKit.Tween/documentation/ciderkit_tween/) | [Sample Project](https://github.com/chsxf/CiderKit.Tween.Sample)

CiderKit.Tween makes heavy use of AsyncStreams. Here is a short usage sample:

```swift
import CiderKit_Tween

// Create a linear tween that goes from 0 to 100 linearly over a period of 5 seconds
let tween = Float.tween(from: 0, to: 100, duration: 5)

// ...

Task {
    for await updatedValue in tween.onUpdate {
        print(updatedValue) // Will print values as the tween updates
    }
}
```

# Installation with Swift Package Manager

CiderKit.Tween is available through [Swift Package Manager](https://github.com/apple/swift-package-manager).

## As a Package Dependency

To install it, simply add the dependency to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/chsxf/CiderTween.Kit.git", from: "0.1.0"),
],
targets: [
    .target(name: "YourTarget", dependencies: ["CiderKit.Tween"]),
]
```

## As a Project Dependency in Xcode

- In Xcode, select **File > Add Packages...** and enter `https://github.com/chsxf/CiderTween.Kit.git` in the search field (top-right). 
- Then select **Up to Next Major Version** as the **Dependency Rule** with `0.1.0` in the associated text field.
- Then select the project of your choice in the **Add to Project** list.
- Finally, click the **Add Package** button.

# Support

Development on CiderKit.Tween is still active.

However, support is not guaranteed in any way. [Pull requests](https://github.com/chsxf/CiderKit.Tween/pulls) or [issues](https://github.com/chsxf/CiderKit.Tween/issues) are welcomed but you may wait for some time before getting any answer.

# License

Unless stated otherwise, all source code and assets are distributed under the [MIT License](LICENSE).
