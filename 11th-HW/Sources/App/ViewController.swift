//
//  ViewController.swift
//  11th-HW
//
//  Created by Максим Солобоев on 01.09.2022.
//

import UIKit
import SnapKit

extension UITextField {
    func setLeftIcon (_ image: UIImage) {
        let iconView = UIImageView(frame: CGRect(x: 20, y: 5, width: 20, height: 20))
        iconView.image = image
        let iconContainerView: UIView = UIView(frame: CGRect(x: 20, y: 0, width: 10, height: 30))
        iconContainerView.addSubview(iconView)
        leftView = iconContainerView
        leftViewMode = .always
    }
}

class ViewController: UIViewController {

    // MARK: - Outlets
    
    private lazy var backgroundImageView: UIImageView = {
        let backgroundImage = UIImage(named: "background")
        let backGroundView = UIImageView(image: backgroundImage)
        backGroundView.translatesAutoresizingMaskIntoConstraints = false
        return backGroundView
    }()
    
    private lazy var loginLabel: UILabel = {
        let login = UILabel()
        login.text = "Login"
        login.textAlignment = .center
        login.font = UIFont.boldSystemFont(ofSize: 40)
        login.translatesAutoresizingMaskIntoConstraints = false
        return login
    }()
    
    private lazy var loginTextField: UITextField = {
        let loginField = UITextField()
        loginField.placeholder = "Login"
        loginField.backgroundColor = .white
        loginField.textAlignment = .center
        loginField.layer.cornerRadius = 25
        loginField.translatesAutoresizingMaskIntoConstraints = false
        guard let loginImage = UIImage(systemName: "person") else { return loginField }
        loginField.setLeftIcon(loginImage)
        return loginField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let passwordField = UITextField()
        passwordField.placeholder = "Password"
        passwordField.backgroundColor = .white
        passwordField.textAlignment = .center
        passwordField.layer.cornerRadius = 25
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        guard let passwordImage = UIImage(systemName: "lock") else { return passwordField }
        passwordField.setLeftIcon(passwordImage)
        return passwordField
    }()
    
    private lazy var autorizationStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupLayout()
    }

    // MARK: - Setup

    private func setupHierarchy() {
        view.addSubview(backgroundImageView)
        view.addSubview(loginLabel)
        view.addSubview(autorizationStack)
        autorizationStack.addArrangedSubview(loginTextField)
        autorizationStack.addArrangedSubview(passwordTextField)
    }
    
    private func setupLayout() {
        backgroundImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        loginLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(130)
        }
        
        loginTextField.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        
        autorizationStack.snp.makeConstraints { make in
            make.top.equalTo(loginLabel.snp.bottom).offset(40)
            make.leading.trailing.equalToSuperview().inset(60)
        }
    }
    
    // MARK: - Actions
}

