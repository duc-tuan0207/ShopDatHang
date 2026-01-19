struct OrderService {

    func validateOrder(order: Order?) -> OrderStatus {
        guard let order = order else {
            return .orderEmpty
        }

        if order.products.isEmpty {
            return .orderEmpty
        }

        return .orderValid
    }

    func calculateTotalPrice(
        products: [Product],
        onResult: (TotalPriceStatus, Double?) -> Void
    ) {
        if products.contains(where: { $0.price < 0 }) {
            onResult(.priceInvalid, nil)
            return
        }

        let total = products.reduce(0.0) { sum, product in
            sum + product.price
        }

        onResult(.priceOK, total)
    }
}
