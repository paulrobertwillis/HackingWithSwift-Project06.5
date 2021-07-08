//
//  ViewController.swift
//  Project06.5
//
//  Created by Paul Willis on 08/07/2021.
//

import UIKit

class ViewController: UITableViewController {
    var shoppingList = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Shopping List"
        
        navigationItem.rightBarButtonItem =
                UIBarButtonItem(barButtonSystemItem: .add, target: self, action:
                #selector(promptForInput))
        navigationItem.leftBarButtonItem =
            UIBarButtonItem(barButtonSystemItem: .redo, target: self, action:
                #selector(startList))
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Item", for: indexPath)
        cell.textLabel?.text = shoppingList[indexPath.row]
        return cell
    }
    
    
    @objc func startList() {
        shoppingList.removeAll(keepingCapacity: true)
        tableView.reloadData()
    }
    
    
    @objc func promptForInput() {
        let ac = UIAlertController(title: "Enter item", message: nil,
        preferredStyle: .alert)
        ac.addTextField()
            
        let submitAction = UIAlertAction(title: "Submit", style: .default) {
          [weak self, weak ac] action in
    guard let input = ac?.textFields?[0].text else { return }
        self?.submit(input)
        }

        ac.addAction(submitAction)
        present(ac, animated: true)
      }

    
    func submit(_ input: String) {
            let lowerInput = input.lowercased()
            
            shoppingList.insert(lowerInput, at: 0)
            let indexPath = IndexPath(row: 0, section: 0)
            tableView.insertRows(at: [indexPath], with: .automatic)
        }



}

