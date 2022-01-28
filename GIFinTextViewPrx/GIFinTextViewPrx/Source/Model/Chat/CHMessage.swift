//
//  CHMessage.swift
//  GIFinTextViewPrx
//
//  Created by 이숭인 on 2022/01/27.
//

import UIKit

struct CHMessage: Codable {
    var data: [CHDataClass]
}

struct CHDataClass: Codable {
    let body_text: String
    let body_blockskit: String
}

//MARK: - Copy

// MARK: - ChChatList
//struct CHMessage: Codable {
//    let code: Int
//    let message: String
//    let data: [Datum]
//    let version: Int
//    let timestamp, xsoc: String
//}
//
//// MARK: - Datum
//struct Datum: Codable {
//    let assetData: [AssetDatum]
//    let attachments: [Attachment]
//    let backlogData: [JSONAny]
//    let bodyBlockskit, bodyText: String
//    let bookmarkYn: BookmarkYn
//    let chID: ChID
//    let chName: String
//    let chatType: ChatType
//    let clientID, contID: String
//    let contType: ContType
//    let created: String
//    let isOutcome: Bool
//    let messageData: [JSONAny]
//    let modified: Modified
//    let msgCmtCnt: Int
//    let msgID: String
//    let notiJSON: NotiJSON?
//    let ogData: [JSONAny]
//    let originMsgID: String
//    let pinID: PinID
//    let reactions: [Reaction]
//    let seq: String
//    let shareData: JSONNull?
//    let userID, userName: String
//    let wsID: WsID
//
//    enum CodingKeys: String, CodingKey {
//        case assetData = "asset_data"
//        case attachments
//        case backlogData = "backlog_data"
//        case bodyBlockskit = "body_blockskit"
//        case bodyText = "body_text"
//        case bookmarkYn = "bookmark_yn"
//        case chID = "ch_id"
//        case chName = "ch_name"
//        case chatType = "chat_type"
//        case clientID = "client_id"
//        case contID = "cont_id"
//        case contType = "cont_type"
//        case created
//        case isOutcome = "is_outcome"
//        case messageData = "message_data"
//        case modified
//        case msgCmtCnt = "msg_cmt_cnt"
//        case msgID = "msg_id"
//        case notiJSON = "noti_json"
//        case ogData = "og_data"
//        case originMsgID = "origin_msg_id"
//        case pinID = "pin_id"
//        case reactions, seq
//        case shareData = "share_data"
//        case userID = "user_id"
//        case userName = "user_name"
//        case wsID = "ws_id"
//    }
//}
//
//// MARK: - AssetDatum
//struct AssetDatum: Codable {
//    let assetID, created: String
//    let fileMIME: FileMIME
//    let fileName, filePath: String
//    let fileSize, imageX, imageY: Int
//    let mimeType: String
//    let saveLOC: Int
//    let thumbnail, userID: String
//
//    enum CodingKeys: String, CodingKey {
//        case assetID = "asset_id"
//        case created
//        case fileMIME = "file_mime"
//        case fileName = "file_name"
//        case filePath = "file_path"
//        case fileSize = "file_size"
//        case imageX = "image_x"
//        case imageY = "image_y"
//        case mimeType = "mime_type"
//        case saveLOC = "save_loc"
//        case thumbnail
//        case userID = "user_id"
//    }
//}
//
//enum FileMIME: String, Codable {
//    case image = "image"
//    case pdf = "pdf"
//    case spred = "spred"
//    case video = "video"
//}
//
//// MARK: - Attachment
//struct Attachment: Codable {
//    let attachmentType: String
//    let values: [Value]
//
//    enum CodingKeys: String, CodingKey {
//        case attachmentType = "attachment_type"
//        case values
//    }
//}
//
//// MARK: - Value
//struct Value: Codable {
//    let appsName, attachmentID, mboxMailID, provider: String
//    let sendDate, sender: String
//    let switLink: SwitLink
//    let threadCnt: Int
//    let timezone, title, to: String
//
//    enum CodingKeys: String, CodingKey {
//        case appsName = "apps_name"
//        case attachmentID = "attachment_id"
//        case mboxMailID = "mbox_mail_id"
//        case provider
//        case sendDate = "send_date"
//        case sender
//        case switLink = "swit_link"
//        case threadCnt = "thread_cnt"
//        case timezone, title, to
//    }
//}
//
//// MARK: - SwitLink
//struct SwitLink: Codable {
//    let path: Path
//    let type: String
//}
//
//// MARK: - Path
//struct Path: Codable {
//    let mailID: String
//
//    enum CodingKeys: String, CodingKey {
//        case mailID = "mail_id"
//    }
//}
//
//enum BookmarkYn: String, Codable {
//    case n = "N"
//}
//
//enum ChID: String, Codable {
//    case the191029022520592JCNz = "191029022520592jCNz"
//}
//
//enum ChatType: String, Codable {
//    case sys = "sys"
//    case txt = "txt"
//}
//
//enum ContType: String, Codable {
//    case chat = "chat"
//}
//
//enum Modified: String, Codable {
//    case empty = ""
//    case the20220114T055344734407Z = "2022-01-14T05:53:44.734407Z"
//    case the20220120T075424402305Z = "2022-01-20T07:54:24.402305Z"
//    case the20220126T075358200041Z = "2022-01-26T07:53:58.200041Z"
//}
//
//// MARK: - NotiJSON
//struct NotiJSON: Codable {
//    let notiTempCode: String
//    let notiValues: NotiValues
//
//    enum CodingKeys: String, CodingKey {
//        case notiTempCode = "noti_temp_code"
//        case notiValues = "noti_values"
//    }
//}
//
//// MARK: - NotiValues
//struct NotiValues: Codable {
//    let chName: String
//    let cnt, fromUserName: String?
//    let userName: String
//
//    enum CodingKeys: String, CodingKey {
//        case chName = "ch_name"
//        case cnt
//        case fromUserName = "from_user_name"
//        case userName = "user_name"
//    }
//}
//
//enum PinID: String, Codable {
//    case empty = ""
//    case the220118055050VXEftTo = "220118055050VXEftTo"
//    case the220125013210MJB7Jz4 = "220125013210mJB7jz4"
//}
//
//// MARK: - Reaction
//struct Reaction: Codable {
//    let count: Int
//    let users: [String]
//    let value: String
//}
//
//enum WsID: String, Codable {
//    case the7KYTjHXN98FUutGA = "7kYTjHXN98FUutGA"
//}
//
//// MARK: - Encode/decode helpers
//
//class JSONNull: Codable, Hashable {
//
//    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
//        return true
//    }
//
//    public var hashValue: Int {
//        return 0
//    }
//
//    public init() {}
//
//    public required init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if !container.decodeNil() {
//            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        try container.encodeNil()
//    }
//}
//
//class JSONCodingKey: CodingKey {
//    let key: String
//
//    required init?(intValue: Int) {
//        return nil
//    }
//
//    required init?(stringValue: String) {
//        key = stringValue
//    }
//
//    var intValue: Int? {
//        return nil
//    }
//
//    var stringValue: String {
//        return key
//    }
//}
//
//class JSONAny: Codable {
//
//    let value: Any
//
//    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
//        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
//        return DecodingError.typeMismatch(JSONAny.self, context)
//    }
//
//    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
//        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
//        return EncodingError.invalidValue(value, context)
//    }
//
//    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
//        if let value = try? container.decode(Bool.self) {
//            return value
//        }
//        if let value = try? container.decode(Int64.self) {
//            return value
//        }
//        if let value = try? container.decode(Double.self) {
//            return value
//        }
//        if let value = try? container.decode(String.self) {
//            return value
//        }
//        if container.decodeNil() {
//            return JSONNull()
//        }
//        throw decodingError(forCodingPath: container.codingPath)
//    }
//
//    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
//        if let value = try? container.decode(Bool.self) {
//            return value
//        }
//        if let value = try? container.decode(Int64.self) {
//            return value
//        }
//        if let value = try? container.decode(Double.self) {
//            return value
//        }
//        if let value = try? container.decode(String.self) {
//            return value
//        }
//        if let value = try? container.decodeNil() {
//            if value {
//                return JSONNull()
//            }
//        }
//        if var container = try? container.nestedUnkeyedContainer() {
//            return try decodeArray(from: &container)
//        }
//        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
//            return try decodeDictionary(from: &container)
//        }
//        throw decodingError(forCodingPath: container.codingPath)
//    }
//
//    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
//        if let value = try? container.decode(Bool.self, forKey: key) {
//            return value
//        }
//        if let value = try? container.decode(Int64.self, forKey: key) {
//            return value
//        }
//        if let value = try? container.decode(Double.self, forKey: key) {
//            return value
//        }
//        if let value = try? container.decode(String.self, forKey: key) {
//            return value
//        }
//        if let value = try? container.decodeNil(forKey: key) {
//            if value {
//                return JSONNull()
//            }
//        }
//        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
//            return try decodeArray(from: &container)
//        }
//        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
//            return try decodeDictionary(from: &container)
//        }
//        throw decodingError(forCodingPath: container.codingPath)
//    }
//
//    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
//        var arr: [Any] = []
//        while !container.isAtEnd {
//            let value = try decode(from: &container)
//            arr.append(value)
//        }
//        return arr
//    }
//
//    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
//        var dict = [String: Any]()
//        for key in container.allKeys {
//            let value = try decode(from: &container, forKey: key)
//            dict[key.stringValue] = value
//        }
//        return dict
//    }
//
//    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
//        for value in array {
//            if let value = value as? Bool {
//                try container.encode(value)
//            } else if let value = value as? Int64 {
//                try container.encode(value)
//            } else if let value = value as? Double {
//                try container.encode(value)
//            } else if let value = value as? String {
//                try container.encode(value)
//            } else if value is JSONNull {
//                try container.encodeNil()
//            } else if let value = value as? [Any] {
//                var container = container.nestedUnkeyedContainer()
//                try encode(to: &container, array: value)
//            } else if let value = value as? [String: Any] {
//                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
//                try encode(to: &container, dictionary: value)
//            } else {
//                throw encodingError(forValue: value, codingPath: container.codingPath)
//            }
//        }
//    }
//
//    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
//        for (key, value) in dictionary {
//            let key = JSONCodingKey(stringValue: key)!
//            if let value = value as? Bool {
//                try container.encode(value, forKey: key)
//            } else if let value = value as? Int64 {
//                try container.encode(value, forKey: key)
//            } else if let value = value as? Double {
//                try container.encode(value, forKey: key)
//            } else if let value = value as? String {
//                try container.encode(value, forKey: key)
//            } else if value is JSONNull {
//                try container.encodeNil(forKey: key)
//            } else if let value = value as? [Any] {
//                var container = container.nestedUnkeyedContainer(forKey: key)
//                try encode(to: &container, array: value)
//            } else if let value = value as? [String: Any] {
//                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
//                try encode(to: &container, dictionary: value)
//            } else {
//                throw encodingError(forValue: value, codingPath: container.codingPath)
//            }
//        }
//    }
//
//    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
//        if let value = value as? Bool {
//            try container.encode(value)
//        } else if let value = value as? Int64 {
//            try container.encode(value)
//        } else if let value = value as? Double {
//            try container.encode(value)
//        } else if let value = value as? String {
//            try container.encode(value)
//        } else if value is JSONNull {
//            try container.encodeNil()
//        } else {
//            throw encodingError(forValue: value, codingPath: container.codingPath)
//        }
//    }
//
//    public required init(from decoder: Decoder) throws {
//        if var arrayContainer = try? decoder.unkeyedContainer() {
//            self.value = try JSONAny.decodeArray(from: &arrayContainer)
//        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
//            self.value = try JSONAny.decodeDictionary(from: &container)
//        } else {
//            let container = try decoder.singleValueContainer()
//            self.value = try JSONAny.decode(from: container)
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        if let arr = self.value as? [Any] {
//            var container = encoder.unkeyedContainer()
//            try JSONAny.encode(to: &container, array: arr)
//        } else if let dict = self.value as? [String: Any] {
//            var container = encoder.container(keyedBy: JSONCodingKey.self)
//            try JSONAny.encode(to: &container, dictionary: dict)
//        } else {
//            var container = encoder.singleValueContainer()
//            try JSONAny.encode(to: &container, value: self.value)
//        }
//    }
//}
//
