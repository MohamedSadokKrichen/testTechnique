import Foundation
import UIKit

class ImagesListPresenter: ViewToPresenterImagesListProtocol {
    
    var view: PresenterToViewImagesListProtocol?
    var interactor: PresenterToInteractorImagesListProtocol?
    var router: PresenterToRouterImagesListProtocol?
    func searchForImage(with keyword: String, pageIndex: Int) {
        interactor?.fetchList(with: keyword, pageIndex: pageIndex)
    }
    
    
}

extension ImagesListPresenter: InteractorToPresenterProtocol {
    func getImagesList(images: ImagesEntity) {
        view?.showImagesList(images: images)
    }
    
    func failToGetImages(error: String) {
        view?.showError(error: error)
    }
    
    
}
