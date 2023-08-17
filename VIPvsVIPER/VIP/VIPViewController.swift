import UIKit

protocol VIPViewControllerProtocol: UIViewController {
    func showLoading()
    func hideLoading()
    func show(something: Something)
    func show(error: Error)
}

final class VIPViewController: UIViewController {
    private let interactor: VIPInteractorProtocol
    
    init(interactor: VIPInteractorProtocol) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { nil }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor.load()
    }
}

extension VIPViewController: VIPViewControllerProtocol {
    func showLoading() {
        
    }
    
    func hideLoading() {
        
    }
    
    func show(something: Something) {
        
    }
    
    func show(error: Error) {
        
    }
}
