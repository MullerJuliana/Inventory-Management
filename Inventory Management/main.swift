//
//  main.swift
//  Inventory Management
//
//  Created by StudentPM on 1/9/25.
//

//Variables
// Inventory for items
    //Cereal
        var cerealInStock: Int = 100 // Amount of product in stock
        var cerealPrice: Double = 4.99// Price of one product
    //Milk
        var milkInStock: Int = 100
        var milkPrice: Double = 4.99
    //Syrup
        var syrupInStock: Int = 100
        var syrupPrice: Double = 3.99
    //Cups
        var cupsInStock: Int = 100
        var cupsPrice: Double = 2.99

//Cart of current items
        var cerealsInCart: Int = 0 //quantity in cart
        var milksInCart: Int = 0
        var syrupsInCart: Int = 0
        var cupsInCart: Int = 0

// Track total sales
        var totalSales: Double = 0.0 // Accumulated sales value

// Main program loop control
var isRunning = true // Determines if the program should keep running
while isRunning {
    mainMenu()
}

// Main Menu
func mainMenu(){
    print("Welcome to the grocery store! Lets us know how we can help you (Enter number of selection): ")
    print("1. Add item to cart")
    print("2. Remove item for cart")
    print("3. Check if item is in stock")
    print("4. Admin Menu")
    print("5. Checkout")
    
    if let userInput = readLine(){
        // Call respective functions based on user input
        if userInput == "1"{
            addItem() // Add item to cart
        } else if userInput == "2"{
            remItem() // remove item from cart
        } else if userInput == "3"{
            checkItem() // Check item stock
        } else if userInput == "4"{
            adminMenu() // Access admin menu
        } else if userInput == "5"{
            checkout() // Proceed to checkout
            isRunning = false // End program after checkout
        } else {
            print("Please choose an appropriate option!")
            }
        }
    }

    
// 1. Add item to the cart
func addItem(){
    print("What would you like to add to cart? (Enter number of selection")
    print("1. Cereal")
    print("2. Milk")
    print("3. Syrup")
    print("4. Cups")
    
    if let itemInput = readLine(){
        // Process selection for each item type
//Cereal
        if itemInput == "1"{
            print("How many cereal(s) would you like to add to your cart?:")
            if let quantityInput = readLine(), let quantity = Int(quantityInput), quantity > 0 {
                // Check stock availability
                if quantity <= cerealInStock {
                    cerealsInCart += quantity
                    cerealInStock -= quantity
                    print("You have added \(quantity) Cereal(s) to your cart!")
                } else {
                    print("Sorry, we don't have enough cereal in stock.") // Insufficient stock message
                }
            } else {
                print("Invalid quantity. Please enter a valid number.") // Handle invalid quantity input
            }
//Milks
        } else if itemInput == "2"{
            print("How many Milk(s) would you like to add to your cart?:")
            if let quantityInput = readLine(), let quantity = Int(quantityInput), quantity > 0 {
                if quantity <= milkInStock {
                    milksInCart += quantity
                    milkInStock -= quantity
                    print("You have added \(quantity) Milk(s) to your cart!")
                } else {
                    print("Sorry, we don't have enough milk in stock.")
                }
            } else {
                print("Invalid quantity. Please enter a valid number.")
            }
//Syrup
        } else if itemInput == "3"{
            print("How many Syrup(s) would you like to add to your cart?:")
            if let quantityInput = readLine(), let quantity = Int(quantityInput), quantity > 0 {
                if quantity <= syrupInStock {
                    syrupsInCart += quantity
                    syrupInStock -= quantity
                    print("You have added \(quantity) Syrup(s) to your cart!")
                } else {
                    print("Sorry, we don't have enough syrup in stock.")
                }
            } else {
                print("Invalid quantity. Please enter a valid number.")
            }
//Cup
        } else if itemInput == "4" {
            print("How many Cup(s) would you like to add to your cart?:")
            if let quantityInput = readLine(), let quantity = Int(quantityInput), quantity > 0 {
                if quantity <= cupsInStock {
                    cupsInCart += quantity
                    cupsInStock -= quantity
                    print("You have added \(quantity) Cup(s) to your cart!")
                } else {
                    print("Sorry, we don't have enough cups in stock.")
                }
            } else {
                print("Invalid quantity. Please enter a valid number.")
            }
        }
        // Invalid input
        else {
            print("Invalid selection. Please choose a valid option.")
        }
        //calculate total cost of items in the cart
        let total = Double(cerealsInCart) * cerealPrice +
                    Double(milksInCart) * milkPrice +
                    Double(syrupsInCart) * syrupPrice +
                    Double(cupsInCart) * cupsPrice
        print("Your current total is: $\(total)") // Display current total
        print("") // Print empty line for spacing
    }
}


