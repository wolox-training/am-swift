//
//  PostRepository.swift
//  WBooks
//
//  Created by ana.mancuso on 12/10/2022.
//
import Alamofire

class PostRepository {
    
func fetchBooks(onSuccess: @escaping ([Post]) -> Void, onError: @escaping (Error) -> Void) {
        let url = URL(string: "https://private-deb86-wbooksiostraining.apiary-mock.com/rents")!

    AF.request(url, method: .get).responseJSON { response in

            switch response.result {
            case .success(let value):
                guard let JSONbooks = try? JSONSerialization.data(withJSONObject: value, options: []) else {
                onError(rentsError.decodeError)
                    return
                }

                guard let rents = try? JSONDecoder().decode([Post].self, from: JSONbooks) else {
                    onError(rentsError.decodeError)
                    return
                }

                onSuccess(rents)

            case .failure(let error):
                onError(error)
            }
        }
    }
    
}

enum rentsError: Error {
    case decodeError
}
