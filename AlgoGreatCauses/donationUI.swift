//
//  donationUI.swift
//  AlgoGreatCauses
//
//  Created by Mario Fernandes on 05/08/2021.
//

import SwiftUI
import swift_algorand_sdk

struct donationUI: View {
    @Environment(\.openURL) var openURL
    // MARK: -  Balance
    @State var checkTransaction:String = ""
    @State var balanceAfter:String = ""
    @State var balanceBefore:String = ""
    
    @State private var assetRewardState = false
    @State var isLoading = false
    let transactionSuccedImage = "orderPlaced"
    let transactionFailImage = "orderfail"
    @State private var compileVerified = false
    @State private var transactionIsShowing = false
    @State private var compileIsPass = false
    @State var complieHash:String = "Hash"
    @State var clearStateProgramSource = "compile.teal"
    
    // MARK: - PureStake API
    var ALGOD_API_ADDR="https://testnet-algorand.api.purestake.io/ps2"
    var ALGOD_API_TOKEN="G—————————————————l5"
    var ALGOD_API_PORT=""
    
    // MARK: - data
    let EnvioData:data
    
    // MARK: - Checkbox values
    @State var titleCodeN1:String = "1 Algo"
    @State var titleCodeN2:String = "1 Algo"
    @State var isSelectboxAllOK:Bool = false
    @State var isSelectboxCodeOK:Bool = false

    @State var isCheckedCodeN1:Bool = false
    @State var isCheckedCodeN2:Bool = false
    @State var isCheckedCodeN3:Bool = false
 
    // MARK: - Checkbox functions
    func toggleCodeN1(){
       isCheckedCodeN1 = !isCheckedCodeN1
        isSelectboxCodeOK = true
       }
   
   func toggleCodeN2(){
       isCheckedCodeN2 = !isCheckedCodeN2
        isSelectboxCodeOK = true
          }
    
    func toggleCodeN3(){
        isCheckedCodeN3 = !isCheckedCodeN3
         isSelectboxCodeOK = true
           }
    
    // MARK: - Checkbox Aspect
    struct LabelCheckboxText: ViewModifier {
        
        func body(content: Content) -> some View {
            return  content
                .foregroundColor(Color("T2"))
                .font(.custom("AvenirNext-Bold", size: 20))
                .multilineTextAlignment(.leading)
                .padding(.leading, 15.0)
        }
    }
    
    struct LabelCheckbox: ViewModifier {
        
        func body(content: Content) -> some View {
            return  content
                .foregroundColor(Color("T2"))
                .font(.custom("AvenirNext-Bold", size: 24))
                .multilineTextAlignment(.leading)
                .padding(.leading, 15.0)
        }
    }
    
    struct LabelRecta: ViewModifier {
        
        func body(content: Content) -> some View {
            return  content
                .foregroundColor((Color("rectTab")))
                .cornerRadius(15)
        }
    }
    
    
    
