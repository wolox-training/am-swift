//
//  BookRepository.swift
//  WBooks
//
//  Created by ana.mancuso on 30/09/2022.
//
import Alamofire

class BookRepository {
    
func fetchBooks(onSuccess: @escaping ([Library]) -> Void, onError: @escaping (Error) -> Void) {
        let url = URL(string: "https://private-deb86-wbooksiostraining.apiary-mock.com/books")!

    AF.request(url, method: .get).responseJSON { response in

            switch response.result {
            case .success(let value):
                guard let JSONbooks = try? JSONSerialization.data(withJSONObject: value, options: []) else {
                onError(BookError.decodeError)
                    return
                }

                guard let books = try? JSONDecoder().decode([Library].self, from: JSONbooks) else {
                    onError(BookError.decodeError)
                    return
                }

                onSuccess(books)

            case .failure(let error):
                onError(error)
            }
        }
    }
    
}

enum BookError: Error {
    case decodeError
}
