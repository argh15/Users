//
//  UsersModel.swift
//  Users
//
//  Created by Arghadeep Chakraborty on 10/08/21.
//

import Foundation

enum UserModelKeys: CodingKey {
    case page, per_page, total, total_pages, data
}

struct UserModel: Codable {
    var page: Int?
    var per_page: Int?
    var total: Int?
    var total_pages: Int?
    var data: [UserInfoModel]?
}

extension UserModel {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: UserModelKeys.self)
        page = try? container.decodeIfPresent(Int.self, forKey: .page)
        per_page = try? container.decodeIfPresent(Int.self, forKey: .per_page)
        total = try? container.decodeIfPresent(Int.self, forKey: .total)
        total_pages = try? container.decodeIfPresent(Int.self, forKey: .total_pages)
        data = try? container.decodeIfPresent([UserInfoModel].self, forKey: .data)
    }
}
