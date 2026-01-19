func payment(totalPrice: Double?) -> PaymentStatus {
    switch totalPrice {
    case nil :
        return .paymentInvalid
    case let price? where price <= 0 :
        return .paymentInvalid
    case let price? where price <= 1000000 :
        return .paymentSuccess
    default:
            return .paymentFailed
    }
}
