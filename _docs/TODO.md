#  TODO

# Part 1
`
Link: [https://www.hackingwithswift.com/100/swiftui/49](https://www.hackingwithswift.com/100/swiftui/49)

- [x] Cupcake Corner: Introduction
- [x] Adding Codable conformance for @Published properties
- [x] Sending and receiving Codable data with URLSession and SwiftUI
- [x] Loading an image from a remote server
- [x] Validating and disabling forms


# Part 2
Link: [https://www.hackingwithswift.com/100/swiftui/50](https://www.hackingwithswift.com/100/swiftui/50)

- [x] Taking basic order details
- [x] Checking for a valid address
- [x] Preparing for checkout

# Part 3
Link: [https://www.hackingwithswift.com/100/swiftui/51](https://www.hackingwithswift.com/100/swiftui/51)

- [x] Encoding an ObservableObject class
- [x] Sending and receiving orders over the internet

# Part 4
## Challenge

Link: [https://www.hackingwithswift.com/books/ios-swiftui/cupcake-corner-wrap-up](https://www.hackingwithswift.com/books/ios-swiftui/cupcake-corner-wrap-up)


- [x] Our address fields are currently considered valid if they contain anything, even if it’s just only whitespace. Improve the validation to make sure a string of pure whitespace is invalid.
    - check module "Order.swift" for answer implementation
- [x] If our call to placeOrder() fails – for example if there is no internet connection – show an informative alert for the user. To test this, try commenting out the request.httpMethod = "POST" line in your code, which should force the request to fail.
    - check module "CheckoutView.swift" for answerfor challenge
- [x] For a more challenging task, see if you can convert our data model from a class to a struct, then create an ObservableObject class wrapper around it that gets passed around. This will result in your class having one @Published property, which is the data struct inside it, and should make supporting Codable on the struct much easier.
