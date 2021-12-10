//
//  VideoDetailVC.swift
//  UIkit-Youtube-Video-App
//
//  Created by Pavan Mikkilineni on 10/12/21.
//

import UIKit
import WebKit

class VideoDetailVC: UIViewController {

    @IBOutlet weak var titlelabel: UILabel!
    @IBOutlet weak var publishedlabel: UILabel!
    @IBOutlet weak var webView: WKWebView!
    
    @IBOutlet weak var descriptionLabel: UITextView!
    
    var video:Video?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        titlelabel.text=""
        publishedlabel.text=""
        descriptionLabel.text=""
        
        guard video != nil else{
            return
        }
        
        let embedUrl = Constants.EMBED_URL+video!.videoId
        
        let url=URL(string: embedUrl)!
        let request=URLRequest(url: url)
        webView.load(request)
        
        titlelabel.text=video!.title
        
        let df=DateFormatter()
        df.dateFormat="EEEE, MMM d, yyyy"
        publishedlabel.text=df.string(from: video!.published)
        
        descriptionLabel.text=video!.description
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
