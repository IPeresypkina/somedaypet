//
//  AuthorizationView.swift
//  somedaypet
//
//  Created by Ирина Пересыпкина on 10.09.2021.
//

import SwiftUI

struct AuthorizationView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            Home()
        }
    }
}

struct Home: View {
    @State var index = 0
    @Namespace var name
    
    var body: some View {
        ZStack {
            Color.white
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
            VStack() {
                VStack() {
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 160)
                }
                .frame(maxWidth: .infinity)
                .background(RoundedCorners(color: .white, tr: 0, bl: 50))
                .background(Color.lightGrey)
                
                VStack {
                    Spacer(minLength: 0)
                    HStack(spacing: 25) {
                        Button(action: {
                            withAnimation(.spring()) {
                                index = 0
                            }
                        }) {
                            VStack {
                                Text("Log In")
                                    .font(index == 0 ? .system(size: 20) : .system(size: 16))
                                    .fontWeight(.bold)
                                    .foregroundColor(index == 0 ? .black : .gray)
                            }
                        }
                        Button(action: {
                            withAnimation(.spring()) {
                                index = 1
                            }
                        }) {
                            VStack {
                                Text("Sign Up")
                                    .font(index == 1 ? .system(size: 20) : .system(size: 16))
                                    .fontWeight(.bold)
                                    .foregroundColor(index == 1 ? .black : .gray)
                            }
                        }
                    }
                    .frame(height: 50)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 20)
                    .padding(.leading)

                    if index == 0 {
                        Login()
                    }
                    else {
                        SignUP()
                    }
                }
                .background(RoundedCorners(color: .lightGrey, tr: 50, bl: 0))
            }
//            Color.lightGrey
        }
       
    }
}

struct CShapeLogin: Shape {
    func path(in rect: CGRect) -> Path {
        return Path {path in
            path.move(to: CGPoint(x: rect.width, y: 100))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: 0))
        }
    }
}

struct CShapeSinUp: Shape {
    func path(in rect: CGRect) -> Path {
        return Path {path in
            path.move(to: CGPoint(x: 0, y: 100))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
        }
    }
}

struct Login: View {
    
    @State var email = ""
    @State var pass = ""
    @State var rememberMe = false
    @State private var isSecured: Bool = false
//    @Binding var index: Int
    
    var body: some View {
            VStack {
                VStack(alignment: .leading, spacing: 15) {
                    HStack {
                        Image(systemName: "envelope.fill")
                            .padding(.leading)
                        Rectangle()
                            .fill(Color.gray)
                            .frame(width: 1, height: 20)
                            .padding(.leading, 1)
                        
                        TextField("Email Address", text: self.$email)
                            .foregroundColor(.gray)
                            .font(.system(size: 16, weight: .regular))
                            .padding(.leading, 1)
                    }
                    .frame(height: 65)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.lightGrey, lineWidth: 1))
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                }
                
                VStack(alignment: .leading, spacing: 15) {
                    HStack {
                        Image(systemName: "lock.fill")
                            .padding(.leading)
                        Rectangle()
                            .fill(Color.gray)
                            .frame(width: 1, height: 20)
                            .padding(.leading, 1)
                        
                        SecureField("Password", text: self.$pass)
                        .foregroundColor(.gray)
                        .font(.system(size: 16, weight: .regular))
                        .padding(.leading, 1)
                    }
                    .frame(height: 65)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.lightGrey, lineWidth: 1))
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                }
                .padding(.top, 5)
                
                HStack {
                    Toggle("Remember me", isOn: $rememberMe)
                                .toggleStyle(CheckToggleStyle())
                    
                    Spacer(minLength: 0)
                    Button(action: {}) {
                        Text("Forget Passwotd?")
                            .foregroundColor(Color.primaryColor)
                    }
                }
                .padding(.top, 5)
                
                Button(action: {}) {
                    Text("Log In")
                        .fontWeight(.bold)
                        .font(.system(size: 18, weight: .medium))
                        .padding()
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background(Color.primaryColor)
                        .cornerRadius(15)
                }
                .padding(.top, 5)
                
                HStack {
                    Rectangle()
                        .fill(Color.black)
                        .frame(width: 50, height: 1)
                    Text("or")
                    Rectangle()
                        .fill(Color.black)
                        .frame(width: 50, height: 1)
                }
                .padding(.top, 15)
                
                HStack(spacing: 25) {
                    Button(action: {}) {
                        Image("google")
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 50, height: 40)
                            .clipShape(Circle())
                    }
                    Button(action: {}) {
                        Image("facebook")
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 45, height: 45)
                            .clipShape(Circle())
                    }
                    Button(action: {}) {
                        Image("apple")
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                    }
                }
                .padding(.top, 10)
    
                
            }
            .padding()
            .padding(.bottom)
    }
}

struct SignUP: View {
    
