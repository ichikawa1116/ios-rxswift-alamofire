//
//  TrackListDataProvider.swift
//  ios-rxswift-alamofire
//
//  Created by  on 2018/03/28.
//  Copyright © 2018 . All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class TrackListDataProvider: NSObject {
    var trackList:[TrackModel] = []
}

//MARK : -UITableViewDataSource
extension TrackListDataProvider: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return trackList.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(
            withIdentifier: TrackCell.cellName,
            for: indexPath) as? TrackCell{
            
            let track = trackList[indexPath.row]
            cell.trackNameLabel.text = track.trackName
            
            let URL = NSURL(string: track.artworkUrl)!
            cell.artWorkImageView!.af_setImage(withURL: URL as URL, placeholderImage: UIImage(named: "no-image"))
            return cell
        }else {
            return UITableViewCell()
        }
    }
}
