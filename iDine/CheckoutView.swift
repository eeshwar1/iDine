//
//  CheckoutView.swift
//  iDine
//
//  Created by Venkateswaran Venkatakrishnan on 6/13/21.
//

import SwiftUI

struct CheckoutView: View {
    
    let tipAmounts = [10, 15, 20, 25, 0]
    let pickupTimes = ["Now", "Tonight", "Tomorrow Morning"]
    
    @EnvironmentObject var order: Order
    
    @State private var paymentType = "Cash"
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var tipAmount = 15
    @State private var showingPaymentAlert = false
    @State private var pickupTime = "Now"
   
    let paymentTypes = ["Cash", "Credit Card", "iDine Points"]
    var body: some View {
        Form {
            Picker("How do you want to pay?", selection: $paymentType) {
                ForEach(paymentTypes, id: \.self) {
                    Text($0)
                }
            }
            Toggle("Add iDine loyalty card", isOn: $addLoyaltyDetails.animation())
            if addLoyaltyDetails {
                TextField("Enter your iDine ID", text: $loyaltyNumber)
            }
            Picker("When would you like to pick up?", selection: $pickupTime) {
                ForEach(pickupTimes, id: \.self) {
                    Text($0)
                }
            }
            
            Section(header: Text("Add a tip?")) {
                Picker("Percentage:", selection: $tipAmount) {
                    
                    ForEach(tipAmounts, id: \.self) {
                        Text("\($0)%")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                
            }
         
            Section(header: Text("TOTAL: \(totalPrice)")
                        .font(.largeTitle)) {
                Button("Confirm order") {
                    showingPaymentAlert.toggle()
                }
                
            }
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
        .alert(isPresented: $showingPaymentAlert) {
            Alert(title: Text("Order confirmed"), message: Text("Your total was \(totalPrice) - thank you!"), dismissButton: .default(Text("OK")))
        
        }
    }
    
    var totalPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        let total = Double(order.total)
        let tipValue = total / 100 * Double(tipAmount)
        
        return formatter.string(from: NSNumber(value: total + tipValue)) ?? "$0"
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView().environmentObject(Order())
    }
}
