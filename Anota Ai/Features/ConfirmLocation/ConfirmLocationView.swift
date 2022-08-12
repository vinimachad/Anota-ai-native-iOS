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
    var street: String { get }
    var city: String { get }
}

class ConfirmLocationView: UIView {
    
    // MARK: - UI Components
    
    private lazy var mapView = MKMapView()
    private lazy var streetDetailsLabel = UILabel()
    private lazy var cityDetailLabel = UILabel()
    
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
        streetDetailsLabel.text = viewModel.street
        cityDetailLabel.text = viewModel.city
    }
}

// MARK: - Setup view

extension ConfirmLocationView {
    
    private func setup() {
        setupConstraints()
        setupMapView()
        setupStreetDetailsLabel()
        setupCityDetailLabel()
        backgroundColor = .Shapes.box
    }
    
    private func setupMapView() {
        mapView.layer.cornerRadius = 8
        mapView.setCameraZoomRange(
            MKMapView.CameraZoomRange(minCenterCoordinateDistance: 100, maxCenterCoordinateDistance: 100),
            animated: true
        )
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
            $0.bottom.lessThanOrEqualTo(snp.bottomMargin)
        }
    }
    
    private func viewHierarchy() {
        addSubview(mapView)
        addSubview(streetDetailsLabel)
        addSubview(cityDetailLabel)
    }
}

