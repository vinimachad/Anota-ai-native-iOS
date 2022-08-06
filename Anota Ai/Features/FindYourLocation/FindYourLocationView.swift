//
//  FindYourLocationView.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 05/08/22.
//

import Foundation

import UIKit
import SnapKit
import MapKit
import CoreLocation

protocol FindYourLocationViewModelProtocol {
    var onUpdateUserCurrentLocation: ((CLLocationCoordinate2D) -> Void)? { get set }
    func requestLocationAuthorization()
}

class FindYourLocationView: UIView {
    
    // MARK: - UI Components
    
    private lazy var mapView = MKMapView()
    private lazy var confirmYourLocationButton = Button()
    
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
        
        self.viewModel?.onUpdateUserCurrentLocation = { [weak self] coordinate in
            self?.updateMapView(coordinate)
        }
        
        viewModel.requestLocationAuthorization()
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
        confirmYourLocationButton.titleColor = .Shapes.shape
        confirmYourLocationButton.backgroundColor = .Brand.primary
    }
    
    private func updateMapView(_ coordinate: CLLocationCoordinate2D) {
        mapView.setRegion(
            MKCoordinateRegion(center: coordinate, latitudinalMeters: CLLocationDistance(400), longitudinalMeters: CLLocationDistance(400)),
            animated: true
        )
        let marker = MKPointAnnotation()
        marker.coordinate = coordinate
        mapView.addAnnotation(marker)
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
