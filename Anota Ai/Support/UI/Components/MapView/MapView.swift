//
//  MapView.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 13/08/22.
//

import UIKit
import SnapKit
import MapKit

class MapView: MKMapView {
    
    // MARK: - UI Components
    
    // MARK: - Private properties
    
    // MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup view

extension MapView {
    
    private func setup() {
        setupConstraints()
        
        setCameraZoomRange(
            MKMapView.CameraZoomRange(
                minCenterCoordinateDistance: 100,
                maxCenterCoordinateDistance: 500
            ),animated: true
        )
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didAddNewMark))
        addGestureRecognizer(tapGesture)
    }
    
    func updateMapView(_ coordinate: CLLocationCoordinate2D) {
        setRegion(
            MKCoordinateRegion(center: coordinate, latitudinalMeters: 400, longitudinalMeters: 400),
            animated: true
        )
        let marker = MKPointAnnotation()
        marker.coordinate = coordinate
        addAnnotation(marker)
    }
    
    @objc private func didAddNewMark(gestureRecognizer: UITapGestureRecognizer) {
        let location = gestureRecognizer.location(in: self)
        let coordinate = convert(location, toCoordinateFrom: self)
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        if annotations.count == 1 {
            guard let lastAnnotation = annotations.last else { return }
            removeAnnotation(lastAnnotation)
        }
        addAnnotation(annotation)
    }
}

// MARK: - Setup constraints

extension MapView {
    
    private func setupConstraints() {
        viewHierarchy()
    }
    
    private func viewHierarchy() {
        
    }
}

