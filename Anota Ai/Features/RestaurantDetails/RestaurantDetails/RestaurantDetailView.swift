//
//  RestaurantDetailView.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 27/09/22.
//

import SwiftUI

struct RestaurantDetailView: View {
    
    // MARK: - Public properties
    
    var restaurant: Restaurant
    
    // MARK: - Body
    
    var body: some View {
        
        GeometryReader { _ in
            Color.Shapes.shape
                .ignoresSafeArea(.all)
            
            ScrollView(.vertical) {
                VStack(alignment: .leading, spacing: 36) {
                    VStack(alignment: .leading, spacing: 16) {
                        VStack(alignment: .leading, spacing: 0) {
                            HStack(alignment: .center) {
                                Text(restaurant.name)
                                    .headerTitle()
                                Spacer()
                                AsyncImage(url: URL(string: restaurant.avatarUrl)) { result in
                                    switch result {
                                    case .success(let image): image.circleImage(width: 50, height: 50)
                                    default:
                                        Image(systemName: "photo.circle.fill")
                                            .circleImage(width: 50, height: 50)
                                            .foregroundColor(.gray)
                                    }
                                    
                                }
                                
                            }
                            Text(restaurant.type)
                                .subHeaderFont(color: .Texts.body, weight: .regular)
                        }
                        Text("A melhor pizzaria de Campo Grande Lorem Ipsum is simply dummy text of the printing and typesetting industry.")
                            .bodyFont()
                    }
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Detalhes")
                            .subHeaderFont()
                        VStack {
                            VStack {
                                HStack {
                                    Text("Endereço")
                                        .bodyFont()
                                    Spacer()
                                    Text("R. Araras, 187, São Francisco")
                                        .bodyFont(color: .Texts.heading, weight: .bold)
                                }
                                Divider()
                            }
                            VStack {
                                HStack {
                                    Text("Preço")
                                        .bodyFont()
                                    Spacer()
                                    Text("Barato")
                                        .bodyFont(color: .Texts.heading, weight: .bold)
                                }
                                Divider()
                            }
                            VStack {
                                HStack {
                                    Text("Estacionamento")
                                        .bodyFont()
                                    Spacer()
                                    Text("Sim")
                                        .bodyFont(color: .Texts.heading, weight: .bold)
                                }
                                Divider()
                            }
                            VStack {
                                HStack {
                                    Text("Happy Hour")
                                        .bodyFont()
                                    Spacer()
                                    Text("Sim")
                                        .bodyFont(color: .Texts.heading, weight: .bold)
                                }
                                Divider()
                            }
//                            VStack {
//                                HStack {
//                                    Text("Espaço Kids")
//                                        .bodyFont(size: 12)
//                                    Spacer()
//                                    Text("Sim")
//                                        .headingFont(size: 12)
//                                }
//                                Divider()
//                            }
//                            VStack {
//                                HStack {
//                                    Text("Couvert")
//                                        .bodyFont(size: 12)
//                                    Spacer()
//                                    Text("Sim")
//                                        .headingFont(size: 12)
//                                }
//                                Divider()
//                            }
//                            VStack {
//                                HStack {
//                                    Text("Local coberto")
//                                        .bodyFont(size: 12)
//                                    Spacer()
//                                    Text("Sim")
//                                        .headingFont(size: 12)
//                                }
//                                Divider()
//                            }
                        }
                        
                    }
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Avaliações")
                            .subHeaderFont()
                        VStack(spacing: 16) {
                            HStack(alignment: .top) {
                                Text(String(restaurant.evaluation))
                                    .headerTitle()
                                Spacer()
                                VStack(alignment: .trailing, spacing: 1) {
                                    HStack {
                                        starsEvaluation(howMany: 5)
                                        ProgressView(value: 15, total: 100)
                                            .progressViewStyle(LinearProgressViewStyle(tint: .Shapes.secondary))
                                            .frame(maxWidth: 130)
                                    }
                                    HStack {
                                        starsEvaluation(howMany: 4)
                                        ProgressView(value: 5, total: 100)
                                            .progressViewStyle(LinearProgressViewStyle(tint: .Shapes.secondary))
                                            .frame(maxWidth: 130)
                                    }
                                    HStack {
                                        starsEvaluation(howMany: 3)
                                        ProgressView(value: 5, total: 100)
                                            .progressViewStyle(LinearProgressViewStyle(tint: .Shapes.secondary))
                                            .frame(maxWidth: 130)
                                    }
                                    HStack {
                                        starsEvaluation(howMany: 2)
                                        ProgressView(value: 5, total: 100)
                                            .progressViewStyle(LinearProgressViewStyle(tint: .Shapes.secondary))
                                            .frame(maxWidth: 130)
                                    }
                                    HStack {
                                        starsEvaluation(howMany: 1)
                                        ProgressView(value: 5, total: 100)
                                            .progressViewStyle(LinearProgressViewStyle(tint: .Shapes.secondary))
                                            .frame(maxWidth: 130)
                                    }
                                    Text("100 Avaliações")
                                        .bodyFont()
                                }
                            }
                            TabView {
                                ForEach(0..<3) { _ in
                                    VStack(alignment: .leading, spacing: 0) {
                                        Text("Musica boa e comida deliciosa")
                                            .subHeaderFont()
                                        HStack {
                                            starsEvaluation(howMany: 5)
                                            Spacer()
                                            Text("Vinicius")
                                                .bodyFont()
                                        }
                                        .padding(.bottom)
                                        Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the")
                                            .bodyFont()
                                    }
                                    .padding(16)
                                    .background(
                                        Color.Shapes.box
                                            .cornerRadius(4)
                                            .shadow(color: .Shapes.stroke, radius: 4, x: 4, y: 2)
                                    )
                                }.padding(.horizontal, 10)
                            }
                            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                            .frame(minHeight: 140, maxHeight: 160)
                        }
                    }
                }
                .padding(.horizontal, 16)
            }
        }
    }
    
    private func starsEvaluation(howMany: Int) -> some View {
        HStack(alignment: .center, spacing: 2) {
            ForEach(0..<howMany, id: \.self) { _ in
                Image(systemName: "star.fill")
                    .resizable()
                    .frame(width: 10, height: 10, alignment: .center)
                    .foregroundColor(.Others.yellow)
            }
        }
    }
}

struct RestaurantDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantDetailView(restaurant: Restaurant.sampleData[0])
    }
}
