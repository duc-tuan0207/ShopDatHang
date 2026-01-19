func searchOrderByProductName(keyword: String?,orders: [Order]) -> SearchOrderStatus{
    let key = keyword?.lowercased()
    if key == nil || key == "" {
        return .emptyKeyword
    }
    let result = orders.first { order in
            order.products.contains { product in
                product.name.lowercased().contains(key!)
            }
        }
    if result != nil {
            return .found
        } else {
            return .notFound
        }
}