    var body: some View {
        ScrollView (.vertical, showsIndicators: false) {
            // MARK: - top Image and text
            VStack(alignment: .center) {
                Image("causesTopImage")
                
                VStack(alignment: .leading) {
                    Text("Atomic Transfer")
                        .font(.title2)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                    
                    Text("Select our cause and help.")
                        .multilineTextAlignment(.leading)
                }
               
                HStack(alignment: .top) {
                    // MARK: - First cause
                    VStack(alignment: .center){
                        
                        ZStack () {
                            Image(EnvioData.imageName1)
                            Image("selectBack")
                                .alignmentGuide(HorizontalAlignment.center) { _ in  70 }
                                .alignmentGuide(VerticalAlignment.center) { _ in  -130 }
                            
                            VStack(alignment: .leading , spacing: 4) {
                                
                                Button(action: toggleCodeN1){
                                    HStack{
                                        Image(systemName: isCheckedCodeN1 ? "checkmark.square": "square").modifier(LabelCheckbox())
                                        
                                        Text(titleCodeN1).modifier(LabelCheckboxText())
                                        
                                    }
                                    .alignmentGuide(HorizontalAlignment.center) { _ in  70 }
                                    .alignmentGuide(VerticalAlignment.center) { _ in  -135 }
                                }
                            }
                        }
                    }
                    .padding(.trailing)
                
                    // MARK: - Second cause
                    VStack {
                        ZStack () {
                            Image(EnvioData.imageName2)
                            Image("selectBack")
                                .alignmentGuide(HorizontalAlignment.center) { _ in  70 }
                                .alignmentGuide(VerticalAlignment.center) { _ in  -45 }
                            
                            VStack(alignment: .leading , spacing: 4) {
                                Button(action: toggleCodeN2){
                                  
                                    HStack{
                                        Image(systemName: isCheckedCodeN2 ? "checkmark.square": "square").modifier(LabelCheckbox())
                                        
                                        Text(titleCodeN2).modifier(LabelCheckboxText())
                                        
                                    }
                                    .alignmentGuide(HorizontalAlignment.center) { _ in  70 }
                                    .alignmentGuide(VerticalAlignment.center) { _ in  -50 }
                                }
                            }
                        }
                    // MARK: - Third cause
                        ZStack () {
                            Image(EnvioData.imageName3)
                            Image("selectBack")
                                .alignmentGuide(HorizontalAlignment.center) { _ in  70 }
                                .alignmentGuide(VerticalAlignment.center) { _ in  -45 }
                            
                            VStack(alignment: .leading , spacing: 4) {
                                Button(action: toggleCodeN3){
                                    
                                    HStack{
                                        Image(systemName: isCheckedCodeN3 ? "checkmark.square": "square").modifier(LabelCheckbox())
                                        
                                        Text(titleCodeN2).modifier(LabelCheckboxText())
                                        
                                    }
                                    .alignmentGuide(HorizontalAlignment.center) { _ in  70 }
                                    .alignmentGuide(VerticalAlignment.center) { _ in  -50 }
                                }
                            }
                        }
                    }
            }
            .padding(.bottom)
                // MARK: - Buttons
            HStack(alignment: .top) {
            
                Button(action: {
                    self.tealCompile()
                    self.getAccountBalance(){amount in
                        print(amount)
                        balanceBefore = String(amount)
                    }
                }) {
                    Image("compileBtn")
                        .padding(.bottom)
                }
                
                
                Button(action: {
                    self.createtransactions()
                    self.startHolding()
                }) {
                    Image("donateBtn")
                        .padding(.bottom)
                }
                // MARK: - presentation result
                .sheet(isPresented:  $assetRewardState) {
                    VStack(){
                        if self.transactionIsShowing == true {
                            Image(transactionSuccedImage)
                            Text("Account Balance Before Transaction: \(balanceBefore)")
                            Text("Account Balance After Transaction: \(balanceAfter)")
                            Button("Dismiss",
                                   action: {  self.assetRewardState.toggle() })
                            Button("Check Transaction") {
                                openURL(URL(string: "https://testnet.algoexplorer.io/address/\(String(checkTransaction))")!)
                            }
                            
                        } else  if self.transactionIsShowing == false {
                            Image(transactionFailImage)
                            
                            Button("Dismiss",
                                   action: {  self.assetRewardState.toggle() })
                        }
                    }
                }
                .disabled(compileVerified == false)
                .opacity(compileVerified == false ? 0.0 : 1)
            }
                // MARK: - Compile
                Text(complieHash)
                    .foregroundColor(.black)
                    .padding(.bottom, 50.0)
                // MARK: - Loading
                if isLoading {
                    ZStack {
                        Color(.white)
                            .ignoresSafeArea()
                            .opacity(0.9)
                        
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .black))
                            .scaleEffect(3)
                    }
                    .frame(height: 90.0)
                }
            }
            
