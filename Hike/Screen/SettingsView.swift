//
//  SettingsView.swift
//  Hike
//
//  Created by Shazeen Thowfeek on 05/03/2024.
//

import SwiftUI

struct SettingsView: View {
    //MARK: -Properties
    
    private var alternateAppIcons: [String] = [
        "AppIcon-MagnifyingGlass",
        "AppIcon-Map",
        "AppIcon-Mushroom",
        "AppIcon-Camera",
        "AppIcon-Backpack",
        "AppIcon-Campfire"
    ]
    var body: some View {
        List{
            //MARK: -section header
            Section{
                HStack{
                    Spacer()
                    Image(systemName: "laurel.leading")
                        .font(.system(size: 80, weight: .black))
                    VStack(spacing: -10) {
                        Text("Hike")
                            .font(.system(size: 66, weight: .black))
                        Text("Editors Choice")
                            .fontWeight(.medium)
                    }
                    
                    Image(systemName: "laurel.trailing")
                        .font(.system(size: 80, weight: .black))
                    Spacer()
                }
                .foregroundStyle(
                    LinearGradient(
                        colors: [
                            .customGreenLight,
                            .customGreenMedium,
                            .customGreenDark],
                        startPoint: .topLeading,
                        endPoint: .bottom)
                )
                .padding(.top, 8)
                VStack(spacing: 8){
                    Text("Where can you find \nperfect tracks")
                        .font(.title2)
                        .fontWeight(.heavy)
                    
                    Text("The hike which looks gorgeous in photos but is even better once you are actually there.The hike that you hope to do again someday.\n Find the best day hikes in the app")
                        .font(.footnote)
                        .italic()
                    Text("Dust off the boots.its time for  a walk")
                        .fontWeight(.heavy)
                        .foregroundColor(.customGreenMedium)
                }
                .multilineTextAlignment(.center)
                .padding(.bottom,16)
                .frame(maxWidth: .infinity)
            }//header
            .listRowSeparator(.hidden)
            //MARK: - section icons
            Section(header: Text("Alternate Icons")){
                ScrollView(.horizontal,showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(alternateAppIcons.indices,id: \.self) { item in
                            Button(action: {
                                print("Icon \(alternateAppIcons[item])was pressed")
                                UIApplication.shared.setAlternateIconName(alternateAppIcons[item]){
                                    error in
                                    if error != nil {
                                        print("Failed request to update the apps icon: \(String(describing: error?.localizedDescription))")
                                    }else{
                                        print("Success! you have changed the apps icon to \(alternateAppIcons[item])")
                                    }
                                }
                            }, label: {
                                Image("\(alternateAppIcons[item])-Preview")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .cornerRadius(16)
                            })
                            .buttonStyle(.borderless)
                        }
                    }
                }
                .padding(.top, 12)
                Text("Choose your favorite app icons from the collection above")
                    .frame(minWidth: 0,maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .font(.footnote)
                    .padding(.bottom,12)
            }
            .listRowSeparator(.hidden)
            
            //MARK: - section about
            
            Section(
                header: Text("ABOUT THE APP"),
                footer: HStack{
                    Spacer()
                    Text("Copyright @ All right reserved")
                    Spacer()
                }
                    .padding(.vertical,8)
            ){
                //1.Basic labled content
                // LabeledContent("Aplication", value: "Hike")
                
                //2.advanced labeled content
                CustomListRowView(rowLabel: "Application", rowIcon: "apps.iphone", rowContent: "HIKE", rowTintColor: .blue)
                CustomListRowView(rowLabel: "Compatibility", rowIcon: "info.circle", rowContent: "IOS iPadOS", rowTintColor: .red)
                CustomListRowView(rowLabel: "Technology", rowIcon: "swift", rowContent: "Swift", rowTintColor: .orange)
                CustomListRowView(rowLabel: "Version", rowIcon: "gear", rowContent: "1.0", rowTintColor: .purple)
                CustomListRowView(rowLabel: "Developer", rowIcon: "ellipsis.curlybraces", rowContent: "John Doe", rowTintColor: .mint)
                CustomListRowView(rowLabel: "Designer", rowIcon: "paintpalette", rowContent: "Robert Petras", rowTintColor: .pink)
                CustomListRowView(rowLabel: "Website", rowIcon: "globe", rowTintColor: .indigo, rowLinkLabel: "Credo Academy", rowLinkdestination: "https://credo.academy")
            }//Section
        }
        
    }
}

#Preview {
    SettingsView()
}
