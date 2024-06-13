# NetworkingKit

NetworkingKit is a Swift Package Manager (SPM) package that provides networking utilities for iOS applications. It offers convenient APIs for making HTTP requests, handling responses, and downloading images asynchronously.

## Features
HTTP Request Handling: Simplifies the process of making HTTP requests using URLSession.
Error Handling: Provides robust error handling for network requests and responses.
Asynchronous Image Downloading: Offers utilities for downloading images asynchronously from remote URLs.

## Requirements

* iOS 13.0+
* Xcode 13.0+
* Swift 5.5+

## Installation Swift Package Manager
You can use Swift Package Manager to integrate NetworkingKit into your Xcode project. Follow these steps:

1. In Xcode, select "File" -> "Swift Packages" -> "Add Package Dependency..."
2. Enter the URL of this repository: https://github.com/ourangzeb/IOS-NetworkingKit.git
3. Follow the prompts to specify the version or branch you want to use.
4. Add NetworkingKit to your target dependencies.

Use the package manager [pip](https://pip.pypa.io/en/stable/) to install foobar.

```bash
dependencies: [
    .package(url: "https://github.com/ourangzeb/IOS-NetworkingKit.git", .upToNextMajor(from: "1.0.0"))
]

```

## Usage

## Making HTTP Requests

```swift
import NetworkingKit

let resource = Resource(url: URL(string: "https://api.example.com/data")!)
let networkService = NetworkService()
do {
    let responseData: Data = try await networkService.load(resource)
    // Process responseData...
} catch {
    // Handle error...
}
```

## Downloading Images

```swift
import NetworkingKit

let imageURL = URL(string: "https://example.com/image.jpg")!
let imageService = ImageDownloadService()
do {
    let downloadedImage: UIImage = try await imageService.downloadImage(from: imageURL)
    // Use downloadedImage...
} catch {
    // Handle error...
}
```

## Contributing

Pull requests are welcome. For major changes, please open an issue first
to discuss what you would like to change.

Please make sure to update tests as appropriate.

## Acknowledgements
NetworkingKit is developed and maintained by Ourangzeb Khan.


## License

[MIT](https://choosealicense.com/licenses/mit/)
