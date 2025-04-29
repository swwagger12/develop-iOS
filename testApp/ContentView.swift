//
//  ContentView.swift
//  testApp
//
//  Created by GUEST_USER on 24/04/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        
        ZStack {
            BackgroundView(isNight: isNight)
            VStack {
                CityTextView(cityName: "Capertino, CA")
                VStack(spacing: 8) {
                    ImageTextView(imageName: isNight ? "sun.max.fill" : "moon.stars.fill",
                                  temp: 78)
                }
                .padding(.bottom, 40)
                
                HStack(spacing: 20) {
                    weatherView(dayName: "Sun",
                                imageName: "sun.max.fill",
                                temperature: "70°")
                    
                    weatherView(dayName: "Mon",
                                imageName: "wind.snow",
                                temperature: "58°")
                    
                    weatherView(dayName: "Tue",
                                imageName: "cloud.sun.bolt.fill",
                                temperature: "78°")
                    
                    weatherView(dayName: "Wed",
                                imageName: "cloud.sun.fill",
                                temperature: "67°")
                    
                    weatherView(dayName: "Thu",
                                imageName: "cloud.sun.bolt.fill",
                                temperature: "108°")

                }
                Spacer()
                
                Button {
                    isNight.toggle()
                    print(isNight)
                } label: {
                    ButtonTextView(buttonName: "Change day and Time")
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct weatherView: View {
    
    var dayName: String
    var imageName: String
    var temperature: String
    
    var body: some View {
        VStack {
            Text(dayName)
                .font(.system(size: 20, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50, alignment: .center)
            
            Text(temperature)
                .font(.system(size: 25, weight: .medium, design: .default))
            .foregroundColor(.white)                 }
    }
}

struct BackgroundView: View {
    var isNight: Bool
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .blue : .black,
                                                   isNight ? Color("LightBlue") : Color("Grey")])
                       , startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea(.all)
    }
}

struct CityTextView: View {
    var cityName: String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32 , weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct ImageTextView: View {
    var imageName: String
    var temp: Int
    var body: some View {
        Image(systemName: imageName)
            .resizable()
            .renderingMode(.original)
            .aspectRatio(contentMode: .fit)
            .frame(width: 180, height: 180, alignment: .center)
        Text("\(temp)°")
            .font(.system(size: 70, weight: .medium, design: .default))
            .foregroundColor(.white)
    }
}

struct ButtonTextView: View {
    var buttonName: String
    var body: some View {
        Text(buttonName)
            .frame(width: 280, height: 50, alignment: .center)
            .background(Color.white)
            .font(.system(size: 18, weight: .medium, design: .default))
            .cornerRadius(12)
    }
}
