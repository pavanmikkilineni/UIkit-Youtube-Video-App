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
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell",for: indexPath)
        let title = self.videos[indexPath.row].title
        cell.textLabel?.text=title
        return cell
        
    }
    
}
