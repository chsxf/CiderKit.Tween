# Getting Started

How to create your first tween

## Installation with Swift Package Manager

CiderKit.Tween is available through [Swift Package Manager](https://github.com/apple/swift-package-manager).

### As a Package Dependency

To install it, simply add the dependency to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/chsxf/CiderKit.Tween.git", from: "0.5.0"),
],
targets: [
    .target(name: "YourTarget", dependencies: ["CiderKit.Tween"]),
]
```

### As a Project Dependency in Xcode

- In Xcode, select **File > Add Packages...** and enter `https://github.com/chsxf/CiderKit.Tween.git` in the search field (top-right). 
- Then select **Up to Next Major Version** as the **Dependency Rule** with `0.5.0` in the associated text field.
- Then select the project of your choice in the **Add to Project** list.
- Finally, click the **Add Package** button.

## Basic Usage

This example is based on our [sample project](https://github.com/chsxf/CiderKit.Tween.Sample).

In it, we will tween the alpha of an `SKLabelNode` as soon as the containing `SKScene` is presented.

First, import the module:

```swift
import CikderKit_Tween
```

Then, we have to create the function that will handle our apparition tween. This function is made async as we need to wait for the ``/TweenData/onUpdate`` asynchronous sequence of values to play out.

```swift
func fadeInLabel() async {
    let tween = await CGFloat.tween(from: 0, to: 1, duration: 20)

    for await updatedAlpha in tween.onUpdate {
        await MainActor.run {
            label?.alpha = updatedAlpha
        }
    }
}
```

In the snippet above, we first create our tween, indicating we're working with a `CGFLoat` value going from `0` to `1` over a period of 20 seconds. Then, we wait for the asynchronous sequence to provide animated `CGFloat` values that are than applied to the alpha value of the `SKLabelNode`.

However, these two steps won't be enough for the tween to work. We need to initialize the ``/TweenManager`` for it to obtain a usable `CADisplayLink` and recieve timings for displayed frames. We can do that in the `viewDidLoad()`function of the application's view controller.

```swift
await TweenManager.shared.startFrom(view: view)
```

Note that the call to ``/TweenManager/startFrom(view:)`` is `async` and you may have to proceed from a `Task`.

Now run your project and you should see your tween animate and the `SKLabelNode` appearing progressively.

## Receiving Start and Completion Messages

We can slightly update our `fadeInLabel()` function to receive additional start and completion messages to execution actions when they occur.

```swift
func fadeInLabel() async {
    let tween = await CGFloat.tween(from: 0, to: 1, duration: 20)

    let startTask = Task {
        for await _ in tween.onStart {
            print("Tween started")
        }
    }

    let updateTask = Task {
        for await updatedAlpha in tween.onUpdate {
            await MainActor.run {
                label?.alpha = updatedAlpha
            }
        }
    }

    let completionTask = Task {
        for await _ in tween.onComplete {
            print("Tween ended")
        }
    }

    let _ = await (startTask.value, updateTask.value, completionTask.value)
}
```
