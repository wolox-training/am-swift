//
//  LibraryTableViewModel.swift
//  WBooks
//
//  Created by ana.mancuso on 28/09/2022.
//
import UIKit

class LibraryTableViewModel {
    
    var library = [Library]()
    
    func loadSampleLibrarys() {
         
        let photo1 = UIImage(named: "Cover1")
        let photo2 = UIImage(named: "Cover2")
        let photo3 = UIImage(named: "Cover3")
        let photo4 = UIImage(named: "Cover4")
        let photo5 = UIImage(named: "Cover5")
         
        let cover1 = Library(name: "A Little Bird Told Me", photo: photo1, name2: "Timothy Cross")
        let cover2 = Library(name: "When the Doves Disappeared", photo: photo2, name2: "Sofi Oksannen")
        let cover3 = Library(name: "The Best Book in the World", photo: photo3, name2: "Peter Sjernstrom")
        let cover4 = Library(name: "Be Creative", photo: photo4, name2: "Tony Alcazar")
        let cover5 = Library(name: "Redesign The Web", photo: photo5, name2: "Liliana Castilla")
         
        library = [cover1, cover2, cover3, cover4, cover5]
         
     }
}
