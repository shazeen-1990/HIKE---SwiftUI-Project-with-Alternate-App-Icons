//
//  CardView.swift
//  Hike
//
//  Created by Shazeen Thowfeek on 04/03/2024.
//

import SwiftUI

struct CardView: View {
    
    //MARK: _ properties
    @State private var imageNumber: Int = 1
    @State private var randomNumber: Int = 1
    @State private var isShowingSheet: Bool = false
    
    //MARK: - functions
    
    func randomImage(){
        print("-----BUTTON WAS PRESSED----")
        print("Status: Old image Number = \(imageNumber)")
        repeat{
            randomNumber = Int.random(in: 1...5)
            print("Action: Random Number Generated = \(randomNumber)")
        }while randomNumber == imageNumber
        
        imageNumber = randomNumber
        print("Result: New Image Number = \(imageNumber)")
        print("----THE END ----")
        print("\n")
    }
    
    var body: some View {
        //MARK: - card
        
        ZStack {
            CustomBackgroundView()
            
            VStack {
                
                //MARK: - header
                VStack(alignment: .leading){
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52.0))
                            .foregroundStyle(
                                LinearGradient(colors: [.customGrayLight,
                                                        .customGrayMedium],
                                               startPoint: .top,
                                               endPoint: .bottom)
                        )
                        Spacer()
                        Button{
                            //ACtion: show a sheet
                            
                            print("The button was pressed")
                            isShowingSheet.toggle()
                        } label: {
                            CustomButtonView()
                            
                        }
                            .sheet(isPresented: $isShowingSheet){
                                SettingsView()
                                    .presentationDragIndicator(.visible)
                                    .presentationDetents([.medium,.medium])
                            }
                        
                    }
                    Text("Fun and enjoyable outdoor activities for frinds and families")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundColor(.customGrayMedium)
                }//header
                .padding(.horizontal,30)
                //MARK: - main content
                
                ZStack {
                    CustomCircleView()
                    Image("image-\(imageNumber)")
                         .resizable()
                     .scaledToFit()
                     .animation(.default, value: imageNumber)
                }
                //MARK: - footer
                Button {
                    //Action: generate a random number
                    //print("The button was pressed")
                    randomImage()
                } label: {
                    Text("Explore more")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(
                            LinearGradient(
                                colors: [.customGreenLight,.customGreenMedium],
                                startPoint: .top,
                                endPoint: .bottom)
                        )
                        .shadow(color: .black.opacity(0.25), radius: 0.25,x: 1, y:2)
                }
                .buttonStyle(GradientButton())
                

            }
        } //card
        .frame(width: 320,height: 570)
    }
}

#Preview {
    CardView()
}
