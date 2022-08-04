//
//  ContentView.swift
//  SwiftUiLearningProject
//
//  Created by EdgardVS on 3/08/22.
//

import SwiftUI

struct ContentView: View {
    var emojis: Array<String> = ["🚂","🚀","🚁","🛸", "🚌", "🚛", "🛶", "🛳", "⛵️", "🚃", "🛺"]
    @State var emojiCount = 6
    
    var body: some View {
        VStack {
            ScrollView {
                
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self ,content: { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    })
                }.foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
            }
            //usar el espaciado estandar para compatibiliadad con otros dispositivos
         
        }
        .padding(.horizontal)
            
       
    }
    
}

struct CardView: View {
    
    //cuando cambia el state se hace un re-build a la vista
    @State var isFaceUp: Bool = true
    var content: String
    var body: some View {
        //aligment es para alinear los elemntos dentro del ZStack, por default es .center
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20.0)
            //la funcion dentro del ZStack es mas conocidad como view builder
            //apila las vistas
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.stroke(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
            
        }.onTapGesture(perform: {
            isFaceUp = !isFaceUp
        })
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
            .previewInterfaceOrientation(.portraitUpsideDown)
      
    }
}
