import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: Order
    static let paymentTypes = ["Cash", "Credit", "LetsDine Points"]
    static let tipAmounts = [10, 20, 25,30]
    @State private var paymentType = 0
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var tipAmount = 1
    var body: some View {
        Form{
            Section{
                Picker("Choose type of payment", selection: $paymentType){
                    ForEach(0..<Self.paymentTypes.count){
                        Text(Self.paymentTypes[$0])
                    }
                }
                Toggle(isOn: $addLoyaltyDetails.animation()){
                    Text("Add LetsDine Loyalty Card")
                }
                if addLoyaltyDetails {
                   TextField("Enter your LetsDine ID", text: $loyaltyNumber)
                }
            }
            Section(header: Text("Add a tip?")){
                Picker("Percentage:", selection: $tipAmount){
                    ForEach(0..<Self.tipAmounts.count){
                        Text("\(Self.tipAmounts[$0])%")
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            Section(header: Text("TOTAL: $100")){
                Button("Confirm Order"){
                    #warning("Add functionality")
                }
            }
        }
        .navigationBarTitle(Text("Payment"), displayMode: .inline)
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        CheckoutView().environmentObject(order)
    }
}
