//
//  TextFieldCell.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 13/08/22.
//

import Foundation

import UIKit
import Reusable
import CollectionDS_SDK
import SnapKit

protocol TextFieldCellViewModelProtocol: CollectionViewModelProtocol {
    var title: String? { get }
    var type: UIKeyboardType { get }
    var isSecureTextEntry: Bool { get }
    func didChangeText(text: String?)
}

class TextFieldCell: UICollectionViewCell, CollectionViewProtocol {
    
    // MARK: - UI Components
    
    private lazy var textField = TextField()
    
    // MARK: - Private properties
    
    private var viewModel: TextFieldCellViewModelProtocol?
    
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
    
    func bindIn(viewModel: TextFieldCellViewModelProtocol) {
        self.viewModel = viewModel
        textField.setTitle(viewModel.title ?? "")
        textField.keyboardType = viewModel.type
        textField.isSecureTextEntry = viewModel.isSecureTextEntry
        addHidePasswordIfNeeded()
    }
}

// MARK: - Setup view

extension TextFieldCell {
    
    private func setup() {
        setupConstraints()
        clipsToBounds = true
        textField.addTarget(self, action: #selector(didChangeTextValue), for: .editingChanged)
    }
    
    private func addHidePasswordIfNeeded() {
        guard let viewModel = viewModel else { return }
        if viewModel.isSecureTextEntry {
            textField.addSubview(<#T##view: UIView##UIView#>)
        }
    }
    
    @objc private func didChangeTextValue() {
        viewModel?.didChangeText(text: textField.text)
    }
}

// MARK: - Setup constraints

extension TextFieldCell {
    
    static func size(width: CGFloat) -> CGSize {
        let padding = sectionPadding()
        let width = width - (padding.left + padding.right)
        return CGSize(width: width, height: 48)
    }
    
    static func sectionPadding() -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 16, bottom: 24, right: 16)
    }
    
    private func setupConstraints() {
        viewHierarchy()
        
        textField.snp.makeConstraints {
            $0.edges.equalTo(contentView.snp.edges)
            $0.height.equalTo(48)
        }
    }
    
    private func viewHierarchy() {
        contentView.addSubview(textField)
    }
}

