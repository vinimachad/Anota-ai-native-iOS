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
        GeometryReader { _ in
            Color.Shapes.shape
                .ignoresSafeArea(.all)
            
            VStack {
                SwiftUITextField(text: $viewModel.searchFood, placeholder: "Busque pelo seu prato...")
                SegmentedControlView(items: $viewModel.foodTypes, selectedItem: $viewModel.selectedFood)
                ScrollView {
                    VStack(alignment: .leading) {
                        
                        LazyVGrid(columns: [GridItem()], alignment: .leading, spacing: 16) {
                            if viewModel.searchFood.count > 0 {
                                switch viewModel.searchFoodState {
                                case .success(let foods): listFoodCell(foods: foods)
                                default: EmptyView()
                                }
                            } else {
                                switch viewModel.menuState {
                                case .success(let sections): successViewWithSection(sections: sections)
                                case .loading: loadingView()
                                default: EmptyView()
                                }
                            }
                        }
                    }.padding()
                }
            }.padding(.vertical)
        }
        .onAppear { viewModel.getMenuRequest() }
    }
    
    func successViewWithSection(sections: [FoodSection]) -> some View {
        ForEach(sections) { section in
            Text(section.title.capitalized)
                .thirdHeaderFont()
                .padding(.top)
            Divider()
            listFoodCell(foods: section.foods)
        }
    }
    
    private func listFoodCell(foods: [Food]) -> some View {
        ForEach(foods) { food in
            FoodCell(food: food)
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    
    static var previews: some View {
        let viewModel = MenuViewModel(
            getMenuUseCase: GetMenuUseCaseMock(),
            restaurant: Restaurant.sampleData[0]
        )
        viewModel.menuState = .success([
            FoodSection(title: "Pizza", foods: [Food.sample])
        ])
        
        return MenuView(viewModel: viewModel)
    }
}
