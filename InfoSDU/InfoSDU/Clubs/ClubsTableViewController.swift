//
//  ClubsViewController.swift
//  InfoSDU
//
//  Created by Babakhanov Nazhmeddin on 24.02.2018.
//  Copyright © 2018 Nolan. All rights reserved.
//

import UIKit
import Cartography

protocol ClubInfo {
    var infoAboutClub: ClubsModel{get set}
}

class ClubsTableViewController: UITableViewController, ClubInfo {
    
    var infoAboutClub: ClubsModel = ClubsModel.init(#imageLiteral(resourceName: "music"), "Music Club", "Мы не просто выступаем, а приносим настроение")
    
    private var clubsArray: [ClubsModel] = [
        ClubsModel.init(#imageLiteral(resourceName: "music"), "Music Club", "Мы не просто выступаем, а приносим настроение"),
        ClubsModel.init(#imageLiteral(resourceName: "academ"), "Academic Club", "🎓🇰🇿Academic club🎓🇰🇿(клуб «Академик») - является научным клубом на базе юридического факультета Университета им. Сулеймана Демиреля. В клуб может вступить каждый студент, независмо от специальностей."),
        ClubsModel.init(#imageLiteral(resourceName: "mmdance"), "M&M DANCE", ""),
        ClubsModel.init(#imageLiteral(resourceName: "shapagat"), "Shapagat", "Здесь вы можете обсуждать вопросы связанные с нашей деятельностью, узнавать о запланированных мероприятиях, предлагать новые идеи, критиковать и оценивать деятельность клуба.")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Clubs"
        view.backgroundColor = UIColor(red: 34/255, green: 47/255, blue: 62/255, alpha: 1)
        tableView.register(ClubsViewCell.self, forCellReuseIdentifier: "friends")
        
        tableView.separatorStyle = .none
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return clubsArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "friends", for: indexPath) as! ClubsViewCell
        
        cell.Image.image = clubsArray[indexPath.row].getImage
        cell.Name.text = clubsArray[indexPath.row].getTitle
        cell.textArea.text = clubsArray[indexPath.row].getDescription
        cell.backgroundColor = UIColor(red: 14/255, green: 27/255, blue: 42/255, alpha: 1)
        cell.layer.borderWidth = 1
        cell.Name.textColor = .white //UIColor.init(red: 40/255, green: 154/255, blue: 217/255, alpha: 1)
        cell.textArea.textColor = .white // UIColor.init(red: 40/255, green: 154/255, blue: 217/255, alpha: 1)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        infoAboutClub = clubsArray[indexPath.row]
        let controller = ClubsViewController()
        controller.infoAboutClub = self
        MainViewController.navController.show(controller, sender: self)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}
