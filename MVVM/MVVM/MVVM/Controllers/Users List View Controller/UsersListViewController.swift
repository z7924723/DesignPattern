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
  private var usersListViewModel: UsersListViewModel!

  // Mark: - View Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.dataAccess = DataAccess()
    self.usersListViewModel = UsersListViewModel(dataAccess: dataAccess)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  // MARK: - Navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let destination = segue.destination as! RegistrationUserViewController
    
    let indexPath = (self.tableView.indexPathForSelectedRow)!
    
    let viewModel = self.usersListViewModel.userViewModels[indexPath.row]
    
    destination.viewModel = viewModel
  }
  
  // MARK: - Unwind Method
  @IBAction func unwindToUsersListViewController(segue: UIStoryboardSegue) {
    let source = segue.source as? RegistrationUserViewController
    
    let indexPath = (self.tableView.indexPathForSelectedRow)!
    self.usersListViewModel.userViewModels[indexPath.row] = (source?.viewModel)!
  }
}

extension UsersListViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.usersListViewModel.userViewModels.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath)
    
    let userViewModel = self.usersListViewModel.userViewModels[indexPath.row]
    
    cell.textLabel?.text = "\(userViewModel.firstName!), \(userViewModel.lastName!)"
    return cell
  }
}

