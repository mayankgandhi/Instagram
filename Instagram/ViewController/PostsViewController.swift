//
//  PostsViewController.swift
//  Instagram
//
//  Created by Mayank Gandhi on 16/08/18.
//  Copyright © 2018 Mayank Gandhi. All rights reserved.
//

import UIKit
import Parse


class PostsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var posts:[Post] = []
    
    @IBOutlet weak var PostsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PostsTableView.dataSource = self
        PostsTableView.delegate = self
        PostsTableView.rowHeight = 200
        fetch_posts()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onLogout(_ sender: Any) {
        print("attm")
        NotificationCenter.default.post(name: NSNotification.Name("didLogout"), object: nil)
    }
    
    @IBAction func AddPressed(_ sender: Any) {
        print("performing Segue into the add post controller")
        self.performSegue(withIdentifier: "addPostSegue", sender: nil)
    }
    
    func fetch_posts()
    {
        // Construct PFQuery
        let query = Post.query()
        query?.order(byDescending: "createdAt")
        query?.includeKey("author")
        query?.limit = 20
        
        // Fetch data asynchronously
        query?.findObjectsInBackground(block: { (posts, error) in
            if let posts = posts {
                self.posts = posts as! [Post]
                self.PostsTableView.reloadData()
            } else {
                print(error?.localizedDescription)
            }
        })
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Post", for: indexPath) as! PostsTableViewCell
        
        let post = posts[indexPath.row]
        
        if let imageFile : PFFile = post.media {
            imageFile.getDataInBackground(block: { (data, error) in
                if error == nil {
                    DispatchQueue.main.async {
                        // Async main thread
                        let image = UIImage(data: data!)
                        cell.PostimageView.image = image
                    }
                } else {
                    print(error!.localizedDescription)
                }
            })
        }
        
        cell.captionLabel.text = post.caption
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
