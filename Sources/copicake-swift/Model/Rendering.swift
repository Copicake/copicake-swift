//
//  Rendering.swift
//  
//
//  Created by Chia-Lung Chen on 2022/5/19.
//

import Foundation

public struct Rendering: Codable {
  open let type: String
  open let status: String
  open let changes: [Changes]
  open let options: Options?
  open let template_id: String
  open let permanent_url: String
  open let created_by: String
  open let id: String
  open let created_at: String
}
