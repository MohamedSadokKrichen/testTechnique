import Foundation
import UIKit

protocol ViewToPresenterImagesListProtocol: AnyObject {
    var view : PresenterToViewImagesListProtocol? {get set}
    var interactor: PresenterToInteractorImagesListProtocol? {get set}
    var router: PresenterToRouterImagesListProtocol? {get set}
    func searchForImage(with keyword: String, pageIndex: Int)
}

protocol PresenterToViewImagesListProtocol: AnyObject {
    func showImagesList(images: ImagesEntity)
    func showError(error: String)
}

protocol PresenterToInteractorImagesListProtocol: AnyObject {
    var presenter: InteractorToPresenterProtocol? {get set}
    func fetchList(with keyword: String, pageIndex: Int)
}

protocol InteractorToPresenterProtocol: AnyObject {
    func getImagesList(images: ImagesEntity)
    func failToGetImages(error: String)
}
protocol PresenterToRouterImagesListProtocol: AnyObject {
    static func createModule()-> ImagesListViewController
}
