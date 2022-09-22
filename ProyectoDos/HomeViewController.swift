//
//  HomeViewController.swift
//  ProyectoDos
//
//  Created by Universidad Anahuac on 22/08/22.
//

import UIKit

class Practicas{
    var title: String
    var segueId: String
    
    init(title: String, segueId: String){
        self.title = title
        self.segueId = segueId
    }
}

class HomeViewController: UIViewController {
    
    @IBOutlet weak var practicas_tableView: UITableView!
    let data: [Practicas] = [
        Practicas(title: "Lista de Superhéroes", segueId: "listPokemonSegue")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        practicas_tableView.dataSource = self
        practicas_tableView.delegate = self
    }

}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = practicas_tableView.dequeueReusableCell(withIdentifier: "cell")
        if(cell == nil){
            cell = UITableViewCell()
        }
        let item = data[indexPath.row]
        cell?.textLabel?.text = item.title
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = data[indexPath.row]
        performSegue(withIdentifier: item.segueId, sender: nil)
    }

}
