//
//  TabBarView.swift
//  inventory
//
//  Created by Rinaldi on 24/05/22.
//

import SwiftUI

struct TabBarView: View {
    @State private var selectedTab = 3
    
    @EnvironmentObject var loginVM: LoginViewModel
    
    @ObservedObject var barangVM: BarangViewModel = BarangViewModel()
    @ObservedObject var karyawanVM: KaryawanViewModel = KaryawanViewModel()
    @ObservedObject var peminjamanVM: PeminjamanViewModel = PeminjamanViewModel()
    
    var body: some View {
        TabView(selection: $selectedTab) {
            BarangView().tabItem {
                Text("Barang")
            }.tag(1).environmentObject(barangVM)
            KaryawanView().tabItem {
                Text("Karyawan")
            }.tag(2).environmentObject(karyawanVM)
            PeminjamanView().tabItem {
                Text("Peminjaman")
            }.tag(3).environmentObject(peminjamanVM)
        }
            
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
