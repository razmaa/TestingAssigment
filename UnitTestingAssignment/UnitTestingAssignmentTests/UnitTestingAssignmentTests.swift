//
//  UnitTestingAssignmentTests.swift
//  UnitTestingAssignmentTests
//
//  Created by nika razmadze on 04.12.23.
//

import XCTest
@testable import UnitTestingAssignment

class UnitTestingAssignmentTests: XCTestCase {
    var cartViewModel: CartViewModel!

    override func setUpWithError() throws {
        cartViewModel = CartViewModel()
    }

    override func tearDownWithError() throws {
        cartViewModel = nil
    }

    func testCartViewModelFetchProducts() {
        cartViewModel.fetchProducts()
        XCTAssertNotNil(cartViewModel.allproducts)
    }

    func testCartViewModelAddProduct() {
        let product = Product(id: 1, title: "Test Product", description: "Description", price: 10.0, selectedQuantity: 1)
        cartViewModel.allproducts = [product]

        cartViewModel.addProduct(product: product)
        XCTAssertEqual(cartViewModel.selectedProducts.count, 1)
    }

    func testCartViewModelAddRandomProduct() {
        cartViewModel.allproducts = [
            Product(id: 1, title: "Product 1", description: "Description 1", price: 15.0, selectedQuantity: 2),
            Product(id: 2, title: "Product 2", description: "Description 2", price: 20.0, selectedQuantity: 1)
        ]

        cartViewModel.addRandomProduct()
        XCTAssertNotNil(cartViewModel.selectedProducts.first)
    }

    func testCartViewModelRemoveProduct() {
        let product1 = Product(id: 1, title: "Product 1", description: "Description 1", price: 15.0, selectedQuantity: 2)
        let product2 = Product(id: 2, title: "Product 2", description: "Description 2", price: 20.0, selectedQuantity: 1)
        cartViewModel.selectedProducts = [product1, product2]

        cartViewModel.removeProduct(withID: 1)
        XCTAssertEqual(cartViewModel.selectedProducts.count, 1)
    }

    func testCartViewModelClearCart() {
        let product1 = Product(id: 1, title: "Product 1", description: "Description 1", price: 15.0, selectedQuantity: 2)
        let product2 = Product(id: 2, title: "Product 2", description: "Description 2", price: 20.0, selectedQuantity: 1)
        cartViewModel.selectedProducts = [product1, product2]

        cartViewModel.clearCart()
        XCTAssertTrue(cartViewModel.selectedProducts.isEmpty)
    }

    func testCartViewModelSelectedItemsQuantity() {
        let product1 = Product(id: 1, title: "Product 1", description: "Description 1", price: 15.0, selectedQuantity: 2)
        let product2 = Product(id: 2, title: "Product 2", description: "Description 2", price: 20.0, selectedQuantity: 1)
        cartViewModel.selectedProducts = [product1, product2]

        XCTAssertEqual(cartViewModel.selectedItemsQuantity, 3)
    }

    func testCartViewModelTotalPrice() {
        let product1 = Product(id: 1, title: "Product 1", description: "Description 1", price: 15.0, selectedQuantity: 2)
        let product2 = Product(id: 2, title: "Product 2", description: "Description 2", price: 20.0, selectedQuantity: 1)
        cartViewModel.selectedProducts = [product1, product2]

        XCTAssertEqual(cartViewModel.totalPrice, 50.0)
    }

    func testCartViewModelAddProductWithID() {
        let product = Product(id: 1, title: "Test Product", description: "Description", price: 10.0, selectedQuantity: 1)
        cartViewModel.allproducts = [product]

        cartViewModel.addProduct(withID: 1)
        XCTAssertEqual(cartViewModel.selectedProducts.count, 1)
    }
}
