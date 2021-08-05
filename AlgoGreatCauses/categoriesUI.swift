//
//  categoriesUI.swift
//  AlgoGreatCauses
//
//  Created by Mario Fernandes on 05/08/2021.
//

import SwiftUI

struct categoriesUI: View {
    @State var algoCategories = algoData
    
    var body: some View {
        
        List(algoCategories) { EnvioData in
            NavigationLink(
                destination: donationUI(EnvioData: EnvioData)) {
                ZStack () {
                    Image(EnvioData.imageName)
                    Text(EnvioData.title)
                        .foregroundColor(Color("ColorWhite"))
                        .font(.custom("AvenirNext-Bold", size: 24))
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                        
                        .padding(.top, 35.0)
                        .alignmentGuide(HorizontalAlignment.center) { _ in  150 }
                }
            }
        }
        .listStyle(PlainListStyle())
        .navigationBarTitle("Categories")
    }
}

struct categoriesUI_Previews: PreviewProvider {
    static var previews: some View {
        categoriesUI()
    }
}
