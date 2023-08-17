import UIKit

protocol VIPERViewControllerProtocol: UIViewController {
    func showLoading()
    func hideLoading()
    func show(something: Something)
    func show(error: Error)
}

final class VIPERViewController: UIViewController {
    private let presenter: VIPERPresenterInputProtocol

    init(presenter: VIPERPresenterInputProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) { nil }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.setup()
    }
}

extension VIPERViewController: VIPERViewControllerProtocol {
    func showLoading() {
        
    }
    
    func hideLoading() {
        
    }
    
    func show(something: Something) {
        
    }
    
    func show(error: Error) {
        
    }
}

