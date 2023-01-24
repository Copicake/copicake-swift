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
    .package(url: "https://github.com/Copicake/copicake-swift", from: "0.0.7")
]
```

# Usage

## Initialization

```swift
import copicake_swift

let copicake = Copicake(
  CopicakeInitConfig(apiKey: "YOUR_API_KEY")
)
```

## Image

### Create an Image

#### create(_ parameters: `Parameters`, _ completion: `@escaping (String?, Rendering?) -> Void`) -> `Void`

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

### Get an Image

#### get(_ id: `String`, _ completion: `@escaping (String?, Rendering?) -> Void`) -> `Void`

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

### Get an image (long polling)

#### getUntilFinished(_ id: `String`, _ completion: `@escaping (String?, Rendering?) -> Void`) -> `Void`

Sometimes you may notice that your image is still under processing state, this is because the image is still being processed in the background by our servers.

In this way, we provide this handy method to get the image until the image is ready.

```swift
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

## Utils

### Create a temporary image for later use

#### uploadTempImage(_ image: `Data`,_ ext: `Extension`, \_ completion: `@escaping (String?, String?) -> Void`) -> `Void`

If you don't have a server to host images, we provided a handy way to let you upload a temporary image to our s3 and you can use the returned URL for later use.

P.S. Every temporary image will be removed within 1 day to avoid abuse

```swift
let nsImage = NSImage(systemSymbolName: "hammer", accessibilityDescription: nil)
let cgImage = nsImage?.cgImage(forProposedRect: nil, context: nil, hints: nil)
let bitmap = NSBitmapImageRep(cgImage: cgImage!)
let pngData = bitmap.representation(using: NSBitmapImageRep.FileType.png, properties: [:])

copicake.utils.uploadTempImage(pngData!, Extension.png) { error, url in
  if error != nil {
    debugPrint(error)
  }
  else {
    // url == https://s3.ap-northeast-1.amazonaws.com/copicake/temp/ak0zixy6rewsh6vaamzi.png
    debugPrint(url)
  }
}
```
