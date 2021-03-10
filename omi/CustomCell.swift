//
//  CustomCell.swift
//  omi
//
//  Created by Akira Tachibana on 3/5/21.
//

import UIKit

class CustomCell: UITableViewCell{
    let lucklabel = UILabel(frame: CGRect(x: 10, y: 10, width: 50, height: 30))
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        lucklabel.numberOfLines = 0
        self.contentView.addSubview(lucklabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("error occurs")
    }
    

}
