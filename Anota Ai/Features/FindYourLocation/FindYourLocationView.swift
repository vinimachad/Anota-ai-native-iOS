//
//  FindYourLocationView.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 05/08/22.
//

import Foundation

import UIKit
import SnapKit
import CoreLocation

protocol FindYourLocationViewModelProtocol {
    var mapViewModel: MapViewModelProtocol { get }
    var onUpdateUserCurrentLocation: ((CLLocationCoordinate2D) -> Void)? { get set }
    var onEnableConfirmLocateButton: (() -> Void)? { get set }
    func didConfirmLocation()
}

class FindYourLocationView: UIView {
    
    // MARK: - UI Components
    
    private lazy var mapView = MapView()
    private lazy var confirmYourLocationButton = ButtonKit()
    
    // MARK: - Private properties
    
    private var viewModel: FindYourLocationViewModelProtocol?
    
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
    
    func bindIn(viewModel: FindYourLocationViewModelProtocol) {
        self.viewModel = viewModel
        
        self.mapView.bindIn(viewModel: viewModel.mapViewModel)
        
        self.viewModel?.onUpdateUserCurrentLocation = { [weak self] coordinate in
            self?.mapView.updateMapView(coordinate)
        }
        
        self.viewModel?.onEnableConfirmLocateButton = { [weak self] in
            self?.confirmYourLocationButton.isEnabled = true
        }
    }
}

// MARK: - Setup view

extension FindYourLocationView {
    
    private func setup() {
        setupConstraints()
        setupConfirmYourLocationButton()
    }
    
    private func setupConfirmYourLocationButton() {
        confirmYourLocationButton.title = "confirm_location_title_button".localize(.findYourLocation)
        confirmYourLocationButton.kind = .confirm
        confirmYourLocationButton.addTarget(self, action: #selector(didConfirmLocation), for: .touchDown)
        confirmYourLocationButton.isEnabled = false
    }
    
    @objc private func didConfirmLocation() {
        viewModel?.didConfirmLocation()
    }
}

// MARK: - Setup constraints

extension FindYourLocationView {
    
    private func setupConstraints() {
        viewHierarchy()
        
        mapView.snp.makeConstraints {
            $0.edges.equalTo(0)
        }
        
        confirmYourLocationButton.snp.makeConstraints {
            $0.left.equalTo(snp.left).offset(16)
            $0.right.equalTo(snp.right).offset(-16)
            $0.bottom.equalTo(snp.bottomMargin).offset(-34)
            $0.height.equalTo(48)
        }
    }
    
    private func viewHierarchy() {
        addSubview(mapView)
        addSubview(confirmYourLocationButton)
    }
}
