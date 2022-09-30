//
//  MenuViewModel.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 30/09/22.
//

import Foundation

class MenuViewModel: ObservableObject {
    
    // MARK: Public properties
    
    // MARK: Private properties
    
    private var getMenuUseCase: any GetMenuUseCaseProtocol
    
    // MARK: Init
    
    init(getMenuUseCase: any GetMenuUseCaseProtocol) {
        self.getMenuUseCase = getMenuUseCase
    }
}

extension MenuViewModel {
    
    func getMenuRequest() {
        getMenuUseCase.execute(request: "")
    }
}