// 2. Remove Item from the cart
func remItem(){
    print("What would you like to remove from cart? (Enter number of selection):")
    print("1. Cereal")
    print("2. Milk")
    print("3. Syrup")
    print("4. Cups")
    
    if let itemInput = readLine(){
//Cereal
        if itemInput == "1" {
                   print("How many cereal(s) would you like to remove from your cart?:")
                   if let quantityInput = readLine(), let quantity = Int(quantityInput), quantity > 0 {
                       // Check if enough items in cart to remove
                       if quantity <= cerealsInCart {
                           cerealsInCart -= quantity // Remove from cart
                           cerealInStock += quantity // Increase stock
                           print("You have removed \(quantity) Cereal(s) from your cart!")
                       } else {
                           print("You don't have that many cereal(s) in your cart.") // Insufficient items in cart message
                       }
                   } else {
                       print("Invalid quantity. Please enter a valid number.")
                   }
               }
// Milks
        else if itemInput == "2" {
            print("How many Milk(s) would you like to remove from your cart?:")
            if let quantityInput = readLine(), let quantity = Int(quantityInput), quantity > 0 {
                if quantity <= milksInCart {
                    milksInCart -= quantity
                    milkInStock += quantity
                    print("You have removed \(quantity) Milk(s) from your cart!")
                } else {
                    print("You don't have that many milk(s) in your cart.")
                }
            } else {
                print("Invalid quantity. Please enter a valid number.")
            }
        }
//Syrup
        else if itemInput == "3" {
            print("How many Syrup(s) would you like to remove from your cart?:")
            if let quantityInput = readLine(), let quantity = Int(quantityInput), quantity > 0 {
                if quantity <= syrupsInCart {
                    syrupsInCart -= quantity
                    syrupInStock += quantity
                    print("You have removed \(quantity) Syrup(s) from your cart!")
                } else {
                    print("You don't have that many syrup(s) in your cart.")
                }
            } else {
                print("Invalid quantity. Please enter a valid number.")
            }
        }
//cup
        else if itemInput == "4" {
            print("How many Cup(s) would you like to remove from your cart?:")
            if let quantityInput = readLine(), let quantity = Int(quantityInput), quantity > 0 {
                if quantity <= cupsInCart {
                    cupsInCart -= quantity
                    cupsInStock += quantity
                    print("You have removed \(quantity) Cup(s) from your cart!")
                } else {
                    print("You don't have that many cup(s) in your cart.")
                }
            } else {
                print("Invalid quantity. Please enter a valid number.")
            }
        }
        // Invalid input
        else {
            print("Invalid selection. Please choose a valid option.")
        }

            //calculate total
            let total = Double(cerealsInCart) * cerealPrice +
                        Double(milksInCart) * milkPrice +
                        Double(syrupsInCart) * syrupPrice +
                        Double(cupsInCart) * cupsPrice
            print("Your current total is: $\(total)")
            print("")
        }
    }


// 3. Check if item is in stock
func checkItem(){
    print("What item would you like to check if it's in stock? (Enter number of selection)")
    print("1. Cereal")
    print("2. Milk")
    print("3. Syrup")
    print("4. Cups")

    // Read user input for checking stock
    if let itemInput = readLine() {
//Cereals
        if itemInput == "1" {
            print("There are currently \(cerealInStock) Cereal(s) in stock.")
//Milks
        } else if itemInput == "2" {
            print("There are currently \(milkInStock) Milk(s) in stock.")
//Syrups
        } else if itemInput == "3" {
            print("There are currently \(syrupInStock) Syrup(s) in stock.")
//Cups
        } else if itemInput == "4" {
            print("There are currently \(cupsInStock) Cup(s) in stock.")
        // Invalid input handling
        } else {
            print("Invalid selection. Please choose a valid option.")
        }
    }
}


