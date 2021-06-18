//
//  UIView + Ext.swift
//  PlaceOnMapApp
//
//  Created by Jamal on 6/16/21.
//

import Foundation
import UIKit


extension UIView {
    
    enum anchorType {
        case top
        case bottom
        case leading
        case trailing
    }
    
    func alignTo(view: UIView,
                 top: (constant : CGFloat, viewAnchor: anchorType)? = nil,
                 leading: (constant : CGFloat, viewAnchor: anchorType)? = nil,
                 trailing: (constant : CGFloat, viewAnchor: anchorType)? = nil,
                 bottom: (constant : CGFloat, viewAnchor: anchorType)? = nil,
                 width wConstant: CGFloat? = nil,
                 height hConstant: CGFloat? = nil,
                 centerX xConstant: CGFloat? = nil,
                 centerY yConstant: CGFloat? = nil,
                 equalWidthRatio ewMultiplier: CGFloat? = nil,
                 equalHeightRatio ehMultiplier: CGFloat? = nil,
                 fillWithPadding fPadding: CGFloat? = nil,
                 fillVerticallyPadding fvPadding: CGFloat? = nil,
                 fillHorizontallyPadding fhPadding: CGFloat? = nil) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            let anchor = top.viewAnchor == .top ? view.topAnchor: view.bottomAnchor
            topAnchor.constraint(equalTo: anchor, constant: top.constant).isActive = true
        }
        
        if let leading = leading{
            let anchor = leading.viewAnchor == .leading ? view.leadingAnchor: view.trailingAnchor
            leadingAnchor.constraint(equalTo: anchor, constant: leading.constant).isActive = true
        }
        
        if let trailing = trailing {
            let anchor = trailing.viewAnchor == .leading ? view.leadingAnchor: view.trailingAnchor
            trailingAnchor.constraint(equalTo: anchor, constant: trailing.constant).isActive = true
        }
        
        if let bottom = bottom {
            let anchor = bottom.viewAnchor == .top ? view.topAnchor: view.bottomAnchor
            bottomAnchor.constraint(equalTo: anchor, constant: bottom.constant).isActive = true
        }
        
        if wConstant != nil{
            widthAnchor.constraint(equalToConstant: wConstant!).isActive = true
        }
        if hConstant != nil{
            heightAnchor.constraint(equalToConstant: hConstant!).isActive = true
        }
        
        if xConstant != nil{
            centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: xConstant!).isActive = true
        }
        if yConstant != nil{
            centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: yConstant!).isActive = true
        }
        
        if ewMultiplier != nil{
            widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: ewMultiplier!).isActive = true
        }
        
        if ehMultiplier != nil{
            heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: ehMultiplier!).isActive = true
        }
        
        if fPadding != nil{
            alignToSuperView(top: fPadding, leading: fPadding, trailing: fPadding, bottom: fPadding)
        }
        
        if fvPadding != nil{
            alignToSuperView(top: fvPadding, bottom: fvPadding)
        }
        
        if fhPadding != nil{
            alignToSuperView(leading: fhPadding, trailing: fhPadding)
        }
    }
    
    func alignToSuperView(top tConstant: CGFloat? = nil,
                          leading lConstant: CGFloat? = nil,
                          trailing rConstant: CGFloat? = nil,
                          bottom bConstant: CGFloat? = nil,
                          width wConstant: CGFloat? = nil,
                          height hConstant: CGFloat? = nil,
                          centerX xConstant: CGFloat? = nil,
                          centerY yConstant: CGFloat? = nil,
                          equalWidthRatio ewMultiplier: CGFloat? = nil,
                          equalHeightRatio ehMultiplier: CGFloat? = nil,
                          fillWithPadding fPadding: CGFloat? = nil,
                          fillVerticallyPadding fvPadding: CGFloat? = nil,
                          fillHorizontallyPadding fhPadding: CGFloat? = nil){
        
        translatesAutoresizingMaskIntoConstraints = false
        guard let superview = superview else{return}
        
        if tConstant != nil{
            topAnchor.constraint(equalTo: superview.topAnchor, constant: tConstant!).isActive = true
        }
        if lConstant != nil{
            leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant:lConstant!).isActive = true
        }
        if rConstant != nil{
            trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -rConstant!).isActive = true
        }
        
        if bConstant != nil{
            bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -bConstant!).isActive = true
        }
        if wConstant != nil{
            widthAnchor.constraint(equalToConstant: wConstant!).isActive = true
        }
        if hConstant != nil{
            heightAnchor.constraint(equalToConstant: hConstant!).isActive = true
        }
        
        if xConstant != nil{
            centerXAnchor.constraint(equalTo: superview.centerXAnchor, constant: xConstant!).isActive = true
        }
        if yConstant != nil{
            centerYAnchor.constraint(equalTo: superview.centerYAnchor, constant: yConstant!).isActive = true
        }
        
        if ewMultiplier != nil{
            widthAnchor.constraint(equalTo: superview.widthAnchor, multiplier: ewMultiplier!).isActive = true
        }
        
        if ehMultiplier != nil{
            heightAnchor.constraint(equalTo: superview.heightAnchor, multiplier: ehMultiplier!).isActive = true
        }
        
        if fPadding != nil{
            alignToSuperView(top: fPadding, leading: fPadding, trailing: fPadding, bottom: fPadding)
        }
        
        if fvPadding != nil{
            alignToSuperView(top: fvPadding, bottom: fvPadding)
        }
        
        if fhPadding != nil{
            alignToSuperView(leading: fhPadding, trailing: fhPadding)
        }
    }
    
    func addSubViews(_ views: UIView...){
        for view in views{
            self.addSubview(view)
        }
    }
}
