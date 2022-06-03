//
//  DetailViewController.swift
//  MemberList
//
//  Created by 김영욱 on 2022/06/03.
//

import UIKit

final class DetailViewController: UIViewController {
    
    private let detailView = DetailView()
    
    var member: Member?
    
    override func loadView() {
        view = detailView
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        setupData()
        seteupButtonAction()
        
    }
    
    private func setupData() {
        detailView.member = member
    }

    func seteupButtonAction() {
        detailView.saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }
    
    @objc func saveButtonTapped() {
        
    }

}
