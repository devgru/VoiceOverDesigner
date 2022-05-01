//
//  A11yControl.swift
//  VoiceOver Designer
//
//  Created by Mikhail Rubanov on 30.04.2022.
//

import QuartzCore

public class A11yControl: CALayer {
    public var a11yDescription: A11yDescription? {
        didSet {
            backgroundColor = a11yDescription?.color.cgColor
        }
    }
    
    public override var frame: CGRect {
        didSet {
            a11yDescription?.frame = frame
        }
    }
}