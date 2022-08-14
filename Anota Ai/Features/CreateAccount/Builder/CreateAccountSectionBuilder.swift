//
//  CreateAccountSectionBuilder.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 13/08/22.
//

import Foundation
import CollectionDS_SDK

class CreateAccountSectionBuilder: BuilderSectionProtocol {
    
    enum CreateAccountTextFields: CaseIterable {
        case name
        case lastName
        case email
        case password
    }
    
    // MARK: - Private properties
    
    private var fields = Fields()
    private var onButtonStateIsEnable: ((Bool) -> Void)?
    private var nameAndLastName: [CreateAccountTextFields] {
        [.name, .lastName]
    }
    private var emailAndPassword: [CreateAccountTextFields] {
        [.email, .password]
    }
    
    // MARK: - Init
    
    init(onButtonStateIsEnable: ((Bool) -> Void)?) {
        self.onButtonStateIsEnable = onButtonStateIsEnable
    }
    
    // MARK: - Builder
    
    func builder() -> [CollectionSectionProtocol] {
        [addressCardCellSection(), nameAndLastNameCellSection(), emailAndPasswordCellSection()]
    }
}

// MARK: - Sections

extension CreateAccountSectionBuilder {
    
    private func addressCardCellSection() -> CollectionSectionProtocol {
        return CollectionSection<AddressCardCell>(items: [AddressCardCellViewModel()])
    }
    
    private func nameAndLastNameCellSection() -> CollectionSectionProtocol {
        let viewModels = nameAndLastName.map { kind in
            TextFieldCellViewModel(title: kind.title, type: kind.kind, onChangeText: { text in
                self.updateTextFields(kind: kind, text: text)
            })
        }
        
        return CollectionSection<TextFieldCell>(items: viewModels, interItemGap: 0, columns: 2)
    }
    
    private func emailAndPasswordCellSection() -> CollectionSectionProtocol {
        let viewModels = emailAndPassword.map { kind in
            TextFieldCellViewModel(title: kind.title, type: kind.kind, onChangeText: { text in
                self.updateTextFields(kind: kind, text: text)
            })
        }
        
        return CollectionSection<TextFieldCell>(items: viewModels, lineGap: 16, columns: 1)
    }
}

// MARK: - Updates

extension CreateAccountSectionBuilder {
    
    private func updateTextFields(kind: CreateAccountTextFields, text: String?) {
        switch kind {
        case .name: didUpdateName(text)
        case .lastName: didUpdateLastName(text)
        case .email: didUpdateEmail(text)
        case .password: didUpdatePassword(text)
        }
    }
    
    private func didUpdateName(_ text: String?) {
        fields.name = text
        validator()
    }
    
    private func didUpdateLastName(_ text: String?) {
        fields.lastName = text
        validator()
    }
    
    private func didUpdateEmail(_ text: String?) {
        fields.email = text
        validator()
    }
    
    private func didUpdatePassword(_ text: String?) {
        fields.password = text
        validator()
    }
    
    // MARK: - Validator
    
    func validator() {
        guard let name = fields.name, let lastName = fields.lastName,
              let email = fields.email, let password = fields.password
        else {
            onButtonStateIsEnable?(false)
            return
        }
        
        if !name.isEmpty && !lastName.isEmpty && !email.isEmpty && !password.isEmpty {
            onButtonStateIsEnable?(true)
            return
        }
        onButtonStateIsEnable?(false)
    }
}

// MARK: - CreateAccountTextFields

extension CreateAccountSectionBuilder.CreateAccountTextFields {
    
    var title: String? {
        switch self {
        case .name: return "Nome"
        case .lastName: return "Sobrenome"
        case .email: return "Email"
        case .password: return "Senha"
        }
    }
    
    var kind: UIKeyboardType {
        switch self {
        case .name: return .default
        case .lastName: return .default
        case .email: return .emailAddress
        case .password: return .default
        }
    }
}
