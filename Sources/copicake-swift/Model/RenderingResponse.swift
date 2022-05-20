//
//  RenderingResponse.swift
//  
//
//  Created by Chia-Lung Chen on 2022/5/19.
//

import Foundation

public struct RenderingResponse: Codable {
  open let error: String?
  open let data: Rendering
}
