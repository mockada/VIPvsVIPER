protocol VIPInteractorProtocol {
    func load()
}

final class VIPInteractor {
    private let presenter: VIPPresenterProtocol
    private let service: ServiceProtocol
    
    init(presenter: VIPPresenterProtocol, service: ServiceProtocol) {
        self.presenter = presenter
        self.service = service
    }
}

extension VIPInteractor: VIPInteractorProtocol {
    func load() {
        presenter.presentLoading()
        
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
