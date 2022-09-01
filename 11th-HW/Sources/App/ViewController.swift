//
//  ViewController.swift
//  11th-HW
//
//  Created by Максим Солобоев on 01.09.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    // MARK: - Outlets
    
    private lazy var backgroundImageView: UIImageView = {
        let backgroundImage = UIImage(named: "background")
        let backGroundView = UIImageView(image: backgroundImage)
        backGroundView.translatesAutoresizingMaskIntoConstraints = false
        return backGroundView
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupLayout()
    }

    // MARK: - Setup

    private func setupHierarchy() {
        view.addSubview(backgroundImageView)
    }
    
    private func setupLayout() {
        backgroundImageView.snp.makeConstraints { make in
            make.center.equalTo(view)
            make.height.equalTo(view)
            make.width.equalTo(view)
        }
    }
    
    // MARK: - Actions
}

