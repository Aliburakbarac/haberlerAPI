//
//  HaberlerViewController.swift
//  haberler
//
//  Created by Ali Burak Baraç on 28.06.2023.
//

import UIKit

class HaberlerViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    var haberler: [haberModel.News] = []
    @IBOutlet weak var haberlerTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        haberlerTableView.dataSource = self
        haberlerTableView.delegate = self
        
        
        haberlerViewModel().GetNews { [weak self] haberModel in
                    self?.haberler = haberModel?.news ?? []
                    DispatchQueue.main.async {
                        self?.haberlerTableView.reloadData()
                    }
                }
        
    }
    


}
