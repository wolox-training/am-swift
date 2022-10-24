//
//  LoginViewModel.swift
//  WBooks
//
//  Created by ana.mancuso on 28/09/2022.
//

class LoginViewModel {
    
    var username: String = ""
    var password: String = ""
    func pulsacion() {
        debugPrint ("Boton pulsado")
    }
    
    func createViewModelLibrary() -> LibraryTableViewModel {
        return LibraryTableViewModel()
    }

    func verifyTexts() -> Bool {
        return !(username.isEmpty || password.isEmpty)
    }
    
}
