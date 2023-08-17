protocol VIInteractorProtocol: AnyObject {
    func set(viewController: VIViewControllerProtocol)
    func load()
}

final class VIInteractor {
    private weak var viewController: VIViewControllerProtocol?
    private let service: ServiceProtocol
    private let presenter: VIPresenterProtocol
    
    init(service: ServiceProtocol, presenter: VIPresenterProtocol) {
        self.service = service
        self.presenter = presenter
    }
}

extension VIInteractor: VIInteractorProtocol {
    func set(viewController: VIViewControllerProtocol) {
        self.viewController = viewController
    }
    
    func load() {
        viewController?.showLoading()
        
        service.fetch { [viewController] result in
            viewController?.hideLoading()
            
            switch result {
            case .success(let something):
                viewController?.show(something: something)
                
            case .failure(let error):
                viewController?.show(error: error)
            }
        }
    }
}
