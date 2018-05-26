//
//  TrackCell.swift
//  ios-rxswift-alamofire
//
//  Created by  on 2018/03/25.
//  Copyright © 2018 . All rights reserved.
//

import UIKit

class TrackCell: UITableViewCell {

    static let cellName = "TrackCell"
    static let cellHeight: CGFloat = 60
    
    @IBOutlet weak var artWorkImageView: UIImageView!
    @IBOutlet weak var trackNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
