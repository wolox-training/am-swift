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
    
    func fetchComments(id: Int, onSuccess: @escaping ([Reviewer]) -> Void, onError: @escaping (Error) -> Void) {
        let url = URL(string: "https://private-anon-36d238496c-wbooksiostraining.apiary-mock.com/books/\(id)/comments")!
        AF.request(url, method: .get).responseJSON { response in
            switch response.result {
            case .success(let value):
                guard let JSONbooks = try? JSONSerialization.data(withJSONObject: value, options: []) else {
                    onError(BookError.decodeError)
                    return
                }
                guard let comments = try? JSONDecoder().decode([Reviewer].self, from: JSONbooks) else {
                    onError(BookError.decodeError)
                    return
                }
                onSuccess(comments)
            case .failure(let error):
                onError(error)
            }
        }
    }
    
    func fetchPost(id: Int, onSuccess: @escaping (Users) -> Void, onError: @escaping (Error) -> Void) {
        let url = URL(string: "https://private-deb86-wbooksiostraining.apiary-mock.com/rents")!
        let dictionary = ["book_id": id]
        AF.request(url, method: .post, parameters: dictionary).responseJSON { response in
            switch response.result {
            case .success(let value):
                print(value)
                guard let JSONbooks = try? JSONSerialization.data(withJSONObject: value, options: []) else {
                    onError(BookError.decodeError)
                    return
                }
                guard let rent = try? JSONDecoder().decode(Users.self, from: JSONbooks) else {
                    onError(BookError.decodeError)
                    return
                }
                onSuccess(rent)
            case .failure(let error):
                onError(error)
            }
        }
    }
    
    func fetchPostAddNew(request: AddNewBook, onSuccess: @escaping (Library) -> Void, onError: @escaping (Error) -> Void) {
        let url = URL(string: "https://private-deb86-wbooksiostraining.apiary-mock.com/books")!
        AF.request(url, method: .post, parameters: request).responseJSON { response in
            switch response.result {
            case .success(let value):
                print(value)
                guard let JSONbooks = try? JSONSerialization.data(withJSONObject: value, options: []) else {
                    onError(BookError.decodeError)
                    return
                }
                guard let books = try? JSONDecoder().decode(Library.self, from: JSONbooks) else {
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