    @State var name = ""
    @State var email = ""
    @State var pass = ""
    @State var Repass = ""
//    @Binding var index : Int
    
    var body: some View {
            VStack {
                VStack(alignment: .leading, spacing: 15) {
                    HStack {
                        Image(systemName: "person.fill")
                            .padding(.leading)
                        Rectangle()
                            .fill(Color.gray)
                            .frame(width: 1, height: 20)
                            .padding(.leading, 1)
                        
                        TextField("Name and surnames", text: self.$name)
                            .foregroundColor(.gray)
                            .font(.system(size: 16, weight: .regular))
                            .padding(.leading, 1)
                    }
                    .frame(height: 65)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.lightGrey, lineWidth: 1))
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                }
                
                VStack(alignment: .leading, spacing: 15) {
                    HStack {
                        Image(systemName: "envelope.fill")
                            .padding(.leading)
                        Rectangle()
                            .fill(Color.gray)
                            .frame(width: 1, height: 20)
                            .padding(.leading, 1)
                        
                        TextField("Email Address", text: self.$email)
                            .foregroundColor(.gray)
                            .font(.system(size: 16, weight: .regular))
                            .padding(.leading, 1)
                    }
                    .frame(height: 65)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.lightGrey, lineWidth: 1))
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                }
                .padding(.top, 5)
                
                VStack(alignment: .leading, spacing: 15) {
                    HStack {
                        Image(systemName: "lock.fill")
                            .padding(.leading)
                        Rectangle()
                            .fill(Color.gray)
                            .frame(width: 1, height: 20)
                            .padding(.leading, 1)
                        
                        SecureField("Password", text: self.$pass)
                            .foregroundColor(.gray)
                            .font(.system(size: 16, weight: .regular))
                            .padding(.leading, 1)
                    }
                    .frame(height: 65)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.lightGrey, lineWidth: 1))
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                }
                .padding(.top, 5)
                
                VStack(alignment: .leading, spacing: 15) {
                    HStack {
                        Image(systemName: "lock.fill")
                            .padding(.leading)
                        Rectangle()
                            .fill(Color.gray)
                            .frame(width: 1, height: 20)
                            .padding(.leading, 1)
                        
                        SecureField("Confirm Password", text: self.$Repass)
                            .foregroundColor(.gray)
                            .font(.system(size: 16, weight: .regular))
                            .padding(.leading, 1)
                    }
                    .frame(height: 65)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.lightGrey, lineWidth: 1))
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                }
                .padding(.top, 5)
                
                Button(action: {}) {
                    Text("Sign Up")
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
            .padding()
            .padding(.bottom, 65)
//            .background(Color.lightGrey)
//            .clipShape(CShapeSinUp())
//            .contentShape(CShapeSinUp())
//            .cornerRadius(35)
//            .shadow(color: Color.black.opacity(0.3), radius: 5, x:0, y: -5)
//            .onTapGesture {
//                self.index = 1
//            }
//            .opacity(self.index == 1 ? 1 : 0)
    }
}

struct CheckToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            Label {
                configuration.label
            } icon: {
                Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(configuration.isOn ? .accentColor : .secondary)
                    .imageScale(.large)
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct RoundedCorners: View {
    var color: Color = .black
    var tl: CGFloat = 0.0 // top-left radius parameter
    var tr: CGFloat = 0.0 // top-right radius parameter
    var bl: CGFloat = 0.0 // bottom-left radius parameter
    var br: CGFloat = 0.0 // bottom-right radius parameter
    
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                
                let w = geometry.size.width
                let h = geometry.size.height
                
                // We make sure the radius does not exceed the bounds dimensions
                let tr = min(min(self.tr, h/2), w/2)
                let tl = min(min(self.tl, h/2), w/2)
                let bl = min(min(self.bl, h/2), w/2)
                let br = min(min(self.br, h/2), w/2)
                
                path.move(to: CGPoint(x: w / 2.0, y: 0))
                path.addLine(to: CGPoint(x: w - tr, y: 0))
                path.addArc(center: CGPoint(x: w - tr, y: tr), radius: tr, startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 0), clockwise: false)
                path.addLine(to: CGPoint(x: w, y: h - br))
                path.addArc(center: CGPoint(x: w - br, y: h - br), radius: br, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), clockwise: false)
                path.addLine(to: CGPoint(x: bl, y: h))
                path.addArc(center: CGPoint(x: bl, y: h - bl), radius: bl, startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 180), clockwise: false)
                path.addLine(to: CGPoint(x: 0, y: tl))
                path.addArc(center: CGPoint(x: tl, y: tl), radius: tl, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 270), clockwise: false)
                }
                .fill(self.color)
        }
    }
}

struct AuthorizationViewPreview: PreviewProvider {
    static var previews: some View {
        AuthorizationView()
    }
}
