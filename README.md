# copicake-swift

🍰 Copicake, a data-driven image generating service to let you generate any social media material with just ONE CLICK.

- 🔗 Website: https://copicake.com/
- 📘 Official API Docs: https://docs.copicake.com/

# Installations

## Cocoapods

[CocoaPods](https://cocoapods.org/) is a dependency manager for Cocoa projects. For usage and installation instructions, visit their website. To integrate Copicake into your Xcode project using CocoaPods, specify it in your Podfile:

```ruby
pod 'copicake-swift'
```

## Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the swift compiler.

Once you have your Swift package set up, adding Copicake as a dependency is as easy as adding it to the `dependencies` value of your `Package.swift`.

```swift
dependencies: [
    .package(url: "https://github.com/Copicake/copicake-swift", from: "0.0.1")
]
```

# Usage

## Initialization

```swift
let copicake = Copicake(
  CopicakeInitConfig(apiKey: "")
)
```

## Create an Image

```swift
copicake.image.create([
  "template_id": "YOU_TEMPLATE_ID",
  "changes": [
    [
      "name": "text-9so09m",
      "text": "hello world",
      "color": "#ff0000"
    ],
    [
      "name": "image-yeavh7",
      "src": "https://your_website.com/test.png"
    ]
  ],
  "options": [
    "webhook_url": "https://your_website.com/webhook_url"
  ]
]) { error, rendering in
  if error != nil {
    debugPrint(error)
  }
  else {
    debugPrint(rendering)
  }
}
```

## Get an Image

```swift
let renderingId = "YOUR_RENDERING_ID";

copicake.image.get(renderingId) { error, rendering in
  if error != nil {
    debugPrint(error)
  }
  else {
    debugPrint(rendering)
  }
}
```

## Get an image (long polling)

```swfit
let renderingId = "YOUR_RENDERING_ID";

copicake.image.getUntilFinished(renderingId) { error, rendering in
  if error != nil {
    debugPrint(error)
  }
  else {
    if rendering?.status == "success" {
      // do something
    }
    else if rendering?.status == "failed" {
      // do something
    }
  }
}
```
