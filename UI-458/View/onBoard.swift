//
//  onBoard.swift
//  UI-458
//
//  Created by nyannyan0328 on 2022/02/10.
//

import SwiftUI

struct onBoard: View {
    @State var offset : CGFloat = 0
    var body: some View {
        OffsetPageTabView(offset: $offset) {
            
            HStack(spacing:0){
                
                
                ForEach(bordingScreens){screen in
                    
                    
                    VStack(spacing:20){
                        
                        
                        
                        Image(screen.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: getScreenBounds().width - 100, height:  getScreenBounds().width - 100)
                            .offset(y: -100)
                        
                        
                        VStack(alignment: .leading, spacing: 15) {
                            
                            Text(screen.title)
                                .font(.title.weight(.bold))
                                .foregroundColor(.white)
                            
                            Text(screen.description)
                                .font(.title3.weight(.semibold))
                                .foregroundColor(.white)
                            
                            
                            
                        }
                        
                      
                        .lLeading()
                        .offset(y: -80)
                    
                        
                        
                        
                        
                        
                    }
                    .padding()
                 
                    .frame(width: getScreenBounds().width)
                }
            }
            
            
        }
        
        .background(
        
        RoundedRectangle(cornerRadius: 50)
            .fill(.white)
            .frame(width: getScreenBounds().width - 100, height: getScreenBounds().width - 100)
            .scaleEffect(2)
            .rotationEffect(.init(degrees: getRotation()))
            .rotationEffect(.init(degrees: 25))
            .offset(y: -getScreenBounds().width + 20)
            
        
        
        )
       
        .background(Color("screen\(getIndex() + 1)")
                        .animation(.easeInOut, value: getIndex())
                    
                        
        
        
        
        )
        
        .ignoresSafeArea()
        .overlay(alignment:.bottom){
            
            VStack{
                
                
                HStack(spacing:20){
                    
                    
                    Button {
                        
                    } label: {
                        
                        
                        Text("Login Width JAKE")
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .lCenter()
                            .padding(.vertical,20)
                            .background(.white,in:RoundedRectangle(cornerRadius: 12))
                          
                    }
                    
                    
                    
                    Button {
                        
                    } label: {
                        
                        
                        Text("Lets Start")
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                            .lCenter()
                            .padding(.vertical,20)
                            .offset(x: -5)
                            .background(.white,in:RoundedRectangle(cornerRadius: 12))
                          
                    }


                    
                }
                .shadow(radius: 10)
                
                
                
                HStack{
                    
                    
                    Button {
                        
                        
                        offset = max(offset + getScreenBounds().width, getScreenBounds().width * 3)
                        
                    } label: {
                        
                        Text("Skip")
                            .font(.title3)
                            .fontWeight(.semibold)
                    }
                    
                    
                    
                    HStack(spacing:20){
                        
                        
                        ForEach(bordingScreens.indices){index in
                            
                            
                            Circle()
                                .fill(.black)
                                .opacity(index == getIndex() ? 0.8 : 0.5)
                                .frame(width: 8, height: 8)
                                .scaleEffect(index == getIndex() ? 3 : 1)
                                .animation(.spring(), value: getIndex())
                            
                            
                            
                        }
                    }
                    .lCenter()
                    
                    
                    
                    
                    
                    Button {
                        
                        
                        offset = min(offset + getScreenBounds().width, getScreenBounds().width * 3)
                        
                    } label: {
                        
                        Text("Next")
                            .font(.title3)
                            .fontWeight(.semibold)
                    }
                    
                    
                    Button {
                        
                        
                        offset = max(offset - getScreenBounds().width, getScreenBounds().width * 0)
                        
                    } label: {
                        
                        Text("Back")
                            .font(.title3)
                            .fontWeight(.semibold)
                    }


                    
                }
                .padding(.top,30)
                
                
                
                
                
            }
            .padding()
            
            
            
        }
    }
    
    func getRotation()->Double{
        
        let progress = offset / (getScreenBounds().width * 4)
        
        let rotation = progress * 360
        
        return rotation
    }
    
    
    
    func getIndex()->Int{
        
        let progress = (offset / getScreenBounds().width).rounded()
        
        
        
        return Int(progress)
    }
    
}

struct onBoard_Previews: PreviewProvider {
    static var previews: some View {
        onBoard()
    }
}
