//
//  ContentView.swift
//  AlgoGreatCauses
//
//  Created by Mario Fernandes on 05/08/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack() {
                Image("welcomeImg")
                
                VStack(alignment: .center) {
                    
                    NavigationLink(destination: categoriesUI()) {
                        
                        Image(systemName:"chevron.right.square.fill")
                            
                            .font(.system(size: 70.0))
                            .foregroundColor((Color("seta")))
                    }
                }
                Spacer()
            }
            .edgesIgnoringSafeArea(.top)
            .background((Color("T2")))
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
