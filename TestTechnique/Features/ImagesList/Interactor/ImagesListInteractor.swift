import Foundation
import Alamofire

class ImagesListInteractor: PresenterToInteractorImagesListProtocol {
    var presenter: InteractorToPresenterProtocol?
    
    func fetchList(with keyword: String, pageIndex: Int) {
        let parameters : Parameters = [
            "query": keyword,
            "client_id": CLIENT_ID,
            "page": pageIndex
        ]
        AF.request(API_BASE_URL, method: .get, parameters: parameters, encoding: URLEncoding(destination: .queryString)).responseJSON {[weak self] response in
            if response.response?.statusCode == 200 {
                if let data = response.data {
                    if let response = try? JSONDecoder().decode(ImagesEntity.self, from: data) {
                        if (response.total ?? 0) > 0 {
                            self?.presenter?.getImagesList(images: response)
                        } else {
                            self?.presenter?.failToGetImages(error: ERROR_EMPTY)
                        }
                    } else {
                        self?.presenter?.failToGetImages(error: ERROR_MSG)
                    }
                } else {
                    self?.presenter?.failToGetImages(error: ERROR_MSG)
                }
            } else {
                self?.presenter?.failToGetImages(error: ERROR_MSG)
            }
        }.cURLDescription { curl in
            print(curl)
        }
    }
    
    
}
