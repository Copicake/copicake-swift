//
//  UploadTempImageHandshakeResponse.swift
//  
//
//  Created by Chia-Lung Chen on 2023/1/23.
//

import Foundation

public struct UploadTempImageHandshakeResponse: Codable {
  public let url: String
  public let fields: [String: String]
}
