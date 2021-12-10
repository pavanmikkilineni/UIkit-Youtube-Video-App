//
//  VideoCell.swift
//  UIkit-Youtube-Video-App
//
//  Created by Pavan Mikkilineni on 10/12/21.
//

import UIKit

class VideoCell: UITableViewCell {

    @IBOutlet weak var thumbnailImage: UIImageView!
    @IBOutlet weak var publishedLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    var cellId=""
   
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    
    func configureCell(_ video:Video){
        
        self.titleLabel.text=video.title
        
        let df=DateFormatter()
        df.dateFormat="EEEE, MMM d, yyyy"
        self.publishedLabel.text=df.string(from: video.published)
        
    }
    
    func setThumbnail(video:Video){
        NetWorkManager.shared.getThumbnail(thumbnailUrl: video.thumbnail){ result in
            switch result{
            case .success(let data):
                DispatchQueue.main.async {
                    self.thumbnailImage.image=UIImage(data: data!)
                }
            case .failure(let error):
                print(error.rawValue)
            }
        }
    }
    
    

}
