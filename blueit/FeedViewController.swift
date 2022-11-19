//
//  FeedViewController.swift
//  blueit
//
//  Created by Eli Young on 11/15/22.
//

import UIKit

class FeedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        print("API token = " + (RedditAPICaller.sessionToken ?? "nil"))
        Task {
            //TODO: Either fix this crap or put it into a function
            let posts = try await RedditAPICaller.client.getBestPosts(limit: 2)
            print("=====POSTS=====")
            print(posts as Any)
            
            
            //posts[0]["data"]["title"] to get first post
            guard let first_post = posts![0]["data"] as? NSDictionary else {
                print("could not get first post")
                return
            }
            guard let first_post_id = first_post["id"] as? String else {
                print("could not get id of first post")
                return
            }
            let comments = try await RedditAPICaller.client.getComments(articleId: first_post_id, limit: 2)
            print("=====COMMENTS=====")
            print(comments as Any)
            
            print("first post title: ", first_post["title"] as Any)
            
            //comments[1]["data"]["children"][0]["data"]["body"] to get the first comment
            //... lol
            guard let first_comment = comments![1]["data"] as? NSDictionary else {
                print("could not get first comment 1")
                return
            }
            print(first_comment.allKeys)
            guard let first_comment = first_comment["children"] as? NSArray else {
                print("could not get first comment 2")
                return
            }
            guard let first_comment = first_comment[0] as? NSDictionary else {
                print("could not get first comment 3")
                return
            }
            print(first_comment.allKeys)
            guard let first_comment = first_comment["data"] as? NSDictionary else {
                print("could not get first comment 4")
                return
            }
            print(first_comment.allKeys)
            print(first_comment["permalink"])
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
