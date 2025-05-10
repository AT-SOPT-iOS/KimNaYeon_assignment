//
//  MovieAPIViewController.swift
//  TvingClone
//
//  Created by 김나연 on 5/9/25.
//

import UIKit
import SnapKit
import Then

class MovieAPIViewController: UIViewController {
    
    // MARK: - Property
    

    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        view.self.backgroundColor = .blackT
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.tintColor = .gray1
    }
    
    // MARK: - SetStyle
    
    // MARK: - SetLayout
}
