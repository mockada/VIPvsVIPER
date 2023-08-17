protocol VIPPresenterProtocol: AnyObject {
    func set(viewController: VIPViewControllerProtocol)
    func presentLoading()
    func hideLoading()
    func present(something: Something)
    func present(error: Error)
}

final class VIPPresenter {
    private weak var viewController: VIPViewControllerProtocol?
}

extension VIPPresenter: VIPPresenterProtocol {
    func set(viewController: VIPViewControllerProtocol) {
        self.viewController = viewController
    }
    
    func presentLoading() {
        viewController?.showLoading()
    }
    
    func hideLoading() {
        viewController?.hideLoading()
    }
    
    func present(something: Something) {
        viewController?.show(something: something)
    }
    
    func present(error: Error) {
        viewController?.show(error: error)
    }
}
