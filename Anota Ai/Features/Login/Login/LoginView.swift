//
//  LoginView.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 19/08/22.
//

import Foundation

import UIKit
import SnapKit

protocol LoginViewModelProtocol {
    func didLogin()
    func didChangePassword(_ text: String?)
    func didChangeEmail(_ text: String?)
}

class LoginView: UIView {
    
    // MARK: - UI Components
    
    private lazy var coverImageView = UIImageView()
    private lazy var emailTextField = TextField()
    private lazy var passwordTextField = TextField()
    private lazy var loginButton = Button()
    private lazy var containerTextFields = UIView()
    
    // MARK: - Private properties
    
    private var viewModel: LoginViewModelProtocol?
    
    // MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Bind
    
    func bindIn(viewModel: LoginViewModelProtocol) {
        self.viewModel = viewModel
    }
}

// MARK: - Setup view

extension LoginView {
    
    private func setup() {
        setupConstraints()
        setupCoverImageView()
        setupEmailTextField()
        setupPasswordTextField()
        setupLoginButton()
    }
    
    private func setupCoverImageView() {
        coverImageView.image = .Images.mobileLogin
        coverImageView.contentMode = .scaleAspectFit
    }
    
    private func setupEmailTextField() {
        emailTextField.setTitle("email_title".localize(.login))
        emailTextField.addTarget(self, action: #selector(didChangeEmail), for: .editingChanged)
    }
    
    private func setupPasswordTextField() {
        passwordTextField.setTitle("password_title".localize(.login))
        passwordTextField.addTarget(self, action: #selector(didChangePassword), for: .editingChanged)
    }
    
    private func setupLoginButton() {
        loginButton.title = "login_title_button".localize(.login)
        loginButton.backgroundColor = .Brand.secondary
        loginButton.titleColor = .Shapes.shape
        loginButton.addTarget(self, action: #selector(didLogin), for: .touchUpInside)
    }
    
    @objc private func didChangeEmail() {
        viewModel?.didChangeEmail(emailTextField.text)
    }
    
    @objc private func didChangePassword() {
        viewModel?.didChangePassword(passwordTextField.text)
    }
    
    @objc private func didLogin() {
        viewModel?.didLogin()
    }
}

// MARK: - Setup constraints

extension LoginView {
    
    private func setupConstraints() {
        viewHierarchy()
        
        coverImageView.snp.makeConstraints {
            $0.left.equalTo(16)
            $0.right.equalTo(-16)
            $0.top.equalTo(snp.topMargin)
            $0.height.equalTo(259)
        }
        
        containerTextFields.snp.makeConstraints {
            $0.top.equalTo(coverImageView.snp.bottom)
            $0.left.equalTo(16)
            $0.right.equalTo(-16)
        }
        
        emailTextField.snp.makeConstraints {
            $0.left.equalTo(containerTextFields.snp.left)
            $0.right.equalTo(containerTextFields.snp.right)
            $0.centerY.equalTo(containerTextFields.snp.centerY).offset(-(48-24))
            $0.height.equalTo(48)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.left.equalTo(containerTextFields.snp.left)
            $0.right.equalTo(containerTextFields.snp.right)
            $0.top.equalTo(emailTextField.snp.bottom).offset(24)
            $0.height.equalTo(48)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(containerTextFields.snp.bottom)
            $0.left.equalTo(16)
            $0.right.equalTo(-16)
            $0.bottom.equalTo(snp.bottomMargin)
            $0.height.equalTo(48)
        }
    }
    
    private func viewHierarchy() {
        addSubview(coverImageView)
        addSubview(containerTextFields)
        containerTextFields.addSubview(emailTextField)
        containerTextFields.addSubview(passwordTextField)
        addSubview(loginButton)
    }
}

