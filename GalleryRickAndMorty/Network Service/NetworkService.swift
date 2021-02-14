//
//  NetworkService.swift
//  GalleryRickAndMorty
//
//  Created by Angelina on 14.02.2021.
//

import Moya
import RxSwift

enum NetworkService {
    case getAlbum
}

extension NetworkService: TargetType {
    var baseURL: URL {
        URL(string: "https://rickandmortyapi.com/api/character")!
    }
    
    var path: String {
        switch self {
        case .getAlbum:
            return ""
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getAlbum:
            return .get
        }
    }
    
    var sampleData: Data {
        Data()
    }
    
    var task: Task {
        switch self {
        case .getAlbum:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        let headers = ["Content-type": "application/json",
                       "Accept": "application/json"]
        return headers
    }
}
