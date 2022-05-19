//
//  Rendering.swift
//  
//
//  Created by Chia-Lung Chen on 2022/5/19.
//

import Foundation

struct Rendering: Codable {
  let type: String
  let status: String
  let changes: [Changes]
  let options: Options?
  let template_id: String
  let permanent_url: String
  let created_by: String
  let id: String
  let created_at: String
}
