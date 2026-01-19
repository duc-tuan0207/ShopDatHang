enum UserStatus {
    case userNotFound
    case userInactive
    case userActive

    var message: String {
        switch self {
        case .userNotFound:
            return "không thấy người dùng"
        case .userInactive:
            return "người dùng không hoạt động"
        case .userActive:
            return "Người dùng hoạt động"
        }
    }
}
