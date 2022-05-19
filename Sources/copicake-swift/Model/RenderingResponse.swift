//
//  RenderingResponse.swift
//  
//
//  Created by Chia-Lung Chen on 2022/5/19.
//

import Foundation

struct RenderingResponse: Codable {
  let error: String?
  let data: Rendering
}
