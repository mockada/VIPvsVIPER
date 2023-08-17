import UIKit

enum VIFactory {
    static func make() -> UIViewController {
        let service: ServiceProtocol = Service()
        let presenter: VIPresenterProtocol = VIPresenter()
        let interactor: VIInteractorProtocol = VIInteractor(service: service, presenter: presenter)
        let viewController: VIViewControllerProtocol = VIViewController(interactor: interactor)
        
        interactor.set(viewController: viewController)
        
        return viewController
    }
}
