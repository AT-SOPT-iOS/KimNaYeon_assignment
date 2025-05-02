//
//  HomeViewController.swift
//  TvingClone
//
//  Created by 김나연 on 5/2/25.
//

import UIKit

class HomeViewController: UIViewController {
    private lazy var whatIsYourNameImageView = UIImageView().then{
        $0.image = UIImage(named: "WYN")
    }
    private lazy var todayTvingTOPLabel = UILabel().then{
        $0.text = "오늘의 티빙 TOP 20"
        $0.font = UIFont(name: "Pretendard-Bold", size: 15)
        $0.textColor = .whiteT
        $0.textAlignment = .left
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.self.backgroundColor = .blackT
        // Do any additional setup after loading the view.
    }
}
