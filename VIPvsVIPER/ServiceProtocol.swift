struct Something {
    
}

protocol ServiceProtocol {
    func fetch(completion: @escaping (Result<Something, Error>) -> Void)
}

final class Service {
    
}

extension Service: ServiceProtocol {
    func fetch(completion: @escaping (Result<Something, Error>) -> Void) {
        
    }
}
