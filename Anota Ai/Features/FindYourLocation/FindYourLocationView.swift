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
    func requestLocationAuthorization(delegate: CLLocationManagerDelegate?)
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
        viewModel.requestLocationAuthorization(delegate: self)
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
            $0.bottom.equalTo(snp.bottomMargin)
            $0.height.equalTo(48)
        }
    }
    
    private func viewHierarchy() {
        addSubview(mapView)
        addSubview(confirmYourLocationButton)
    }
}

// MARK: - CLLocationManagerDelegate

extension FindYourLocationView: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let coordinate: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        updateMapView(coordinate)
    }
}

