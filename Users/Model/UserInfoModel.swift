//
//  UserInfoModel.swift
//  Users
//
//  Created by Arghadeep Chakraborty on 11/08/21.
//

import Foundation

enum UserInfoModelKeys: CodingKey {
    case id, email, first_name, last_name, avatar
}

struct UserInfoModel: Codable {
    var id: Int?
    var email: String?
    var first_name: String?
    var last_name: String?
    var avatar: String?
}

extension UserInfoModel {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: UserInfoModelKeys.self)
        id = try? container.decodeIfPresent(Int.self, forKey: .id)
        email = try? container.decodeIfPresent(String.self, forKey: .email)
        first_name = try? container.decodeIfPresent(String.self, forKey: .first_name)
        last_name = try? container.decodeIfPresent(String.self, forKey: .last_name)
        avatar = try? container.decodeIfPresent(String.self, forKey: .avatar)
    }
}
