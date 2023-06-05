//
//  FontHelper.swift
//  Hotel Booking
//
//  Created by PC_iOS on 02/06/23.
//

import Foundation
import SwiftUI

struct FontHelper {
    
    static func SFProText_SemiboldFontWithSize(size: CGFloat) -> Font {
        return Font.custom("SFProText-Semibold", size: size)
    }
    
    static func SFProText_BoldFontWithSize(size: CGFloat) -> Font {
        return Font.custom("SFProText-Bold", size: size)
    }
    
    static func SFProText_MediumFontWithSize(size: CGFloat) -> Font {
        return Font.custom("SFProText-Medium", size: size)
    }
    
    static func SFProText_RegularFontWithSize(size: CGFloat) -> Font {
        return Font.custom("SFProText-Regular", size: size)
    }
    
}


