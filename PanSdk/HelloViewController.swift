import UIKit

public class HelloViewController: UIViewController {

    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        // Imagen del logo desde el SDK
        let bundle = Bundle(for: Self.self)
        if let image = UIImage(named: "milio", in: bundle, compatibleWith: nil) {
            let imageView = UIImageView(image: image)
            imageView.contentMode = .scaleAspectFit
            imageView.frame = CGRect(x: 80, y: 100, width: 200, height: 100)
            view.addSubview(imageView)
        }
        

        // Texto "Hola Mundo"
        let label = UILabel()
        label.text = "Hola Mundo"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        label.frame = CGRect(x: 0, y: 220, width: view.frame.width, height: 40)
        view.addSubview(label)

        // Botón
        let button = UIButton(type: .system)
        button.setTitle("Abrir Formulario PAN", for: .normal)
        button.frame = CGRect(x: 60, y: 280, width: view.frame.width - 120, height: 50)
        button.backgroundColor = UIColor.systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(openPanForm), for: .touchUpInside)
        view.addSubview(button)
    }

    @objc func openPanForm() {
        let formVC = PanFormViewController()
        let navVC = UINavigationController(rootViewController: formVC)
        navVC.modalPresentationStyle = .formSheet // o .fullScreen
        self.present(navVC, animated: true, completion: nil)
    }

}
