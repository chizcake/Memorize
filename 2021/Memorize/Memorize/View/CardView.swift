//
//  CardView.swift
//  Memorize
//
//  Created by Henry Yoo on 2021/05/27.
//

import SwiftUI

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20.0)
            
            if isFaceUp {
                shape.fill(Color.white)
                shape.strokeBorder(lineWidth: 3.0)
                Text(content).font(.largeTitle)
            }
            else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(content: "🚘")
    }
}
