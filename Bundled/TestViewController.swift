//
//  TestViewController.swift
//  TabbarPages
//
//  Created by Wenqi Wang on 05/04/2017.
//  Copyright © 2017 SixSix. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {

    //login button UI
    override func viewDidLoad() {
        super.viewDidLoad()
        print("im here")

        // Do any additional setup after loading the view.

            super.viewDidLoad()
            
    //        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
            
            //let image = UIImage(named: "new_message_icon")
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "nima", style: .plain, target: self, action: #selector(handleNewMessage))
            
            //checkIfUserIsLoggedIn()
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 44, height: 44))
        button.backgroundColor = UIColor.red
        button.setTitle("Go", for: .normal)
        button.addTarget(self, action: #selector(handleNewMessage), for: .touchDown)

        self.view.addSubview(button)
    }

    func handleNewMessage() {
        let newMessageController = TabBarController()
        let navController = UINavigationController(rootViewController: newMessageController)
        present(navController, animated: true, completion: nil)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
