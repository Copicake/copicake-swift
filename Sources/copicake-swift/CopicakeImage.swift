//
//  CopicakeImage.swift
//  
//
//  Created by Chia-Lung Chen on 2022/5/19.
//

import Foundation
import Alamofire

public class CopicakeImage {
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

  public func create(_ parameters: Parameters, _ completion: @escaping (String?, Rendering?) -> Void) -> Void {
    let url = "\(COPICAKE_API_SERVER_IMAGE)/create"

    AF.request(
      url,
      method: .post,
      parameters: parameters,
      encoding: JSONEncoding.default,
      headers: self.getHeaders()
    )
    .responseDecodable(of: RenderingResponse.self) { response in
      if response.error != nil {
        completion(response.error?.localizedDescription, nil)
      }
      else if response.value?.error != nil {
        completion(response.value?.error!, nil)
      }
      else {
        completion(nil, response.value?.data)
      }
    }
  }

  public func get(_ id: String, _ completion: @escaping (String?, Rendering?) -> Void) -> Void {
    let url = "\(COPICAKE_API_SERVER_IMAGE)/get?id=\(id)"

    AF.request(
      url,
      method: .get,
      parameters: nil,
      encoding: JSONEncoding.default,
      headers: self.getHeaders()
    )
    .responseDecodable(of: RenderingResponse.self) { response in
      if response.error != nil {
        completion(response.error?.localizedDescription, nil)
      }
      else if response.value?.error != nil {
        completion(response.value?.error!, nil)
      }
      else {
        completion(nil, response.value?.data)
      }
    }
  }

  public func getUntilFinished(_ id: String, _ completion: @escaping (String?, Rendering?) -> Void, _ count: Int = 0) -> Void {
    if count > COPICAKE_MAX_API_RETRY {
      completion("Exceeded MAX_API_RETRY", nil)
    }
    else {
      self.get(id) { error, rendering in
        if error != nil || rendering?.status == "processing" {
          DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.getUntilFinished(id, completion, count + 1)
          }
        }
        else {
          completion(nil, rendering)
        }
      }
    }
  }
}
