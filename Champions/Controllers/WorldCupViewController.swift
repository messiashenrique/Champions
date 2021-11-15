//
//  WorldCupViewController.swift
//  Champions
//
//  Created by Messias Henrique Vieira Silva on 04/06/21.
//

import UIKit

class WorldCupViewController: UIViewController {
    
    @IBOutlet weak var ivWinner: UIImageView!
    @IBOutlet weak var ivVice: UIImageView!
    @IBOutlet weak var lbScore: UILabel!
    @IBOutlet weak var lbWinner: UILabel!
    @IBOutlet weak var lbVice: UILabel!
    @IBOutlet weak var tableview: UITableView!
    
    var worldCup: WorldCup!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "World Cup – \(worldCup.year)"
        ivWinner.image = UIImage(named: "\(worldCup.winner).png")
        ivVice.image = UIImage(named: "\(worldCup.vice).png")
        lbScore.text = "\(worldCup.winnerScore) x \(worldCup.viceScore)"
        lbWinner.text = worldCup.winner
        lbVice.text = worldCup.vice
    }
    
}

extension WorldCupViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return worldCup.matches.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let games = worldCup.matches[section].games
        return games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! GamesTableViewCell
        let game = worldCup.matches[indexPath.section].games[indexPath.row]
        cell.prepare(with: game)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let match = worldCup.matches[section]
        return match.stage
    }
    
}

extension WorldCupViewController: UITableViewDelegate {

}

