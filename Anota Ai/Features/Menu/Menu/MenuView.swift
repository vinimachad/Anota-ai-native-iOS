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
                
                ScrollViewReader { proxy in
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHGrid(rows: [GridItem()], alignment: .bottom, spacing: 0) {
                            ForEach(viewModel.foodTypes, id: \.self) { type in
                                Button(action: {
                                    proxy.scrollTo(type)
                                    viewModel.selectedFood = type
                                }) {
                                    Text(type.capitalized)
                                        .foregroundColor(viewModel.foodIsSelected(type) ? .Brand.primary : Color(uiColor: .systemGray))
                                        .bodyFont(weight: .medium)
                                }
                                .id(type)
                                .padding(EdgeInsets(top: 16, leading: 20, bottom: 16, trailing: 20))
                                .background(
                                    viewModel.selectedFood == type ? segmentedLine(color: .Brand.primary, height: 2) : segmentedLine(color: Color(uiColor: .clear)),
                                    alignment: .bottomLeading
                               )
                            }
                        }
                    }.background(
                        segmentedLine(color: Color(uiColor: .systemGray3)),
                        alignment: .bottomLeading
                    )
                }
                .padding(.horizontal, -16)
                .frame(height: 60)
                
                ScrollView {
                    VStack(alignment: .leading) {
                        
                        LazyVGrid(columns: [GridItem()], alignment: .leading, spacing: 16) {
                            if viewModel.searchFood.count > 0 {
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
    
    private func segmentedLine(color: Color, height: CGFloat = 1) -> some View {
        Rectangle()
            .fill(color)
            .frame(height: height)
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
