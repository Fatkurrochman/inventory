//
//  BarangViewModel.swift
//  inventory
//
//  Created by Rinaldi on 24/05/22.
//

import Foundation
import CoreData

class BarangViewModel: ObservableObject {
    @Published var id: NSManagedObjectID = NSManagedObjectID()
    @Published var barangUUID: UUID = UUID()
    @Published var code: String = ""
    @Published var name: String = ""
    @Published var barangQty: Int64 = 0
    @Published var qty: String = ""
    
    @Published var isPresented: Bool = false
    @Published var status: String = ""
    @Published var barang: [BarangModel] = []
    
    init() {
        setDefaultForm()
        fetchBarang()
    }
    
    func filterBarang() -> [BarangModel] {
        return barang.filter { barang in
            if barang.code != "" {
                return true
            }
            else {
                return false
            }
        }
    }
    func setDefaultForm() {
        self.name = ""
        self.code = ""
        self.barangQty = 0
        self.qty = ""
        self.barangUUID = UUID()
    }
    func fillForm(model: BarangModel) {
        self.id = model.id
        self.name = model.name
        self.status = "edit"
        self.barangUUID = model.barangUUID
        self.code = model.code
        self.qty = String(model.qty)
        self.barangQty = model.qty
        self.isPresented = true
    }
    func fetchBarang() {
        self.barang = InventoryCoreDataManager.shared.fetchBarang()
    }
    func create() {
        let barang = Barang(context: InventoryCoreDataManager.shared.viewContext)
        barang.name = self.name
        barang.code = self.code
        barang.qty = Int64(self.qty) ?? 0
        barang.barang_uuid = self.barangUUID
        
        InventoryCoreDataManager.shared.save()
        fetchBarang()
    }
    func edit() {
        let barang = InventoryCoreDataManager.shared.getBarangById(id: self.id)
        if let barang = barang {
            barang.name = self.name
            barang.code = self.code
            barang.qty = Int64(self.qty) ?? 0
            InventoryCoreDataManager.shared.save()
        }
        fetchBarang()
    }
    func deleteById(model: BarangModel) {
        let barang = InventoryCoreDataManager.shared.getBarangById(id: model.id)
        if let barang = barang {
            InventoryCoreDataManager.shared.viewContext.delete(barang)
            InventoryCoreDataManager.shared.save()
        }
        fetchBarang()
    }
}
