//
//  LoginViewModel.swift
//  WBooks
//
//  Created by ana.mancuso on 28/09/2022.
//

class LoginViewModel {
    
    func pulsacion() {
        print ("Boton pulsado")
        
    }
    
    func createViewModelLibrary() -> LibraryTableViewModel {
        return LibraryTableViewModel()
    }
}
