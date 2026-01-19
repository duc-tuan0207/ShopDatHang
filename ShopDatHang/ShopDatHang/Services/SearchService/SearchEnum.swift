enum SearchOrderStatus {
    case emptyKeyword
    case found
    case notFound

    var message: String {
        switch self {
        case .emptyKeyword:
            return "từ khóa trống"
        case .found:
            return "đã tìm thấy"
        case .notFound:
            return "không tìm thấy"
        }
    }
}
