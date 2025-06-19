import UIKit

public class PanSdk {
    public static func show(in viewController: UIViewController) {
        let vc = HelloViewController()
        viewController.present(vc, animated: true, completion: nil)
    }
}
