//
//  WeatherButton.swift
//  Swift-UI_Weather
//
//  Created by Pranav Sai on 12/4/22.
//

import SwiftUI

struct weatherButton: View{
    var title:String
    var textColor:Color
    var bg:Color
    var body: some View{
        Text(title)
            .frame(width:280,height:50)
            .background(bg)
            .foregroundColor(textColor)
            .font(.system(size:20,weight:.bold,design:.default))
            .cornerRadius(10)
    }
}
