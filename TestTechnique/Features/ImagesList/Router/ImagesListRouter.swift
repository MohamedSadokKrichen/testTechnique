//
//  ImagesListRouter.swift
//  TestTechnique
//
//  Created by Mohamed Sadok  Krichen on 19/3/2022.
//

import UIKit

class ImagesListRouter: PresenterToRouterImagesListProtocol {
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"ImagesList",bundle: nil)
    }
    
    static func createModule() -> ImagesListViewController {
        let view = mainstoryboard.instantiateViewController(withIdentifier: "ImagesListViewController") as! ImagesListViewController
        
        let presenter: ViewToPresenterImagesListProtocol & InteractorToPresenterProtocol = ImagesListPresenter()
        let interactor: PresenterToInteractorImagesListProtocol = ImagesListInteractor()
        let router:PresenterToRouterImagesListProtocol = ImagesListRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
    
    
}