// 4. Admin Menu
func adminMenu(){
    print("Enter Admin ID: ****")
    
    // Read user input for admin selection
    if let adminID = readLine() {
        // Restock item selection
        if adminID == "0000" {
            var isAdminMenuActive = true // Control variable for admin menu loop
            // Keep showing the admin menu until the user chooses to exit
            while isAdminMenuActive {
    print("Welcome to the Admin menu! Let us know how we can help you (Enter number of selection): ")
    print("1. Restock inventory")
    print("2. Generate report")
    print("3. Check number of items")
    print("4. Quit admin menu")

    // Read the admin menu selection input
    if let adminInput = readLine() {
        if adminInput == "1" {
            
            // Restock inventory
            print("What would you like to restock? (Enter number of selection): ")
            print("1. Cereal")
            print("2. Milk")
            print("3. Syrup")
            print("4. Cups")
            
            if let restockInput = readLine() {
//Cereals
                if restockInput == "1" {
                    print("How many units of cereal would you like to restock?: ")
                    if let quantityInput = readLine(), let quantity = Int(quantityInput), quantity > 0 {
                        cerealInStock += quantity // Increase stock by the specified quantity
                        print("Restocked \(quantity) units of cereal.")
                    } else {
                        print("Invalid quantity. Please enter a valid number.")
                    }
//Milks
                } else if restockInput == "2" {
                    print("How many units of milk would you like to restock?: ")
                    if let quantityInput = readLine(), let quantity = Int(quantityInput), quantity > 0 {
                        milkInStock += quantity // Increase stock by the specified quantity
                        print("Restocked \(quantity) units of milk.")
                    } else {
                        print("Invalid quantity. Please enter a valid number.")
                    }
//Syrups
                } else if restockInput == "3" {
                    print("How many units of syrup would you like to restock?: ")
                    if let quantityInput = readLine(), let quantity = Int(quantityInput), quantity > 0 {
                        syrupInStock += quantity // Increase stock by the specified quantity
                        print("Restocked \(quantity) units of syrup.")
                    } else {
                        print("Invalid quantity. Please enter a valid number.")
                    }
//Cups
                } else if restockInput == "4" {
                    print("How many units of cups would you like to restock?: ")
                    if let quantityInput = readLine(), let quantity = Int(quantityInput), quantity > 0 {
                        cupsInStock += quantity // Increase stock by the specified quantity
                        print("Restocked \(quantity) units of cups.")
                    } else {
                        print("Invalid quantity. Please enter a valid number.")
                    }
                } else {
                    print("Invalid selection. Please choose a valid option.")
                }
            }
            
        // Option to generate a report
        } else if adminInput == "2" {
            // Generate report
            let remainingInventory = cerealInStock + milkInStock + syrupInStock + cupsInStock
            let totalSales = Double(cerealsInCart) * cerealPrice +
                             Double(milksInCart) * milkPrice +
                             Double(syrupsInCart) * syrupPrice +
                             Double(cupsInCart) * cupsPrice
            
            // Print the summary report
            print("Summary Report:")
            print("Remaining cereals: \(cerealInStock) items")
            print("Remaining milks: \(milkInStock) items")
            print("Remaining syrups: \(syrupInStock) items")
            print("Remaining cups: \(cupsInStock) items")
            print("Remaining inventory: \(remainingInventory) items")
            print("Total Sales: $\(totalSales)")
            
        // Option to check the number of items in stock
        } else if adminInput == "3" {
            // Check number of items
            print("What item would you like to check if it's in stock? (Enter number of selection):")
            print("1. Cereal")
            print("2. Milk")
            print("3. Syrup")
            print("4. Cups")
            
            if let checkInput = readLine() {
                if checkInput == "1" {
                    print("There are currently \(cerealInStock) cereals in stock.")
                } else if checkInput == "2" {
                    print("There are currently \(milkInStock) milks in stock.")
                } else if checkInput == "3" {
                    print("There are currently \(syrupInStock) syrups in stock.")
                } else if checkInput == "4" {
                    print("There are currently \(cupsInStock) cups in stock.")
                } else {
                    print("Invalid selection. Please choose a valid option.")
                }
            }
            
        // Option to quit the admin menu
        } else if adminInput == "4" {
            // Quit admin menu
            print("Returning to normal menu") // Notify user they are leaving the admin menu
            isAdminMenuActive = false // Exit the admin menu loop
        } else {
            print("Invalid selection. Please choose a valid option.")
        }
    }
}
        } else {
            print("Incorrect ID, Autodestruction system triggered")
            print("3...2...1")
            print("B o o m")
            print("")
        }
    }
}


// 5. Checkout
func checkout(){
    //calculate total
    let subtotal = (Double(cerealsInCart) * cerealPrice) +
                (Double(milksInCart) * milkPrice) +
                (Double(syrupsInCart) * syrupPrice) +
                (Double(cupsInCart) * cupsPrice)
    let tax = subtotal * 0.0925 // 9.25% tax
    let total = subtotal + tax
    
    print("Thanks for shopping with us!")
    print("You purchases the following:")
    print("Cereals:\(cerealsInCart)")
    print("Milks:\(milksInCart)")
    print("Syrups:\(syrupsInCart)")
    print("Cups:\(cupsInCart)")
    print("Your subtotal is: \(subtotal)")
    print("Tax (9.25%): \(tax)")
    print("Your grand total is: \(total)")
    
    // Update sales and reset cart
       totalSales += total
       cerealsInCart = 0
       milksInCart = 0
       syrupsInCart = 0
       cupsInCart = 0
}
