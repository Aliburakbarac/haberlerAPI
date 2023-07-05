//
//  HaberlerDataSourceDelegate.swift
//  haberler
//
//  Created by Ali Burak Baraç on 28.06.2023.
//

import UIKit

extension HaberlerViewController {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return haberler.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! HaberlerTableViewCell
                
                let haberModel = haberler[indexPath.row]
                
                
                let haber = haberModel
                
                cell.haberLabel.text = haber.title
                
                return cell
        
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedHaber = haberler[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: selectedHaber)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC",
               let selectedHaber = sender as? haberModel.News,
               let destinationVC = segue.destination as? DetailsViewController {
                destinationVC.haber = selectedHaber
            }
    }
}


