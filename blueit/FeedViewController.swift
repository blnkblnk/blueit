//
//  FeedViewController.swift
//  blueit
//
//  Created by Eli Young on 11/15/22.
//

import UIKit

class FeedViewController: UIViewController, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("cellforrows is working")	
        let cell = tableView.dequeueReusableCell(withIdentifier: "feedCell")
        return cell!
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
      return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 5
    }
    
   /* func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath)
    {
        
    }*/
    
    
  

    override func viewDidAppear(_ animated: Bool) {
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
            let comments = try await RedditAPICaller.client.getComments(article_id: first_post_id! as! String, limit: 2)
            //log comments
            print("=====COMMENTS=====")
            print(comments as Any)
            //how to access a post's data
            print("first post keys: ", first_post?.keys as Any)
            print("first post title: ", first_post?["title"] as Any)
            
            //RedditAPICaller.client.accessComment(commentList: comments, index: 0)
            //gets the comment info at an index, given a comment list
            let first_comment = RedditAPICaller.client.accessComment(comment_list: comments, index: 0)
            print("first comment keys: ", first_comment?.keys as Any)
            print("first comment text: ", first_comment?["body"] as Any)
            
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

}
