//
//  Movies.swift
//  CineReviews
//
//  Created by Vijay Karunamurthy on 9/14/14.
//  Copyright (c) 2014 vjkaruna. All rights reserved.
//

import Foundation

class Movie {
    
    // passed through init
    var identifier: String = ""
    
    // metadata
    var title: String = ""
    var synopsis: String = ""
    var thumbURL: String = ""
    var mpaaRating: String = ""
    var year: Int?
    var criticScore: Int?
    var audienceScore: Int?
    

    
    init(identifier: String) {
        self.identifier = identifier
        
    }
    
    lazy var posterURL: String = {
        return self.thumbURL.stringByReplacingOccurrencesOfString("tmb", withString: "ori")
    }()

    lazy var attributedShortDesc: NSMutableAttributedString = {
        let descText = NSMutableAttributedString()
        let textFont = [NSFontAttributeName:UIFont(name: "HelveticaNeue", size: 12.0)]
        let boldFont = [NSFontAttributeName:UIFont(name: "HelveticaNeue-Bold", size: 12.0)]

        descText.appendAttributedString(NSAttributedString(string: "\(self.title)\n\n\(self.mpaaRating)",attributes:boldFont))
        descText.appendAttributedString(NSAttributedString(string: " \(self.synopsis)",attributes:textFont))
        
        return descText
    }()
    
    lazy var attributedLongDesc: NSMutableAttributedString = {
        let descText = NSMutableAttributedString()
        let ps = NSMutableParagraphStyle()
        ps.lineSpacing = 5
        let textFont = [NSFontAttributeName:UIFont(name: "HelveticaNeue", size: 16.0), NSParagraphStyleAttributeName:ps]
        let boldFont = [NSFontAttributeName:UIFont(name: "HelveticaNeue-Bold", size: 20.0), NSParagraphStyleAttributeName:ps]

        
        if (self.year != nil) {
             descText.appendAttributedString(NSAttributedString(string: "\(self.title) (\(self.year!))\n",attributes:boldFont))
        } else {
             descText.appendAttributedString(NSAttributedString(string: "\(self.title)\n",attributes:boldFont))
        }
        if (self.criticScore != nil && self.audienceScore != nil) {
            descText.appendAttributedString(NSAttributedString(string: "Critics Score: \(self.criticScore!), Audience Score: \(self.audienceScore!)\n\n\(self.synopsis)",attributes:textFont))
        } else {
            descText.appendAttributedString(NSAttributedString(string: "\n\n\(self.synopsis)",attributes:textFont))
        }
        
        return descText
        }()
    

}

