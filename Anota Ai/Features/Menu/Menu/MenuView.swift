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
            
            ScrollView {
                VStack(alignment: .leading) {
                    
                    TextField("Busque pelo seu prato", text: $viewModel.searchFood)
                    .padding()
                    .foregroundColor(.Texts.body)
                    .frame(height: 48)
                    .background(
                        Color(uiColor: .systemGray6)
                            .cornerRadius(8)
                    )
                    .padding(.bottom, 32)
                    .textInputAutocapitalization(.never)
                    
                    LazyVGrid(columns: [GridItem()], alignment: .leading, spacing: 16) {
                        if viewModel.searchFood.count > 3 {
                            switch viewModel.searchFoodState {
                            case .success(let foods): foodCell(foods: foods)
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
                }
                .padding()
            }
        }
        .onAppear { viewModel.getMenuRequest() }
    }
    
    func successViewWithSection(sections: [FoodSection]) -> some View {
        ForEach(sections) { section in
            Text(section.title.capitalized)
                .thirdHeaderFont()
                .padding(.top)
            Divider()
            foodCell(foods: section.foods)
        }
    }
    
    private func foodCell(foods: [Food]) -> some View {
        ForEach(foods) { food in
            HStack(alignment: .center, spacing: 4) {
                VStack(alignment: .leading) {
                    Text(food.name)
                        .bodyFont(color: .Texts.heading, weight: .medium)
                        .lineLimit(2)
                    Text(food.description)
                        .bodyFont()
                        .lineLimit(3)
                    Text("R$ \(food.price)")
                        .bodyFont(color: .Texts.heading, weight: .medium)
                        .padding(.top, 1)
                }
                Spacer()
                AsyncImage(url: URL(string: food.previewUrl)) { result in
                    resultOfImageState(result)
                }
            }
            Divider()
        }
    }
    
    private func resultOfImageState(_ result: AsyncImagePhase) -> some View {
        switch result {
        case .success(let image): return image
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 100)
                .cornerRadius(4)
        default:
            return Image(systemName: "photo")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 100)
                .cornerRadius(4)
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
