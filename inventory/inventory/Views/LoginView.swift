//
//  LoginView.swift
//  inventory
//
//  Created by Rinaldi on 22/05/22.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var loginVM = LoginViewModel()
    var body: some View {
        VStack {
            Spacer()
            InventoryHelper.companyLogo
            Spacer()
            HStack {
                TextField("Username", text: $loginVM.password)
                    .padding()
                    .font(.system(size: 18, design: .rounded))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(InventoryHelper.buttonDashboard, lineWidth: 2)
                            .frame(height: 67)
                    )
            }
            .frame(height: 67, alignment: .center)
            .padding(.horizontal)
            
            HStack {
                TextField("Password", text: $loginVM.password)
                    .padding()
                    .font(.system(size: 18, design: .rounded))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(InventoryHelper.buttonDashboard, lineWidth: 2)
                            .frame(height: 67)
                    )
            }
            .frame(height: 67, alignment: .center)
            .padding(.horizontal)
            
            Spacer()
            Spacer()
            Button {
                //Action
            } label: {
                HStack {
                    Spacer()
                    Text("Login")
                        .font(.system(size: 18, design: .rounded))
                        .foregroundColor(Color.white)
                    Spacer()
                }
                .contentShape(Rectangle())
            }
            .frame(height: 67, alignment: .center)
            .background(InventoryHelper.buttonDashboard)
            .cornerRadius(10)
            .padding(.horizontal)
            Spacer()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
