

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let users = [
            User(id: 1, name: "Duc", isActive: true),
            User(id: 2, name: "Lan", isActive: false),
            User(id: 3, name: "Hai", isActive: true)
        ]
        let products = [
            Product(id: 1, name: "iphone", price: 500_000),
            Product(id: 2, name: "mac", price: 1_500_000),
            Product(id: 3, name: "chuột", price: -50_000),
            Product(id: 4, name: "bàn phím", price: 200_000)
        ]
        
        let orders = [
            Order(orderId: 1, userId: 1, products: [products[0], products[3]]),
            Order(orderId: 2, userId: 1, products: []),
            Order(orderId: 3, userId: 3, products: [products[2]])
        ]
        let service = OrderService()
        
        let orderStatus1 = service.validateOrder(order: orders[0])
        print("trạng thái đơn hàng:", orderStatus1.message)
        
        service.calculateTotalPrice(products: orders[0].products) { priceStatus, total in
            print("trạng thái giá:", priceStatus.message)
            
            if let totalPrice = total {
                let paymentStatus1 = payment(totalPrice: totalPrice)
                print("tổng giá:", totalPrice)
                print("trạng thái thanh toán:", paymentStatus1.message)
            }
        }
        let service2 = OrderService()
        let orderStatus2 = service2.validateOrder(order: orders[1])
        print("trạng thái đơn hàng:", orderStatus2.message)
        
        service2.calculateTotalPrice(products: orders[2].products) { priceStatus, total in
            print("trạng thái tổng thanh toán:", priceStatus.message)
        }
        
        let bigOrder = Order(orderId: 4, userId: 1, products: [products[1]])
        service2.calculateTotalPrice(products: bigOrder.products) { priceStatus, total in
            print("trạng thái tổng thanh toán:", priceStatus.message)
            if let totalPrice = total {
                let paymentStatus = payment(totalPrice: totalPrice)
                print("tổng giá:", totalPrice)
                print("trạng thái thanh toán:", paymentStatus.message)
            }
            
        }
        let search1 = searchOrderByProductName(keyword: nil, orders: orders)
        print("keyword rỗng", search1.message)
        
        let search2 = searchOrderByProductName(keyword: "Iphone", orders: orders)
        print("Iphone", search2.message)
        
        let search3 = searchOrderByProductName(keyword: "Samsung", orders: orders)
        print("Samsung", search3.message)
    }
}
