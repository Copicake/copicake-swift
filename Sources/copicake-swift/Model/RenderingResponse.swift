//
//  RenderingResponse.swift
//  
//
//  Created by Chia-Lung Chen on 2022/5/19.
//

import Foundation

public struct RenderingResponse: Codable {
  public let error: String?
  public let data: Rendering
}
