//
//  CoordinatorProtocol.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 03/08/22.
//

import Foundation
import UIKit

protocol CoordinatorProtocol {
    var childCoordinator: CoordinatorProtocol? { get set }
    var containerViewController: UIViewController { get }
    func start() -> UIViewController
}
