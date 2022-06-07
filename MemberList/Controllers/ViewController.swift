//
//  ViewController.swift
//  MemberList
//
//  Created by 김영욱 on 2022/06/03.
//

import UIKit

final class ViewController: UIViewController {

    // 테이블 뷰
    private let tableView = UITableView()
    
    var memberListManager = MemberListManage()
    
    lazy var plusButton: UIBarButtonItem = {
        let button = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(plusButtonTapped))
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupDatas()
        setupTableView()
        setupNaviBar()
        setupTableViewConstraints()
    }
    // 델리게이트 패턴사용시 미리 사용됨
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//
//        tableView.reloadData()
//    }
    
    func setupNaviBar() {
        
        //네비게이션 설정 관련
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground() // 불투명으로
        appearance.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .systemBlue
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        // 네비게이션바 오른쪽 상단 버튼 설정
        self.navigationItem.rightBarButtonItem = self.plusButton
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.rowHeight = 60
        
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: "MemberCell")
    }
    
    func setupDatas() {
        memberListManager.makeMembersListDatas() // 서버에서 불러오는것처럼
    }
    
    // 테이블뷰의 오토레이아웃 설정
    func setupTableViewConstraints() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }
    
    @objc func plusButtonTapped() {
        let detailVC = DetailViewController()
        
        navigationController?.pushViewController(detailVC, animated: true)
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memberListManager.getMembersList().count
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemberCell", for: indexPath) as! MyTableViewCell
        
        cell.member = memberListManager[indexPath.row]
        cell.selectionStyle = .none
        
        return cell
    }
    
    
}


extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // 다음화면으로 넘어가는 코드
        let detailVC = DetailViewController()
        detailVC.delegate = self
        
        let array = memberListManager.getMembersList()
        detailVC.member = array[indexPath.row]
        
        navigationController?.pushViewController(detailVC, animated: true)
        
        
    }
    
    
}

extension ViewController: MemberDelegate {
    func addNewMember(_ member: Member) {
        memberListManager.makeNewMember(member)
        tableView.reloadData()
    }
    
    func update(index: Int, _ member: Member) {
        memberListManager.updateMemberInfo(index: index, member)
        tableView.reloadData()
    }
}
