//
//  Extencions.swift
//  UI-458
//
//  Created by nyannyan0328 on 2022/02/10.
//

import SwiftUI

extension View{
    
    
    
    func getScreenBounds()->CGRect{
        
        return UIScreen.main.bounds
    }
    func lLeading()->some View{
           
           self
               .frame(maxWidth:.infinity,alignment: .leading)
       }
       func lTreading()->some View{
           
           self
               .frame(maxWidth:.infinity,alignment: .trailing)
       }
       func lCenter()->some View{
           
           self
               .frame(maxWidth:.infinity,alignment: .center)
       }
       
       func maxHW()->some View{
           
           self
               .frame(maxWidth:.infinity,maxHeight: .infinity)
           
       
       }

}
