enum PaymentStatus {
    case paymentSuccess
    case paymentFailed
    case paymentInvalid

    var message: String {
        switch self {
        case .paymentSuccess:
            return "thanh toán thành công"
        case .paymentFailed:
            return "thanh toán thất bại"
        case .paymentInvalid:
            return "thanh toán không hợp lệ"
        }
    }
}
