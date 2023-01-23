import XCTest
import AppKit

@testable import copicake_swift

final class copicake_swiftTests: XCTestCase {
  func testExample() throws {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct
    // results.

    /*
    let copicake = Copicake(
      CopicakeInitConfig(apiKey: "COPICAKE_API_KEY")
    )

    copicake.image.create(["":""]) { createError, rendering in
      if createError == nil {
        copicake.image.getUntilFinished(rendering!.id) { getError, finalRendering in

        }
      }
    }
    */
  }

  func testUtils() async throws {
    /*
    let expectation = XCTestExpectation(description: "test")

    let copicake = Copicake(
      CopicakeInitConfig(apiKey: "")
    )

    let image = NSImage(systemSymbolName: "hammer", accessibilityDescription: nil)
    let cgImage = image?.cgImage(forProposedRect: nil, context: nil, hints: nil)
    let bitmap = NSBitmapImageRep(cgImage: cgImage!)
    let pngData = bitmap.representation(using: NSBitmapImageRep.FileType.jpeg, properties: [:])

    copicake.utils.uploadTempImage(pngData!, Extension.jpg) { error, url in
      print(error)
      print(url)
      expectation.fulfill()
    }

    wait(for: [expectation], timeout: 20.0)
    */
  }
}
