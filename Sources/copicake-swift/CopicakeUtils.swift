//
//  CopicakeUtils.swift
//  
//
//  Created by Chia-Lung Chen on 2023/1/22.
//

import Foundation
import Alamofire

public enum Extension: String {
  case png = "png"
  case jpg = "jpg"
  case jpeg = "jpeg"
  case gif = "gif"
}

public class CopicakeUtils {
  private var apiKey = ""

  public init(_ apiKey: String) {
    self.apiKey = apiKey
  }

  private func getHeaders() -> HTTPHeaders {
    return [
      "Authorization": "Bearer \(apiKey)",
      "Accept": "application/json"
    ]
  }

  public func uploadTempImage(_ image: Data,_ ext: Extension, _ completion: @escaping (String?, String?) -> Void) -> Void {
    let filename = "\(randomString(length: 20)).\(ext.rawValue)"
    let url = "\(UPLOAD_TEMP_IMAGE_API_END_POINT)?file=\(filename)"

    print(filename)

    AF.request(
      url,
      method: .get,
      parameters: nil,
      encoding: JSONEncoding.default,
      headers: self.getHeaders()
    )
    .responseDecodable(of: UploadTempImageHandshakeResponse.self) { handshakeResponse in
      if handshakeResponse.error != nil {
        completion(handshakeResponse.error?.localizedDescription, nil)
      }
      else {
        if let uploadURL = handshakeResponse.value?.url,
           let fields = handshakeResponse.value?.fields {

          AF.upload(
            multipartFormData: { multipartFormData in
              for (key, value) in fields {
                multipartFormData.append(value.data(using: .utf8)!, withName: key)
              }
              multipartFormData.append(image, withName: "file")
            },
            to: uploadURL,
            method: .post
          ).response { uploadResponse in
            if uploadResponse.error != nil {
              completion(uploadResponse.error?.localizedDescription, nil)
            }
            else {
              if let key = fields["key"] {
                completion(nil, "\(uploadURL)/\(key)")
              }
              else {
                completion("Failed to upload image", nil)
              }
            }
          }
        }
        else {
          completion("Failed to upload image", nil)
        }
      }
    }
  }
}
