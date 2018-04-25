//
//  ViewController.swift
//  MVVM
//
//  Created by PinguMac on 2018/4/25.
//  Copyright © 2018年 PinguMac. All rights reserved.
//

import UIKit

class UsersListViewController: UIViewController {
  
  // MARK: - Porperties
  @IBOutlet weak var tableView: UITableView!
  private var dataAccess: DataAccess!
  var users: [User]!

  // Mark: - View Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.dataAccess = DataAccess()
    users = dataAccess.getAllUsers()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let destination = segue.destination as! RegistrationUserViewController
    
    let indexPath = (self.tableView.indexPathForSelectedRow)!
    
    destination.userInfo = users[indexPath.row]
  }
}

extension UsersListViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return users.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath)
    
    cell.textLabel?.text = "\(users[indexPath.row].firstName!), \(users[indexPath.row].lastName!)"
    return cell
  }
}

