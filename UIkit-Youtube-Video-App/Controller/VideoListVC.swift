//
//  ViewController.swift
//  UIkit-Youtube-Video-App
//
//  Created by Pavan Mikkilineni on 09/12/21.
//

import UIKit

class VideoListVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var videos=[Video]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate=self
        tableView.dataSource=self
        
        NetWorkManager.shared.getVideos(){ result in
            switch result{
            case .success(let response):
                self.updateUI(response: response)
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
    func updateUI(response:Response){
        DispatchQueue.main.async {
            self.videos=response.items!
            self.tableView.reloadData()
        }
    }


}

extension VideoListVC:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}

extension VideoListVC:UITableViewDataSource{
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID,for: indexPath) as! VideoCell
        
        let video=self.videos[indexPath.row]
        
        let cellId=video.videoId
        cell.cellId=cellId
        
        cell.configureCell(video)
        
        if cell.cellId == cellId{
            cell.setThumbnail(video: video)
        }
        
        
        return cell
        
    }
    
}
