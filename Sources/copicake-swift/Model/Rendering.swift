//
//  Rendering.swift
//  
//
//  Created by Chia-Lung Chen on 2022/5/19.
//

import Foundation

public struct Rendering: Codable {
  public let type: String
  public let status: String
  public let changes: [Changes]
  public let options: Options?
  public let template_id: String
  public let permanent_url: String
  public let created_by: String
  public let id: String
  public let created_at: String
}
