//
//  data.swift
//  AlgoGreatCauses
//
//  Created by Mario Fernandes on 05/08/2021.
//

import SwiftUI


struct data {
    let id = UUID()
    let categories: String
    let imageName: String
    let imageName1: String
    let imageName2: String
    let imageName3: String
    let title: String
    let algoValue: String
    var mnemonic: String
    var mnemonic1: String
    var mnemonic2: String
    var mnemonic3: String


}

extension data: Identifiable { }


let algoData = [
    data(categories: "Environment", imageName: "enviornement", imageName1: "photoReceiver1", imageName2: "photoReceiver2", imageName3: "photoReceiver3", title: "Environment", algoValue: "100000",
         mnemonic: "fork ork fork fork fork fork fork fork fork fork fork fork fork fork v fork fork fork fork fork fork fork fork fork fork fork fork social",
         mnemonic1: "dork fork fork fork fork fork fork fork fork fork fork fork fork v fork fork fork fork fork fork fork fork fork fork fork fork check",
         mnemonic2: "diet say deposit aerobic wisdom twist alarm creek trap try ahead rapid lucky aisle hawk tissue weather saddle mobile elegant guitar usual garlic abstract pupil",
         mnemonic3: "work fork fork fork fork fork fork fork fork fork fork fork fork v fork fork fork fork fork fork fork fork fork fork fork fork"),

    data(categories: "Health", imageName: "health", imageName1: "photoReceiver1", imageName2: "photoReceiver2", imageName3: "photoReceiver3", title: "Health", algoValue: "100000",
         mnemonic: "fork ork fork fork fork fork fork fork fork fork fork fork fork fork v fork fork fork fork fork fork fork fork fork fork fork fork social",
         mnemonic1: "dork fork fork fork fork fork fork fork fork fork fork fork fork v fork fork fork fork fork fork fork fork fork fork fork fork check",
         mnemonic2: "diet say deposit aerobic wisdom twist alarm creek trap try ahead rapid lucky aisle hawk tissue weather saddle mobile elegant guitar usual garlic abstract pupil",
         mnemonic3: "work fork fork fork fork fork fork fork fork fork fork fork fork v fork fork fork fork fork fork fork fork fork fork fork fork"),

    data(categories: "Housing", imageName: "housing", imageName1: "photoReceiver1", imageName2: "photoReceiver2", imageName3: "photoReceiver3", title: "Housing", algoValue: "100000",
         mnemonic: "fork ork fork fork fork fork fork fork fork fork fork fork fork fork v fork fork fork fork fork fork fork fork fork fork fork fork social",
         mnemonic1: "dork fork fork fork fork fork fork fork fork fork fork fork fork v fork fork fork fork fork fork fork fork fork fork fork fork check",
         mnemonic2: "diet say deposit aerobic wisdom twist alarm creek trap try ahead rapid lucky aisle hawk tissue weather saddle mobile elegant guitar usual garlic abstract pupil",
         mnemonic3: "work fork fork fork fork fork fork fork fork fork fork fork fork v fork fork fork fork fork fork fork fork fork fork fork fork"),

    data(categories: "Biotechnology", imageName: "Biotechnology", imageName1: "photoReceiver1", imageName2: "photoReceiver2", imageName3: "photoReceiver3", title: "Biotechnology", algoValue: "100000",
         mnemonic: "fork ork fork fork fork fork fork fork fork fork fork fork fork fork v fork fork fork fork fork fork fork fork fork fork fork fork social",
         mnemonic1: "dork fork fork fork fork fork fork fork fork fork fork fork fork v fork fork fork fork fork fork fork fork fork fork fork fork check",
         mnemonic2: "diet say deposit aerobic wisdom twist alarm creek trap try ahead rapid lucky aisle hawk tissue weather saddle mobile elegant guitar usual garlic abstract pupil",
         mnemonic3: "work fork fork fork fork fork fork fork fork fork fork fork fork v fork fork fork fork fork fork fork fork fork fork fork fork")
  ]

