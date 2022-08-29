//
//  ContentView.swift
//  FindMeow
//
//  Created by Local Administrator on 11/08/22.
//


import SwiftUI


struct ContentView: View {
    
    @StateObject var viewModel = APIService()
    @State var searchText: String = ""
    var searchedCat: [Cats] {
        if searchText.count == 0 {
            return viewModel.cats
        } else {
            return viewModel.cats.filter {$0.name.lowercased().contains(searchText.lowercased())}
        }
    }
    
    var body: some View {
        
        
        NavigationView{
            List{
                ForEach(searchedCat) { cat in
                    NavigationLink{
                        CatDetailsView(cats: cat)
                    }label: {
                        HStack{
                            AsyncImage(url: URL(string: "\(cat.image!.url)")) { phase in
                                if let image = phase.image {
                                    image.resizable()
                                        .scaledToFill()
                                        .frame(width: 100, height: 100, alignment: .leading)
                                        .cornerRadius(10)

                                } else {
                                    ProgressView()
                                        .frame(width: 100, height: 100)

                                }
                                
                            }
                            .padding(.trailing)
                            
                            VStack(alignment: .leading){
                                
                                Text(cat.name)
                                    .font(.system(.title3))
                                    .bold()
                                    .foregroundColor(.accentColor)
                                Text("Origin: \(cat.origin)")
                                    .font(.system(.body))
                                
                            }
                        }
                        
                        
                    }
                    
                }
            }
            .searchable(text: $searchText)
            
            .navigationTitle("Cat List")
            .navigationBarItems( trailing: Button(action: {
                
            }, label: {
                NavigationLink {
                    ProfileView()
                } label: {
                    Image(systemName: "person.circle.fill")
                        .font(.system(size: 30))
                    
                }
                
                
            }))
            .onAppear{
                viewModel.fetch()
            }
        }
        
    }
    
}



