protocol VIPERInteractorSetupProtocol {
    func set(presenter: VIPERPresenterOutputProtocol)
}

protocol VIPERInteractorInputProtocol {
    func load()
}

final class VIPERInteractor {
    private var presenter: VIPERPresenterOutputProtocol?
    private let service: ServiceProtocol
    
    init(service: ServiceProtocol) {
        self.service = service
    }
}

extension VIPERInteractor: VIPERInteractorSetupProtocol {
    func set(presenter: VIPERPresenterOutputProtocol) {
        self.presenter = presenter
    }
}

extension VIPERInteractor: VIPERInteractorInputProtocol {
    func load() {
        service.fetch { [weak presenter] result in
            presenter?.hideLoading()
            
            switch result {
            case .success(let something):
                presenter?.present(something: something)
                
            case .failure(let error):
                presenter?.present(error: error)
            }
        }
    }
}
