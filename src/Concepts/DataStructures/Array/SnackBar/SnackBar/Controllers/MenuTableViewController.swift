//
//  MenuTableViewController.swift
//  SnackBar
//
//  Created by richard Haynes on 2/12/23.
//
// https://www.youtube.com/watch?v=QqGak909E-c&t=497s
// https://www.programiz.com/swift-programming/library/array/filter
// https://developer.apple.com/documentation/swift/sequence/filter(_:)
// https://www.hackingwithswift.com/example-code/language/how-to-remove-items-from-an-array-using-filter
import UIKit

class MenuTableViewController: UITableViewController {
    private var Snacks: [Snack] {
        // Filters out any item that doesn't have an emoji image
        return MenuViewModel.Snacks.filter {$0.Image != nil}
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Snacks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = Snacks[indexPath.row].FormatedDisplay()
        return cell
    }

}
