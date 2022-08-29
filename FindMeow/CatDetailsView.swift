//
//  CatDetailsView.swift
//  API trial dicoding
//
//  Created by Local Administrator on 13/08/22.
//

import SwiftUI

struct CatDetailsView: View {
    let cats: Cats
    var body: some View {
        ScrollView{
            AsyncImage(url: URL(string: "\(cats.image!.url)")) { phase in
                if let image = phase.image {
                    image.resizable()
                        .scaledToFill()
                        .frame(width: 350, height: 350, alignment: .leading)
                        .shadow(color: .gray, radius: 3)
                        .cornerRadius(10)
                } else {
                    ProgressView()
                        .frame(width: 350, height: 350)
                }
                
            }
            .padding(.horizontal)
            
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.accentColor)
                    .frame(width: 350, height:180)
                    .shadow(color: .gray, radius: 3)
                    .padding()
                
                VStack{
                    
                    VStack(alignment: .leading, spacing: 10){
                        Text(cats.name)
                            .font(.title3)
                            .bold()
                        Text("Origin: \(cats.origin)")
                            .font(.body)
                        Text("Character: \(cats.temperament ?? "Characteristics")")
                            .font(.callout)
                    }.foregroundColor(.white)
                        .padding(.horizontal)
                }
            }

                HStack{
                    
                    VStack{
                        
                        VStack(alignment: .leading){
                                Text("Adaptability")
                                .bold()
                                .padding(.bottom)
                                HStack{
                                    ForEach(1..<6) { id in
                                         Image(systemName: "star.fill")
                                            .foregroundColor(cats.adaptability > id ? Color.accentColor : Color.gray )
                                        
                                    }
                                }
                            
                                 
                        }
                        .padding(.bottom)
                        .padding(.trailing)
                        VStack(alignment: .leading){
                                Text("Energy level")
                                .bold()
                                .padding(.bottom)
                                HStack{
                                    ForEach(1..<6) { id in
                                         Image(systemName: "star.fill")
                                            .foregroundColor(cats.energy_level > id ? Color.accentColor : Color.gray )
                                        
                                    }
                                }
                            
                                 
                        }
                        .padding(.trailing)

                        
                    }
                    VStack{
                        VStack(alignment: .leading){
                                Text("Intelligence")
                                .bold()
                                .padding(.bottom)
                                HStack{
                                    ForEach(1..<6) { id in
                                         Image(systemName: "star.fill")
                                            .foregroundColor(cats.intelligence > id ? Color.accentColor : Color.gray )
                                        
                                    }
                                }
                            
                                 
                        }
                        .padding(.bottom)
                        .padding(.trailing)
                        VStack(alignment: .leading){
                                Text("Dog friendly")
                                .bold()
                                .padding(.bottom)
                                HStack{
                                    ForEach(1..<6) { id in
                                         Image(systemName: "star.fill")
                                            .foregroundColor(cats.dog_friendly > id ? Color.accentColor : Color.gray )
                                        
                                    }
                                }
                        }
                        .padding(.trailing)
                    }
                    
                }
                .padding(.bottom)
                VStack(alignment: .leading){
                    Text("Description")
                        .font(.title3)
                        .bold()
                        .padding(.bottom)
                    Text(cats.description)
                        .font(.body)
                    Spacer()
                    
                    
                }
                .padding(.vertical)
                .padding(.leading)
                .frame(width: 350)
            Link("See more", destination: URL(string: "\(cats.wikipedia_url ?? "https://en.wikipedia.org/wiki/Abyssinian_(cat)")")!)
            Spacer()
            
        }
        
        
    }
    
}
