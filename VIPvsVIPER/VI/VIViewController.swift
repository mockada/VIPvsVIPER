import UIKit

protocol VIViewControllerProtocol: UIViewController {
    func showLoading()
    func hideLoading()
    func show(something: Something)
    func show(error: Error)
}

final class VIViewController: UIViewController {
    private let interactor: VIInteractorProtocol
    
    init(interactor: VIInteractorProtocol) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { nil }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor.load()
    }
}

extension VIViewController: VIViewControllerProtocol {
    func showLoading() {
        
    }
    
    func hideLoading() {
        
    }
    
    func show(something: Something) {
        
    }
    
    func show(error: Error) {
        
    }
}
