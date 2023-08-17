import UIKit

enum VIPFactory {
    static func make() -> UIViewController {
        let presenter: VIPPresenterProtocol = VIPPresenter()
        let service: ServiceProtocol = Service()
        let interactor: VIPInteractorProtocol = VIPInteractor(presenter: presenter, service: service)
        let viewController: VIPViewControllerProtocol = VIPViewController(interactor: interactor)
        
        presenter.set(viewController: viewController)
        
        return viewController
    }
}
