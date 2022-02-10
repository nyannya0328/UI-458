//
//  OffsetPageTabView.swift
//  UI-458
//
//  Created by nyannyan0328 on 2022/02/10.
//

import SwiftUI

struct OffsetPageTabView<Content : View>: UIViewRepresentable {
   
    
    func makeCoordinator() -> Coordinator {
        
        return Coordinator(parent: self)
    }
    var content : Content
    @Binding var offset : CGFloat
    
    
    init(offset : Binding<CGFloat>,@ViewBuilder content : @escaping()->Content) {
        self.content = content()
        self._offset = offset
    }
    
    
    func makeUIView(context: Context) -> UIScrollView {
        
        let scroll = UIScrollView()
        
        let hostiongController = UIHostingController(rootView: content)
        
        hostiongController.view.translatesAutoresizingMaskIntoConstraints = false
        hostiongController.view.backgroundColor = .clear
        
        
        let contatins = [
        
            hostiongController.view.topAnchor.constraint(equalTo: scroll.topAnchor),
            hostiongController.view.bottomAnchor.constraint(equalTo: scroll.bottomAnchor),
            hostiongController.view.trailingAnchor.constraint(equalTo: scroll.trailingAnchor),
            hostiongController.view.leadingAnchor.constraint(equalTo: scroll.leadingAnchor),
            hostiongController.view.heightAnchor.constraint(equalTo: scroll.heightAnchor),
        
        
        ]
        
        scroll.addConstraints(contatins)
        scroll.addSubview(hostiongController.view)
        
        
        
        scroll.isPagingEnabled = true
        scroll.showsVerticalScrollIndicator = false
        scroll.showsHorizontalScrollIndicator = false
        scroll.delegate = context.coordinator
        return scroll
        
        
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        
        let currrentOffset = uiView.contentOffset.x
        
        if offset != currrentOffset{
            
            uiView.setContentOffset(CGPoint(x: offset, y: 0), animated: true)
        }
        
    }
    
    class Coordinator : NSObject,UIScrollViewDelegate{
        
        
        var parent : OffsetPageTabView
        init(parent : OffsetPageTabView) {
            self.parent = parent
        }
        
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            
            let offset = scrollView.contentOffset.x
            
            
            parent.offset = offset
        }
        
        
    }
    
}

