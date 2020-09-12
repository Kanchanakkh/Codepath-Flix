//
//  WebViewController.swift
//  flixster
//
//  Created by Kanchanak Khat on 9/11/20.
//  Copyright © 2020 Kanchanak Khat. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKUIDelegate {

    
    var movie: [String: Any]?
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchTrailer()

        // Do any additional setup after loading the view.
    }
    func fetchTrailer() {
               
            
          
            let  id = movie!["id"] as! NSNumber
            let url = URL(string: "https://api.themoviedb.org/3/movie/\(id.stringValue)/videos?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed&language=en-US")

        
            let request = URLRequest(url: url! , cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
               let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
               let task = session.dataTask(with: request) { (data, response, error) in
                   // This will run when the network request returns
                   if let error = error {
                       print(error.localizedDescription)
                   } else if let data = data {
                       let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                       let videos = dataDictionary["results"] as! [[String: Any]]
                       let video = videos[0]
                       let key = video["key"] as! String
                       if let myURL = URL(string: "https://www.youtube.com/watch?v=" + key) {
                           let myRequest = URLRequest(url: myURL)
                           self.webView.load(myRequest)
                       }
                   }
               }

               task.resume()
           }

         override func didReceiveMemoryWarning() {
           super.didReceiveMemoryWarning()
           // Dispose of any resources that can be recreated.
         }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


