//
//  PetDetailView.swift
//  somedaypet
//
//  Created by Ирина Пересыпкина on 08.09.2021.
//

import SwiftUI

struct PetDetailView: View {
    
    @State var isFavorite: Bool = false
    @State var currentIndex: Int = 0
    
    let pet: Pet
    
    private var _trailingView: some View {
        Image(systemName: isFavorite ? "heart.fill" : "heart")
            .foregroundColor(.primaryColor)
            .frame(width: 36, height: 36)
            .background(Color.white)
            .cornerRadius(18)
            .onTapGesture {
                isFavorite.toggle()
            }
    }
    
    var body: some View {
        VStack {
            ScrollView(.vertical) {
                ZStack(alignment: Alignment.bottom) {
                    PagingView(index: $currentIndex, maxIndex: pet.images.count - 1) {
                        ForEach(pet.images, id:\.self) { image in
                            Image(image)
                                .resizable()
//                                .clipShape(RoundedCorner(radius: 32, corners: [.bottomLeft, .bottomRight]))
                        }
                    }
                    
                    HStack(spacing: 8) {
                        ForEach(0...(pet.images.count - 1), id: \.self) { index in
                            Circle()
                                .fill(currentIndex == index ? Color.primaryColor : Color.primaryDark)
                                .frame(width: currentIndex == index ? 12 : 8, height: currentIndex == index ? 12 : 8)
                        }
                    }
                    .padding(.bottom, 50)
                }
                .frame(height: 355, alignment: .center)
                
                VStack {
                    HStack(spacing: 20) {
                        BoxDetailView(title: "Age", description: "\(pet.age)")
                        BoxDetailView(title: "Weight", description: "\(pet.weight) kg")
                        BoxDetailView(title: "Sex", description: pet.gender.rawValue.capitalized)
                    }
                    .padding(.top, 25)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Text(pet.name)
                                .font(.system(size: 18, weight: .medium))
                            Spacer()
                            Text(pet.breed.description)
                                .font(.system(size: 18, weight: .regular))
                        }
                        .padding(.top)
                        
                        HStack {
                            Image("location")
                            Text("Phnom Penh, Cambodia")
                                .font(.system(size: 14))
                                .foregroundColor(.gray)
                            Spacer()
                        }
                        Spacer().frame(height: 8)
                        Text("About")
                            .font(.system(size: 18, weight: .medium))
                        Text(pet.description)
                            .font(.system(size: 16, weight: .regular))
                            .lineSpacing(5)
                    }
                    .foregroundColor(.darkText)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .background(Color.lightGrey)
                .clipShape(RoundedCorner(radius: 32, corners: [.topLeft, .topRight]))
                .padding(.top, -40)
                
            }
            .padding(.bottom, -5)
            Spacer(minLength: 0)
            
            VStack(alignment: .leading) {
                Text("contact person")
                    .font(.system(size: 18, weight: .bold))
                    .padding(.leading)
                HStack {
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .frame(width: 36, height: 36)
                        .foregroundColor(Color.primaryColor)
                        .padding(.leading)
                    VStack(alignment: .leading) {
                        Text("Sohag Ahmed")
                            .font(.system(size: 14, weight: .medium))
                            .padding(.bottom, 1)
                        Text("Owner")
                            .font(.system(size: 12, weight: .light))
                    }
                    Spacer()
                    Button(action: {}) {
                        HStack {
                            Image(systemName: "phone.fill")
                                .foregroundColor(.white)
                                .frame(width: 36, height: 36)
                                .background(Color.primaryColor)
                                .cornerRadius(18)
                        }
                    }
                    .padding(.trailing, 5)
                    Button(action: {}) {
                        Image(systemName: "ellipses.bubble.fill")
                            .foregroundColor(.white)
                            .frame(width: 36, height: 36)
                            .background(Color.primaryColor)
                            .cornerRadius(18)
                    }
                    .padding(.trailing)
                }
            }
            .padding(.top, 8)
            .padding(.bottom)
            .background(Color.white)
            .clipShape(RoundedCorner(radius: 32, corners: [.topLeft, .topRight]))
        }
        .background(Color.lightGrey)
        .edgesIgnoringSafeArea(.top)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(trailing: _trailingView)
    }
}

struct BoxDetailView: View {
    let title: String
    let description: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.system(size: 14, weight: .light))
            Text(description)
                .font(.system(size: 14, weight: .medium))
        }
        .padding(10)
        .foregroundColor(.darkText)
        .frame(width: 100, height: 65, alignment: .center)
        .background(Color.white)
        .cornerRadius(15)
    }
}

struct PetDetailPreview: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PetDetailView(pet: Pet.dogs.first!)
        }
    }
}
