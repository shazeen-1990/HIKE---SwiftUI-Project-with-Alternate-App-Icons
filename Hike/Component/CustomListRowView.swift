//
//  CustomListRowView.swift
//  Hike
//
//  Created by Shazeen Thowfeek on 05/03/2024.
//

import SwiftUI

struct CustomListRowView: View {
    //MARK: properties
    @State var rowLabel: String
    @State var rowIcon: String
    @State var rowContent: String? = nil
    @State var rowTintColor: Color
    @State var rowLinkLabel: String? = nil
    @State var rowLinkdestination: String? = nil
    
    
    var body: some View {
        LabeledContent {
            //content
            if rowContent != nil {
                Text(rowContent!)
                    .foregroundColor(.primary)
                    .fontWeight(.heavy)
            }else if (rowLinkLabel != nil && rowLinkdestination != nil){
                Link(rowLinkLabel!, destination: URL(string: rowLinkdestination!)!)
                    .foregroundColor(.pink)
                    .fontWeight(.heavy)
            
            } else {
                EmptyView()
            }
        } label: {
            HStack {
                ZStack{
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 30, height: 30)
                        .foregroundColor(rowTintColor)
                    Image(systemName: rowIcon)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                }
                Text(rowLabel)
            }
        }

    }
}

#Preview {
    List {
        CustomListRowView(
            rowLabel: "Website",
            rowIcon: "globe",
            rowContent: nil,
            rowTintColor: .pink,
            rowLinkLabel: "Credo Academy",
            rowLinkdestination: "https://credo.academy"
        )
    }
}

