//
//  FilterView.swift
//  somedaypet
//
//  Created by Ирина Пересыпкина on 23.09.2021.
//

import SwiftUI

struct FilterView: View {
    @State private var _selectedPetType: Pet.PetType = .dogs
    @State private var _selectedGender: Pet.Gender = .male
    
    var body: some View {
        VStack {
            HStack {
                PetTypesView(selectedPetType: $_selectedPetType, selectedGender: $_selectedGender)
            }
        }
    }
}

struct PetTypesView: View {
    
    @Binding var selectedPetType: Pet.PetType
    @Binding var selectedGender: Pet.Gender
    @State var currentTypeGender = "both"
    @State var currentTypeAnnouncement = "all"
    
    var body: some View {
        VStack{
            VStack {
                Text("Type of animal")
                    .fontWeight(.light)
                    .frame(maxWidth: .infinity, alignment: .leading)
                HStack(spacing: 15) {
                    ForEach(Pet.PetType.allCases) { petType in
                        Button(action: {
                            selectedPetType = petType
                        }) {
                            VStack {
                                Label(petType.id, image: petType.rawValue)
                                    .foregroundColor(selectedPetType == petType ? .secondaryDark : .darkText)
                                    .frame(height: 50)
                                    .frame(maxWidth: .infinity)
                                    .background(selectedPetType == petType ? Color.secondaryColor : .clear)
                                    .cornerRadius(15)
                                    .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.lightGrey, lineWidth: 1))
                                    .font(.system(size: 16, weight: .regular))
                                    .foregroundColor(.darkText)
                            }
                        }
                    }
                }
                
                
                Text("Animal gender")
                    .fontWeight(.light)
                    .frame(maxWidth: .infinity, alignment: .leading)
                HStack(spacing: 15) {
                    ForEach(["both", "female", "male"], id: \.self) { tab in
                        TabButton(title: tab, currentType: $currentTypeGender)
                    }
                }
                
                Text("Type of ads")
                    .fontWeight(.light)
                    .frame(maxWidth: .infinity, alignment: .leading)
                HStack(spacing: 15) {
                    ForEach(["all", "adoption", "disappear", "found"], id: \.self) { tab in
                        TabButton(title: tab, currentType: $currentTypeAnnouncement)
                    }
                }
                
                Button(action: {}) {
                    Text("To apply")
                        .fontWeight(.bold)
                        .font(.system(size: 18, weight: .medium))
                        .padding()
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background(Color.primaryColor)
                        .cornerRadius(15)
                }
                .padding(.top, 5)
                
            }
            .padding(.leading)
            .padding(.trailing)
            
        }
    }
}

struct TabButton: View {
    var title: String
    @Binding var currentType: String
    
    var body: some View {
        Button {
            withAnimation {
                currentType = title
            }
        } label: {
            Text(title)
                .foregroundColor(title == currentType ? .secondaryDark : .darkText)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 8)
                .background(title == currentType ? Color.secondaryColor : .clear)
                .cornerRadius(15)
                .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.lightGrey, lineWidth: 1))
                .font(.system(size: 16, weight: .regular))
                .foregroundColor(.darkText)
        }
    }
    
}

struct FilterViewPreviewProvider: PreviewProvider {
    static var previews: some View {
        NavigationView {
            FilterView()
        }
    }
}
