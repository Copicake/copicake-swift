import Foundation

public final class Copicake {
  private var apiKey = ""

  public let image: CopicakeImage

  public let utils: CopicakeUtils

  public init(_ config: CopicakeInitConfig) {
    self.apiKey = config.apiKey

    // alias
    self.image = CopicakeImage(apiKey)
    self.utils = CopicakeUtils(apiKey)
  }
}
