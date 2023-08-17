import UIKit

private typealias VIPERPresenterProtocol = VIPERPresenterSetupProtocol & VIPERPresenterInputProtocol & VIPERPresenterOutputProtocol

private typealias VIPERInteractorProtocol = VIPERInteractorSetupProtocol & VIPERInteractorInputProtocol

enum VIPERFactory {
    static func make() -> UIViewController {
        let service: ServiceProtocol = Service()
        let interactor: VIPERInteractorProtocol = VIPERInteractor(service: service)
        let presenter: VIPERPresenterProtocol = VIPERPresenter(interactor: interactor)
        let viewController: VIPERViewControllerProtocol = VIPERViewController(presenter: presenter)
        
        interactor.set(presenter: presenter)
        presenter.set(viewController: viewController)
        
        return viewController
    }
}
