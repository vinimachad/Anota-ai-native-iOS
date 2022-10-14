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
                    
                    LazyVGrid(columns: [GridItem()], alignment: .leading, spacing: 16) {
                        
                        ForEach(foods) { food in
                            HStack(alignment: .center, spacing: 4) {
                                VStack(alignment: .leading) {
                                    Text(food.name)
                                        .bodyFont(color: .Texts.heading, weight: .bold)
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
                }
                .padding()
            }
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
