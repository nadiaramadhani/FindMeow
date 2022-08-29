//
//  ProfileView.swift
//  API trial dicoding
//
//  Created by Local Administrator on 13/08/22.
//

import SwiftUI

struct ProfileView: View {
    var age: Int = 20
    var name: String = "Nadia Ramadhani"
    var body: some View {
        VStack{
            ZStack{
                Circle()
                    .foregroundColor(.accentColor)
                    .frame(width: 210, height: 210)
                    .shadow(color: .brown, radius: 3)
                Image("Nadia")
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 200, height: 200)
                
            }
            .padding()
            VStack(alignment: .center){
                Text(name)
                    .foregroundColor(.brown)
                    .font(.title2)
                    .bold()
                Text("\(age) years")
                    .font(.body)
                    .bold()
                    .foregroundColor(.brown)
                
                
                
                Spacer()
                
                Link(destination: URL(string: "https://www.linkedin.com/in/nadia-ramadhani-a828ab200")!) {
                    Text("Open linkedin")

                }
                .padding()
          
                
            }
            Spacer()
        }.navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
