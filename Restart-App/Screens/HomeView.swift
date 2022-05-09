
//  HomeView.swift
//  Restart-App
//
//  Created by Dario Mintzer on 02/05/2022.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    @State private var isAnimating: Bool = false
    
    var body: some View {
        VStack(spacing: 20){
            Spacer()
            //MARK: - HEADER
            ZStack {
                CircleGroupView(shapeColor: .gray, shapeOpacity: 0.2)
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .offset(y: isAnimating ? 35 : -35)
                    .animation(
                        .easeOut(duration:4)
                        .repeatForever(),
                        value: isAnimating)
            }//:HEADER
            Spacer()
            
            //MARK: - CENTER
            
            Text("""
                    The time that leads to mastery is
                    dependent on the intensity of your focus
                    """)
            .font(.title3)
            .fontWeight(.light)
            .foregroundColor(.secondary)
            .multilineTextAlignment(.center)
            .padding()
            
            Spacer()
            //MARK: - FOOTER
            
            Button(action: {
                withAnimation {
                    isOnboardingViewActive = true
                }
               
            }) {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                
                Text("Restart")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
            }//:BUTTON
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
        }//:VSTACK
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now()+1) {
                isAnimating = true
            }
        }
    }//:FOOTER
}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}