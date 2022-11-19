//
//  RedditAPICaller.swift
//  blueit
//
//  Created by Lucas Mattos on 11/19/22.
//

import UIKit

let REDIRECT_URI = "blueit://a"
let CLIENT_ID = "fGLcC77TVgO0idNwa_TNqQ" //public app client id
let OAUTH_ENDPOINT = "https://oauth.reddit.com"
let TOKEN_ACCESS_ENDPOINT = "https://www.reddit.com/api/v1/access_token"

let HEADERS = [
    "User-Agent": "blueit for reddit",
    "Content-Type": "application/x-www-form-urlencoded"
]

let loginString = "\(CLIENT_ID):"
let loginData = loginString.data(using: .utf8)
let base64LoginString = loginData!.base64EncodedString()

extension URL {
    //used for getting info from redirect uri (like session token)
    func valueOf(_ queryParameterName: String) -> String? {
        guard let url = URLComponents(string: self.absoluteString) else { return nil }
        return url.queryItems?.first(where: { $0.name == queryParameterName })?.value
    }
}

class RedditAPICaller: NSObject {
    
    //for calling methods in this class in other files
    static let client = RedditAPICaller()
    //stores session token
    public static var sessionToken: String? = nil
    var window: UIWindow?
    
    
    func setSessionToken(openURLContexts URLContexts: Set<UIOpenURLContext>) {
        //check if valid url
        guard let url = URLContexts.first?.url else {
            print("[BRUH] invalid url")
            return
        }
        //store auth code
        if let code = url.valueOf("code") {
            var request = URLRequest(url: URL(string: TOKEN_ACCESS_ENDPOINT)!)
            //set up all the request stuff
            request.httpMethod = "POST"
            var requestBodyComponents = URLComponents()
            requestBodyComponents.queryItems = [
                URLQueryItem(name: "grant_type", value: "authorization_code"),
                URLQueryItem(name: "code", value: code),
                URLQueryItem(name: "redirect_uri", value: REDIRECT_URI),
            ]
            request.httpBody = requestBodyComponents.query?.data(using: .utf8)
            request.allHTTPHeaderFields = HEADERS
            request.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
            let session = URLSession.shared
            let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
                //print(response!)
                do {
                    let json = try JSONSerialization.jsonObject(with: data!) as! Dictionary<String, AnyObject>
                    RedditAPICaller.sessionToken = json["access_token"]! as? String
                    //go to feed if successful login
                    DispatchQueue.main.async {
                        LoginViewController.client!.goToFeed()
                    }
                } catch {
                    print("[BRUH] error serializing json data")
                }
            })

            task.resume()
        } else {
            print("[BRUH] error when retrieving auth code: " + (url.valueOf("code") ?? "missing error"))
        }
        
        
        
        return
    }
    
    func bestPosts(limit: Int) {
        //let params = ["limit": limit]
        
        //var request = URLRequest(url: )
    }
}
