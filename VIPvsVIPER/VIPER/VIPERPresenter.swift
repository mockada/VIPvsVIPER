import ObjectiveC

protocol VIPERPresenterSetupProtocol: AnyObject {
    func set(viewController: VIPERViewControllerProtocol)
}

protocol VIPERPresenterInputProtocol: AnyObject {
    func setup()
}

protocol VIPERPresenterOutputProtocol: AnyObject {
    func hideLoading()
    func present(something: Something)
    func present(error: Error)
}

final class VIPERPresenter: NSObject {
    private let interactor: VIPERInteractorInputProtocol
    private weak var viewController: VIPERViewControllerProtocol?

    init(interactor: VIPERInteractorInputProtocol) {
        self.interactor = interactor
    }
}

extension VIPERPresenter: VIPERPresenterSetupProtocol {
    func set(viewController: VIPERViewControllerProtocol) {
        self.viewController = viewController
    }
}

extension VIPERPresenter: VIPERPresenterInputProtocol {
    func setup() {
        viewController?.showLoading()
        interactor.load()
    }
}

extension VIPERPresenter: VIPERPresenterOutputProtocol {
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
