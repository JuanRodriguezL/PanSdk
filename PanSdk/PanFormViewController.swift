import UIKit

public class PanFormViewController: UIViewController {

    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Formulario PAN"
        setupUI()
    }

    private func setupUI() {
        let padding: CGFloat = 20

        let cardView = UIView()
        cardView.backgroundColor = UIColor.systemGray6
        cardView.layer.cornerRadius = 12
        cardView.layer.shadowColor = UIColor.black.cgColor
        cardView.layer.shadowOpacity = 0.1
        cardView.layer.shadowOffset = CGSize(width: 0, height: 2)
        cardView.layer.shadowRadius = 4
        view.addSubview(cardView)

        cardView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            cardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            cardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            cardView.heightAnchor.constraint(equalToConstant: 220)
        ])

        // Número de tarjeta
        let cardNumberField = createTextField(placeholder: "Número de tarjeta (**** **** **** 1234)")
        let expiryField = createTextField(placeholder: "Fecha (MM/AA)")
        let cvvField = createTextField(placeholder: "CVV")
        let nameField = createTextField(placeholder: "Nombre completo")

        cvvField.isSecureTextEntry = true
        cardNumberField.keyboardType = .numberPad
        expiryField.keyboardType = .numberPad
        cvvField.keyboardType = .numberPad

        let stack = UIStackView(arrangedSubviews: [cardNumberField, expiryField, cvvField, nameField])
        stack.axis = .vertical
        stack.spacing = 12
        view.addSubview(stack)

        stack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: cardView.bottomAnchor, constant: 30),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
        ])

        let submitButton = UIButton(type: .system)
        submitButton.setTitle("Enviar", for: .normal)
        submitButton.backgroundColor = UIColor.systemBlue
        submitButton.setTitleColor(.white, for: .normal)
        submitButton.layer.cornerRadius = 10
        submitButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        submitButton.addTarget(self, action: #selector(handleSubmit), for: .touchUpInside)

        view.addSubview(submitButton)
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            submitButton.topAnchor.constraint(equalTo: stack.bottomAnchor, constant: 30),
            submitButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            submitButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
        ])
    }

    private func createTextField(placeholder: String) -> UITextField {
        let tf = UITextField()
        tf.placeholder = placeholder
        tf.borderStyle = .roundedRect
        tf.backgroundColor = .white
        tf.layer.borderColor = UIColor.systemGray3.cgColor
        tf.layer.borderWidth = 1
        tf.layer.cornerRadius = 8
        tf.heightAnchor.constraint(equalToConstant: 44).isActive = true
        return tf
    }

    @objc private func handleSubmit() {
        let alert = UIAlertController(title: "Enviado", message: "Formulario enviado correctamente", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cerrar", style: .default))
        present(alert, animated: true)
    }
}
