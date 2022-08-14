//
//  CreateAccountSectionBuilder.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 13/08/22.
//

import Foundation
import CollectionDS_SDK

class CreateAccountSectionBuilder: BuilderSectionProtocol {
    
    // MARK: - Sections
    
    private func addressCardCellSection() -> CollectionSectionProtocol {
        return CollectionSection<AddressCardCell>(items: [AddressCardCellViewModel()])
    }
    
    private func nameAndLastNameCellSection() -> CollectionSectionProtocol {
        return CollectionSection<TextFieldCell>(items: [
            TextFieldCellViewModel(title: "Nome", onChangeText: nil), TextFieldCellViewModel(title: "Sobrenome", onChangeText: nil)
        ], interItemGap: 0, columns: 2
        )
    }
    
    private func emailAndPasswordCellSection() -> CollectionSectionProtocol {
        return CollectionSection<TextFieldCell>(items: [
            TextFieldCellViewModel(title: "Email", onChangeText: nil), TextFieldCellViewModel(title: "Senha", onChangeText: nil)
        ], lineGap: 16, columns: 1
        )
    }
    
    // MARK: - Builder
    
    func builder() -> [CollectionSectionProtocol] {
        [addressCardCellSection(), nameAndLastNameCellSection(), emailAndPasswordCellSection()]
    }
}
