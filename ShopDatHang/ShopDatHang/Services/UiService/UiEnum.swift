enum Screen {
    case login
    case orderList
    case orderDetail
    case payment
}

struct UiState {
    let screen: Screen
    let status: String
    let message: String
}
