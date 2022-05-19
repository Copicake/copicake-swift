import Foundation

public final class Copicake {
  private var apiKey = ""

  public let image: CopicakeImage

  public init(_ apiKey: String) {
    self.apiKey = apiKey

    // alias
    self.image = CopicakeImage(apiKey)
  }
}
