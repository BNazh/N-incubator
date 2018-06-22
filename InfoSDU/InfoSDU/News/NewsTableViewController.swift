//
//  NewsTableViewController.swift
//  InfoSDU
//
//  Created by Babakhanov Nazhmeddin on 23.02.2018.
//  Copyright © 2018 Nolan. All rights reserved.
//

import UIKit


protocol DataToSend {
    var news: NewsModel { get }
}

class NewsTableViewController: UITableViewController, DataToSend {
    
    var news = NewsModel.init(UIImage(named: "stars_sky_space_car_113629_3840x2160")!, "Qwerty", "Qwert tyuio asdfgh xcvbnm jkl")
    
    private var newsArray: [NewsModel] = [
        NewsModel.init(UIImage(named: "news4")!, "SPT 2018", "Қымбатты SPT 2018 олимпиадасының қатысушылары!\nСіздердің назарларыңызға!\nҚұжаттарын онлайн тіркеп үлгерген оқушылардың барлығына ертең сағат 17.00-ге дейін ID карта (рұқсат қағазы) жіберілетін болады.\nАл тест орталықтарының нақты мекенжайы ертең сағат 21.00-де ресми сайтымызда (sdu.edu.kz) жарияланатын болады.\nСіздерге сәттілік тілейміз!"),
        NewsModel.init(UIImage(named: "news2")!, "InfoMatrix", "В СДУ прошел международный конкурс компьютерных проектов. Конкурс прошел при поддержке Министерства Образования и науки РК, совместно с научно-практическим центром 'Дарын'.\n\nInfoMatrix - это международный конкурс компьютерных проектов, родившийся от желания объединить лучших в мире студентов в области информационных технологий. Конкурс - это не просто продвижение профессионального мастерства; Он также способствует развитию межкультурного диалога и сотрудничества посредством участия студентов и преподавателей из разных стран."),
        NewsModel.init(UIImage(named: "news3")!, "Grant", "Делегация СДУ во главе с ректором вуза провела брифинг для представителей региональных и республиканских средств массовой информации в региональной службе коммуникаций Алматинской области. Мероприятие организовано при поддержке Управления внутренней политики акимата Алматинской области.\nВ работе брифинга приняли участие ректор СДУ Канат Кожахмет, руководитель департамента PR и маркетинга Омарбек Нурбавлиев и прошлогодняя обладательница 100% гранта СДУ - Аяжан Мурат, которая ныне является студенткой 1-курса специальности «Юриспруденция». В рамках мероприятия представителям СМИ сделана презентация о предстоящей интеллектуальной олимпиаде SPT, которая состоится 4 марта в 19 городах страны. "),
        NewsModel.init(UIImage(named: "news1")!, "SPT 2018", "Регистрация на внутреннюю олимпиаду СДУ 'SPT 2018' объявляется официально открытой!\nSPT будет проходить по 6-кластерам в зависимости от выбранного предмета: физика, география, химия-биология, английский язык, литература и история. Дополнительно, в каждом кластере будут вопросы по общепрофильным предметам. Олимпиада проходит только для выпускников школ и колледжей текущего года.\nОнлайн регистрацию можно пройти на официальном сайте sdu.edu.kz\nУчаствуй и выиграй внутренний грант СДУ на любую специальность. ")
        
    ]


    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(NewsTableViewCell.self, forCellReuseIdentifier: "newsCell")
        tableView.separatorStyle = .none
        view.backgroundColor = UIColor(red: 34/255, green: 47/255, blue: 62/255, alpha: 1)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! NewsTableViewCell
        
        cell.newsImage.image = newsArray[indexPath.row].Image
        cell.titleOfNews.text = newsArray[indexPath.row].Title
        cell.comments.text = newsArray[indexPath.row].Description
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        news = newsArray[indexPath.row]
        let controller = NewsViewController()
        controller.dataFromCell = self
        MainViewController.navController.show(controller, sender: self)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
 
}
