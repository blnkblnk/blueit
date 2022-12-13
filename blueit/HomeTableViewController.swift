//
//  HomeTableViewController.swift
//  blueit
//
//  Created by Mac Mini on 11/29/22.
//

import UIKit

let debug = true

class HomeTableViewController: UITableViewController {
    var num_posts = 0
    var posts: [[String: Any]]? = nil
    
    var blueitArray = [NSDictionary]()
    
    let myRefreshControl = UIRefreshControl()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadfeed()
        
        myRefreshControl.addTarget(self, action: #selector(loadfeed), for: .valueChanged)
        tableView.refreshControl = myRefreshControl
        
    }
    

    
    @objc func loadfeed() {
        
        print("API token = " + (RedditAPICaller.sessionToken ?? "nil"))
        Task {
            //TODO: Either fix this crap or put it into a function
            //RedditAPICaller.client.getBestPosts(limit: Int)
            //gets two posts from the home page
            //returns some ungodly complex data structure
            posts = try await RedditAPICaller.client.getPosts(limit: 10, endPoint: "/best")
            num_posts = 10
            self.tableView.reloadData()
            
            
            //EVERYTHING AFTER THIS POINT IS DEBUG
            if !debug {
                return
            }
            
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
            print("first post upvote status: {", type(of: first_post?["likes"]) , "}")
            
            //how to check if a post is upvoted or not
            let upvote_status = first_post?["likes"] as? Bool
            if upvote_status == true {
                print("upvoted")
            } else if upvote_status == nil {
                print("not voted")
            } else if upvote_status == false {
                print("downvoted")
            }
            
            self.myRefreshControl.endRefreshing()

            //how to vote
            //-1 is downvote, 0 is remove vote, 1 is upvote
            _ = try await RedditAPICaller.client.votePost(id: first_post_id as? String, dir: 1)
            
            let first_comment = RedditAPICaller.client.accessComment(comment_list: comments, index: 0)
            
            _ = try await RedditAPICaller.client.voteComment(id: first_comment?["id"] as? String, dir: 1)
            
            //print user
            print("=====USER=====")
            let user = try await RedditAPICaller.client.getIdentity()
            print(user as Any)
            print(user?.keys as Any)
            print(user?["id"] as Any)
            print(user?["name"] as Any)
            let userPosts = try await RedditAPICaller.client.getUserPosts(limit: 1, username: user?["name"] as? String)
            let userFirstPost = RedditAPICaller.client.accessPost(post_list: userPosts, index: 0)
            print(userFirstPost?["title"] as Any)
            
            //dummy post
            let dummy_post = try await RedditAPICaller.client.submitTextPost(subreddit: "test", title: "test", text: "test")
            print(dummy_post as Any)
        }

    }
    
    @IBAction func onLogout(_ sender: Any) {
        
        self.dismiss(animated: true)
        UserDefaults.standard.set(false, forKey: "userLoggedIn")
 	       
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "feedCell", for: indexPath) as! blueitTableViewCell
        
        let post = RedditAPICaller.client.accessPost(post_list: posts, index: indexPath.row)
        
        cell.subreddit.text = post?["subreddit_name_prefixed"] as? String ?? "no subreddit_name_prefixed"//subreddit_name_prefixed
        cell.authorlabel.text = post?["author"] as? String ?? "no author" //author
        cell.headLine.text = post?["title"] as? String ?? "no title" //title
        cell.content.text = post?["selftext"] as? String ?? "no selftext" //selftext
        
        
        
        
        print("got post link \(post?["url_overridden_by_dest"] ?? "nil")")
        
        return cell
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return num_posts
    }


}
