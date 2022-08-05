//
//  Explanations.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 04/08/22.
//

import Foundation
import UIKit

enum Explanations: CaseIterable {
    // TODO: - Criar localizable para strings
    case control
    case calculating
    case test
    
    var title: String? {
        switch self {
        case .control: return "É você \nquem comanda"
        case .calculating: return "Não perca tempo dividindo as contas"
        case .test: return "Lorem Ipsum is simply dummy text of the"
        }
    }
    
    var body: String? {
        switch self {
        case .control: return "Você controla todos seus pedidos e também consegue verificar os pedidos da sua mesa."
        case .calculating: return "A gente divide o que e quais itens você irá pagar, não tenha mais estresse no caixa."
        case .test: return "and typesetting industry. Lorem Ipsum has beenand typesetting industry. Lorem Ipsum has been."
        }
    }
    
    var cover: UIImage? {
        switch self {
        case .control: return UIImage.Images.mobilePosts
        case .calculating: return UIImage.Images.mobileCalculator
        case .test: return UIImage.Images.mobileLogin
        }
    }
}
