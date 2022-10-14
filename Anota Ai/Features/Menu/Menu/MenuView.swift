//
//  MenuView.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 27/09/22.
//

import SwiftUI

struct MenuView: View {
    
    @StateObject var viewModel: MenuViewModel
    
    init(viewModel: MenuViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        
        
        VStack {
            switch viewModel.menuState {
            case .success(let foods): successView(foods: foods)
            case .loading: loadingView()
            default: EmptyView()
            }
        }.onAppear {
            viewModel.getMenuRequest()
        }
    }
    
    func successView(foods: [Food]) -> some View {
        ScrollView {
            
            VStack(alignment: .leading) {
                TextField("User name (email address)",text: $viewModel.searchFood)
                    .frame(height: 48)
                    .background(Color.Shapes.box)
                
                LazyVGrid(columns: [GridItem()], alignment: .leading, spacing: 16) {
                    
                    ForEach(foods) { food in
                        VStack(alignment: .leading) {
                            Text(food.name)
                            Text(food.description)
                        }
                    }
                }
            }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    
    static var previews: some View {
        let viewModel = MenuViewModel(
            getMenuUseCase: GetMenuUseCaseMock(),
            restaurant: Restaurant.sampleData[0]
        )
        viewModel.menuState = .success([])
        
        return MenuView(viewModel: viewModel)
    }
}
