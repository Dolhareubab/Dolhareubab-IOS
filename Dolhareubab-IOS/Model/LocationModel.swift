//
//  LocationModel.swift
//  Dolhareubab-IOS
//
//  Created by 고명주 on 2022/12/15.
//

import Foundation

struct LocationModel: Codable {
  var meta: Meta
  var documents: [
    Documents
  ]
}

struct Meta: Codable {
  var totalCount: Int
}

struct RoadAddress: Codable {
  var addressName: String
  var region1: String
  var region2: String
  var region3: String
  var roadName: String
  var undergroundYn: String
  var mainBuildingNo: String
  var subBuildingNo: String
  var buildingName: String
  var zoneNo: String
}

struct Address: Codable {
  var addressName: String
  var region1: String
  var region2: String
  var region3: String
  var mountainYn: String
  var mainAddressNo: String
  var subAddressNo: String
}

struct Documents: Codable {
  var roadAddress: RoadAddress
  var address: Address
}
