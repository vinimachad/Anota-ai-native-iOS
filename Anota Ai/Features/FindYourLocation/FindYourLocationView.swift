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
    func didConfirmLocation()
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
    }
}

// MARK: - Setup view

extension FindYourLocationView {
    
    private func setup() {
        setupConstraints()
        setupConfirmYourLocationButton()
        setupMapView()
    }
    
    private func setupMapView() {
        mapView.setCameraZoomRange(
            MKMapView.CameraZoomRange(
                minCenterCoordinateDistance: 100,
                maxCenterCoordinateDistance: 500
            ),animated: true
        )
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didAddNewMark))
        mapView.addGestureRecognizer(tapGesture)
    }
    
    private func setupConfirmYourLocationButton() {
        confirmYourLocationButton.title = "confirm_location_title_button".localize(.findYourLocation)
        confirmYourLocationButton.kind = .confirm
        confirmYourLocationButton.addTarget(self, action: #selector(didConfirmLocation), for: .touchDown)
    }
    
    private func updateMapView(_ coordinate: CLLocationCoordinate2D) {
        mapView.setRegion(
            MKCoordinateRegion(center: coordinate, latitudinalMeters: 400, longitudinalMeters: 400),
            animated: true
        )
        let marker = MKPointAnnotation()
        marker.coordinate = coordinate
        mapView.addAnnotation(marker)
    }
    
    @objc private func didConfirmLocation() {
        viewModel?.didConfirmLocation()
    }
    
    @objc private func didAddNewMark(gestureRecognizer: UITapGestureRecognizer) {
        let location = gestureRecognizer.location(in: mapView)
        let coordinate = mapView.convert(location,toCoordinateFrom: mapView)
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        if mapView.annotations.count == 1 {
            guard let lastAnnotation = mapView.annotations.last else { return }
            mapView.removeAnnotation(lastAnnotation)
        }
        mapView.addAnnotation(annotation)
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

extension FindYourLocationView: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
        print(views)
    }
}