            .background((Color("T2")))
        }
        .edgesIgnoringSafeArea(.top)
    }
    
    // MARK: - function Balance

    func getAccountBalance(functionToCall: @escaping (String)->Void){
        let algodClient=AlgodClient(host: ALGOD_API_ADDR, port: ALGOD_API_PORT, token: ALGOD_API_TOKEN)
        algodClient.set(key: "X-API-KeY")
        let mnemonic = EnvioData.mnemonic
        let account = try! Account(mnemonic)
        algodClient.accountInformation(address: account.address.description).execute(){accountInformationResponse in
            if(accountInformationResponse.isSuccessful){
                print("\(accountInformationResponse.data!.amount!)")
                checkTransaction = (String(account.address.description))
                functionToCall("\(accountInformationResponse.data!.amount!)")
            }else{
                functionToCall("\(String(describing: accountInformationResponse.errorDescription))")
                
            }
        }
        
    }
    
    // MARK: - function Loading
    func startHolding(){
        isLoading = true

    }
    
    func startHoldingOff(){
        isLoading = false

    }
    // MARK: - function tealCompile
    public func tealCompile(){
        
        let algodClient=AlgodClient(host: ALGOD_API_ADDR, port: ALGOD_API_PORT, token: ALGOD_API_TOKEN)
        algodClient.set(key: "X-API-KeY")
        
        let source:[Int8] = donationUI.loadSampleTeal(resource: clearStateProgramSource)
        
        algodClient.tealCompile().source(source: source).execute(){compileResponse in
            if(compileResponse.isSuccessful){
                print(compileResponse.data?.hash as Any)
                print(compileResponse.data?.result as Any)
                self.compileVerified = true
                self.complieHash = "Result: \(compileResponse.data!.result!)\n Hash: \(compileResponse.data!.hash!)"
            }else{
                print(compileResponse.errorMessage!)
                complieHash = compileResponse.errorMessage!
            }
        }
        print(source)
    }
    
    public static func loadSampleTeal(resource:String)  -> [Int8] {
        let configURL = Bundle.main.path(forResource: resource, ofType: "txt")
        let contensts = try! String(contentsOfFile: configURL!.description)
        let jsonData = contensts.data(using: .utf8)!
        let  data = CustomEncoder.convertToInt8Array(input: Array(jsonData))
        print(data)
        return data
    }
    
    // MARK: - function tealCompile Dryrun
    
    public static func loadSampleTeal2()  -> [Int8] {
        let configURL = Bundle.main.path(forResource: "compile.teal", ofType: "txt")
        let contensts = try! String(contentsOfFile: configURL!.description)
        let jsonData = contensts.data(using: .utf8)!

        let  data = CustomEncoder.convertToInt8Array(input: Array(jsonData))
        print(data)
        return data
       }
    
    
    // MARK: - function transaction
    func createtransactions(){
        
        let algodClient=AlgodClient(host: ALGOD_API_ADDR, port: ALGOD_API_PORT, token: ALGOD_API_TOKEN)
        algodClient.set(key: "X-API-KeY")
        
       
        // MARK: - data.swift
        let mnemonic = EnvioData.mnemonic
        let mnemonic1 = EnvioData.mnemonic1
        let mnemonic3 = EnvioData.mnemonic3
        let mnemonic2 = EnvioData.mnemonic2
        
        let account = try! Account(mnemonic)
        let account1 = try! Account(mnemonic1)
        let account2 = try! Account(mnemonic2)
        let account3 = try! Account(mnemonic3)
        let senderAddress = account.getAddress()
        let receiverAddress1 = account1.getAddress()
        let receiverAddress2 = account2.getAddress()
        let receiverAddress3 = account3.getAddress()

        algodClient.transactionParams().execute(){ paramResponse in
            if(!(paramResponse.isSuccessful)){
                print(paramResponse.errorDescription!);
                print("OK")
                return;
            }
        
            // MARK: - DryrunRequest
            var sources:[DryrunSource] = Array()
            var stxns:[SignedTransaction] = Array()
            let source:[Int8] = donationUI.loadSampleTeal2()
            let dryRunSource = DryrunSource()
            let dryRunRequest = DryrunRequest()
            dryRunSource.fieldName =  "approv"
            dryRunSource.source =  String(data: Data(CustomEncoder.convertToUInt8Array(input:  source)),encoding: .utf8)!
            dryRunSource.txnIndex = 01
            sources.append(dryRunSource)
            
            let program:[Int8] = CustomEncoder.convertToInt8Array(input: CustomEncoder.convertBase64ToByteArray(data1: "ASABASI="))
            
            let lsig = try! LogicsigSignature(logicsig: program)
            
            _ = try! account.signLogicsig(lsig: lsig)
            // MARK: - transaction array
            var transactions1:[swift_algorand_sdk.Transaction] = Array()
            
            // MARK: - Check causes selected
            if isCheckedCodeN1 == true {
            let tx1 = try! Transaction.paymentTransactionBuilder().setSender(senderAddress)
             .amount(1000000)
             .receiver(receiverAddress1)
             .note("Swift Algo sdk is cool".bytes)
             .suggestedParams(params: paramResponse.data!)
             .build()
            
            transactions1.append(tx1)
        }
            
            if isCheckedCodeN2 == true {
            let tx2 = try! Transaction.paymentTransactionBuilder().setSender(senderAddress)
              .amount(1000000)
              .receiver(receiverAddress2)
              .note("Swift Algo sdk is cool".bytes)
              .suggestedParams(params: paramResponse.data!)
              .build()
                transactions1.append(tx2)
            }
            if isCheckedCodeN3 == true {
            let tx3 = try! Transaction.paymentTransactionBuilder().setSender(senderAddress)
              .amount(1000000)
              .receiver(receiverAddress3)
              .note("Swift Algo sdk is cool".bytes)
              .suggestedParams(params: paramResponse.data!)
              .build()
                transactions1.append(tx3)
            }
            // MARK: - Signed Transaction and Atomic Transfer
            let gid = try! TxGroup.computeGroupID(txns: transactions1)
            var signedTransactions:[SignedTransaction?]=Array(repeating: nil, count: transactions1.count)
            for i in 0..<transactions1.count{
                transactions1[i].assignGroupID(gid: gid)
                signedTransactions[i]=Account.signLogicsigTransaction(lsig: lsig,tx: transactions1[i])
                stxns.append(signedTransactions[i]!)
                dryRunRequest.sources = sources
                dryRunRequest.txns = stxns
            }

            _ = CustomEncoder.encodeToJson(obj: dryRunRequest)
            var encodedTrans:[Int8]=Array()
            for i in 0..<signedTransactions.count{
                encodedTrans = encodedTrans+CustomEncoder.encodeToMsgPack(signedTransactions[i])
            }
            algodClient.tealDryRun().request(request: dryRunRequest).execute(){ requestResponse in
//
                        if(requestResponse.isSuccessful){
                            print(requestResponse.data!.toJson() as Any)
                            
                            algodClient.rawTransaction().rawtxn(rawtaxn: encodedTrans).execute(){
                                                  response in
                                if(response.isSuccessful){
                                   
                                    print(response.data!.txId)
                                    print("foi criado")
                                    self.waitForTransaction(txId:response.data!.txId)
                     
                                    
                                }else{
                                    print(response.errorDescription!)
                                    print("Failed")
                                }
                            }
                           
                           

                            print("Created")
                        }else{
                            print("Failed")
                        }
                    }
        }
    }
    
    func waitForTransaction(txId:String) {
   
        let algodClient=AlgodClient(host: ALGOD_API_ADDR, port: ALGOD_API_PORT, token: ALGOD_API_TOKEN)
        algodClient.set(key: "X-API-KeY")
        var confirmedRound: Int64?=0
        algodClient.pendingTransactionInformation(txId:txId).execute(){
            pendingTransactionResponse in
            if(pendingTransactionResponse.isSuccessful){
                confirmedRound=pendingTransactionResponse.data!.confirmedRound
                // MARK: - Show the result
                if(confirmedRound != nil && confirmedRound! > 0){
                    print("confirmedRound")
                    self.transactionIsShowing = true
                    self.startHoldingOff()
                    if transactionIsShowing == true {
                        DispatchQueue.main.async {
                            print(transactionIsShowing)
                            self.assetRewardState = true
                            self.getAccountBalance(){amount in
                                balanceAfter = String(amount)
                            }
                        }
                    }
                }else{
                    self.waitForTransaction(txId: txId)
                }
            }else{
                print(pendingTransactionResponse.errorDescription!)
                self.transactionIsShowing = false
                self.startHoldingOff()
                if transactionIsShowing == false {
                    DispatchQueue.main.async {
                        print("fail")
                        self.assetRewardState = true
                        
                    }
                }
                confirmedRound=12000;
            }
        }
    }
}

struct donationUI_Previews: PreviewProvider {
    static var previews: some View {
        donationUI(EnvioData: algoData[0])
    }
}
