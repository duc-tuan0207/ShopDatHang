struct uiState {
    func uiState(from status: UserStatus) -> UiState {
        return UiState(
            screen: .login,
            status: String(describing: status),
            message: status.message
        )
    }

    func uiState(from status: OrderStatus) -> UiState {
        return UiState(
            screen: .orderList,
            status: String(describing: status),
            message: status.message
        )
    }

    func uiState(from status: TotalPriceStatus) -> UiState {
        return UiState(
            screen: .orderDetail,
            status: String(describing: status),
            message: status.message
        )
    }

    func uiState(from status: PaymentStatus) -> UiState {
        return UiState(
            screen: .payment,
            status: String(describing: status),
            message: status.message
        )
    }

    func uiState(from status: SearchOrderStatus) -> UiState {
        let screen: Screen = .orderList
        let statusString: String
        let message: String = status.message

        switch status {
        case .emptyKeyword:
            statusString = "error"
        case .found:
            statusString = "success"
        case .notFound:
            statusString = "empty"
        }

        return UiState(screen: screen, status: statusString, message: message)
    }
}

