//
//  MasterViewController.swift
//  MathMonsters
//
//  Created by REVE Systems on 9/9/24.
//

import UIKit

protocol MonsterSelectionDelegate: class {
  func monsterSelected(_ newMonster: Monster)
}

class MasterViewController: UITableViewController {
    
    weak var delegate: MonsterSelectionDelegate?

    let monsters = [
        Monster(name: "Cat-Bot", description: "MEE-OW",
                iconName: "meetcatbot", weapon: .sword),
        Monster(name: "Dog-Bot", description: "BOW-WOW",
                iconName: "meetdogbot", weapon: .blowgun),
        Monster(name: "Explode-Bot", description: "BOOM!",
                iconName: "meetexplodebot", weapon: .smoke),
        Monster(name: "Fire-Bot", description: "Will Make You Steamed",
                iconName: "meetfirebot", weapon: .ninjaStar),
        Monster(name: "Ice-Bot", description: "Has A Chilling Effect",
                iconName: "meeticebot", weapon: .fire),
        Monster(name: "Mini-Tomato-Bot", description: "Extremely Handsome",
                iconName: "meetminitomatobot", weapon: .ninjaStar)
      ]
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return monsters.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let monster = monsters[indexPath.row]
        cell.textLabel?.text = monster.name
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedMonster = monsters[indexPath.row]
        delegate?.monsterSelected(selectedMonster)
        if let detailViewController = delegate as? DetailViewController,
            let detailNavigationController = detailViewController.navigationController {
            splitViewController?
                .showDetailViewController(detailNavigationController, sender: nil)
        }

    }

}
