//
//  HomeTableViewController.swift
//  blueit
//
//  Created by Mac Mini on 11/29/22.
//

import UIKit

let debug = true

class HomeTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if !debug {
            return
        }
        print("API token = " + (RedditAPICaller.sessionToken ?? "nil"))
        Task {
            //TODO: Either fix this crap or put it into a function
            //RedditAPICaller.client.getBestPosts(limit: Int)
            //gets two posts from the home page
            //returns some ungodly complex data structure
            let posts = try await RedditAPICaller.client.getBestPosts(limit: 2)
            //log posts
            print("=====POSTS=====")
            print(posts as Any)
            
            //RedditAPICaller.client.accessPost(postList: posts, index: Int)
            //gets the post info at an index
            let first_post = RedditAPICaller.client.accessPost(post_list: posts, index: 0)
            //you need the id of a post to get its comments
            //getComments only gets the top level comments (cant get replys to comments yet)
            let first_post_id = first_post?["id"]
            let comments = try await RedditAPICaller.client.getComments(article_id: first_post_id as? String, limit: 2)
            //log comments
            print("=====COMMENTS=====")
            print(comments as Any)
            //how to access a post's data
            print("first post keys: ", first_post?.keys as Any)
            print("first post title: ", first_post?["title"] as Any)
            
        }
    }
    
    
    @IBAction func onLogout(_ sender: Any) {
        
        self.dismiss(animated: true)
        UserDefaults.standard.set(false, forKey: "userLoggedIn")
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "feedCell", for: indexPath)
        return cell
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 6
    }


}
