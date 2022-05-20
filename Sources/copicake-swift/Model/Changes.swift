//
//  Changes.swift
//  
//
//  Created by Chia-Lung Chen on 2022/5/19.
//

import Foundation

public struct Changes: Codable {
  open let name: String
  open let text: String?
  open let src: String?
}
