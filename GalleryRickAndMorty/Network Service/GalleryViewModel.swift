//
//  GalleryViewModel.swift
//  GalleryRickAndMorty
//
//  Created by Angelina on 14.02.2021.
//

import Moya

class GalleryViewModel {
    
    // MARK: - Private properties
    private let provider = MoyaProvider<NetworkService>(plugins: [NetworkLoggerPlugin()])
    
    // MARK: - Public funcs
    func getAlbum(onSuccess: @escaping (GalleryModel)->Void) {
        _ = provider.rx.request(.getAlbum).subscribe { event in
            switch event {
            case let .success(response):
                if let data = try? response.map(GalleryModel.self) {
//                    dump(data)
                    onSuccess(data)
                
                    AppStorage().image?.removeAll()
                    AppStorage().date?.removeAll()
                    AppStorage().name?.removeAll()
                    
                    AppStorage().isOnlineNow = true
                    var newArrayOfImages = [String]()
                    data.results.forEach { result in
                        newArrayOfImages.append(result.image)
                    }
                    var newArrayOfNames = [String]()
                    data.results.forEach { result in
                        newArrayOfNames.append(result.name)
                    }
                    AppStorage().name = newArrayOfNames
                    AppStorage().image = newArrayOfImages
                    
                    let time = NSDate()
                    let formatter = DateFormatter()
                    formatter.dateFormat = "dd.MM.YYYY HH:mm:ss"
                    let formattedDate = formatter.string(from: time as Date)
                    AppStorage().userDefaults.setValue(formattedDate, forKey: "date")
                } else {
                    print("Can't to parse")
                }
            case let .error(error):
                print(error)
                AppStorage().isOnlineNow = false
                AppLibrary.shared().showErrorMessage("Нет соединения с интернетом")
            }
        }
    }
}
