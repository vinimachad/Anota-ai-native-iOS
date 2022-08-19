//
//  ConfirmLocationView.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 12/08/22.
//

import Foundation
import UIKit
import SnapKit
import MapKit

protocol ConfirmLocationViewModelProtocol {
    var region: MKCoordinateRegion { get }
    var streetDetails: String { get }
    var city: String { get }
    var streetNumber: String { get }
    
    var onUpdateNumber: ((String) -> Void)? { get set }
    var onChangeLocationDetails: (() -> Void)? { get set }
    var onButtonStateIsEnable: ((Bool) -> Void)? { get set }
    
    func didChangeNumber(text: String?)
    func didChangeComplement(text: String?)
    func didSaveAddress()
}

class ConfirmLocationView: UIView {
    
    // MARK: - UI Components
    
    private lazy var mapView = MapView()
    private lazy var streetDetailsLabel = UILabel()
    private lazy var cityDetailLabel = UILabel()
    private lazy var numberTextField = TextField()
    private lazy var complementTextField = TextField()
    private lazy var textFieldContainerStackView = UIStackView()
    private lazy var saveAddressButton = Button()
    
    // MARK: - Private properties
    
    private var viewModel: ConfirmLocationViewModelProtocol?
    
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
    
    func bindIn(viewModel: ConfirmLocationViewModelProtocol) {
        self.viewModel = viewModel
        
        updateMapView(region: viewModel.region)
        
        self.viewModel?.onButtonStateIsEnable = { [weak self] isEnable in
            self?.saveAddressButton.isEnabled = isEnable
        }
        
        self.viewModel?.onUpdateNumber = { [weak self] streetDetails in
            self?.streetDetailsLabel.text = streetDetails
        }
        
        DispatchQueue.main.async { [weak self] in
            
            self?.viewModel?.onChangeLocationDetails = { [weak self] in
                self?.streetDetailsLabel.text = viewModel.streetDetails
                self?.cityDetailLabel.text = viewModel.city
                
                if !viewModel.streetNumber.isEmpty {
                    self?.numberTextField.text = viewModel.streetNumber
                    self?.saveAddressButton.isEnabled = true
                }
            }
        }
    }
}

// MARK: - Setup view

extension ConfirmLocationView {
    
    private func setup() {
        setupConstraints()
        setupMapView()
        setupStreetDetailsLabel()
        setupCityDetailLabel()
        setupTextFields()
        setupTextFieldsContainerStackView()
        setupSaveAddressButton()
        backgroundColor = .Shapes.shape
    }
    
    private func setupMapView() {
        mapView.layer.cornerRadius = 8
        mapView.isUserInteractionEnabled = false
    }
    
    private func setupStreetDetailsLabel() {
        streetDetailsLabel.font = .default(type: .regular, ofSize: 16)
        streetDetailsLabel.textColor = .Texts.heading
        streetDetailsLabel.numberOfLines = 0
    }
    
    private func setupCityDetailLabel() {
        cityDetailLabel.font = .default(type: .regular, ofSize: 14)
        cityDetailLabel.textColor = .Texts.body
        cityDetailLabel.numberOfLines = 0
    }
    
    private func updateMapView(region: MKCoordinateRegion) {
        let marker = MKPointAnnotation()
        mapView.setRegion(region, animated: true)
        marker.coordinate = region.center
        mapView.addAnnotation(marker)
    }
    
    private func setupTextFieldsContainerStackView() {
        textFieldContainerStackView.alignment = .fill
        textFieldContainerStackView.distribution = .fill
        textFieldContainerStackView.axis = .horizontal
        textFieldContainerStackView.spacing = 16
    }
    
    private func setupTextFields() {
        numberTextField.setTitle("Número")
        complementTextField.setTitle("Complemento")
        numberTextField.addTarget(self, action: #selector(didChangeNumber), for: .editingChanged)
        complementTextField.addTarget(self, action: #selector(didChangeComplement), for: .editingChanged)
    }
    
    private func setupSaveAddressButton() {
        saveAddressButton.kind = .primary
        saveAddressButton.title = "Salvar endereço"
        saveAddressButton.addTarget(self, action: #selector(didTapSaveAddress), for: .touchDown)
    }
    
    @objc private func didChangeNumber() {
        viewModel?.didChangeNumber(text: numberTextField.text)
    }
    
    @objc private func didChangeComplement() {
        viewModel?.didChangeComplement(text: complementTextField.text)
    }
    
    @objc private func didTapSaveAddress() {
        viewModel?.didSaveAddress()
    }
}

// MARK: - Setup constraints

extension ConfirmLocationView {
    
    private func setupConstraints() {
        viewHierarchy()
        
        mapView.snp.makeConstraints {
            $0.left.equalTo(snp.left).offset(16)
            $0.right.equalTo(snp.right).offset(-16)
            $0.top.equalTo(snp.topMargin).offset(24)
            $0.height.equalTo(150)
        }
        
        streetDetailsLabel.snp.makeConstraints {
            $0.top.equalTo(mapView.snp.bottom).offset(24)
            $0.left.equalTo(snp.left).offset(16)
            $0.right.equalTo(snp.right).offset(-16)
        }
        
        cityDetailLabel.snp.makeConstraints {
            $0.top.equalTo(streetDetailsLabel.snp.bottom).offset(4)
            $0.left.equalTo(snp.left).offset(16)
            $0.right.equalTo(snp.right).offset(-16)
        }
        
        textFieldContainerStackView.snp.makeConstraints {
            $0.top.equalTo(cityDetailLabel.snp.bottom).offset(24)
            $0.left.equalTo(snp.left).offset(16)
            $0.right.equalTo(snp.right).offset(-16)
        }
        
        numberTextField.snp.makeConstraints {
            $0.height.equalTo(48)
            $0.width.lessThanOrEqualTo(74)
        }
        
        complementTextField.snp.makeConstraints {
            $0.height.equalTo(48)
        }
        
        saveAddressButton.snp.makeConstraints {
            $0.left.equalTo(snp.left).offset(16)
            $0.right.equalTo(snp.right).offset(-16)
            $0.bottom.equalTo(snp.bottomMargin)
            $0.height.equalTo(48)
        }
    }
    
    private func viewHierarchy() {
        addSubview(mapView)
        addSubview(streetDetailsLabel)
        addSubview(cityDetailLabel)
        addSubview(textFieldContainerStackView)
        textFieldContainerStackView.addArrangedSubview(numberTextField)
        textFieldContainerStackView.addArrangedSubview(complementTextField)
        addSubview(saveAddressButton)
    }
}

