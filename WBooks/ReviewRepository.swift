//
//  ReviewRepository.swift
//  WBooks
//
//  Created by ana.mancuso on 12/10/2022.
//
import Alamofire

class ReviewRepository {
    
func fetchBooks(onSuccess: @escaping ([Reviewer]) -> Void, onError: @escaping (Error) -> Void) {
        let url = URL(string: "https://private-anon-36d238496c-wbooksiostraining.apiary-mock.com/books/book_id/comments")!

    AF.request(url, method: .get).responseJSON { response in

            switch response.result {
            case .success(let value):
                guard let JSONbooks = try? JSONSerialization.data(withJSONObject: value, options: []) else {
                onError(commentsError.decodeError)
                    return
                }

                guard let user = try? JSONDecoder().decode([Reviewer].self, from: JSONbooks) else {
                    onError(commentsError.decodeError)
                    return
                }

                onSuccess(user)

            case .failure(let error):
                onError(error)
            }
        }
    }
    
}

enum commentsError: Error {
    case decodeError
}

