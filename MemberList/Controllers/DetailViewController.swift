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
        if member == nil {
            // 입력이 안되어 있다면 빈문자열로 저장
            let name = detailView.nameTextField.text ?? ""
            let age = Int(detailView.ageTextField.text ?? "")
            let phoneNumber = detailView.phoneNumberTextField.text ?? ""
            let address = detailView.addressTextField.text ?? ""
            
            // 새로운 구조체 생성
            var newMember = Member(name: name, age: age, phone: phoneNumber, address: address)
            newMember.memberImage = detailView.mainImageVeiw.image
            
            // 1) 델리게이트 방식이 아닌 구현
            let index = navigationController!.viewControllers.count - 2
            // 전 화면에 접근하기 위함
            let vc = navigationController?.viewControllers[index] as! ViewController
            // 전화면의 모델에 접근해서 멤버를 추가
            vc.memberListManager.makeNewMember(newMember)
            
            // 2) 델리게이트 방식으로 구현
            
        // 멤버가 있다면
        } else {
            // 이미지뷰에 있는 것을 그대로 다시 멤버에 저장
            member!.memberImage = detailView.mainImageVeiw.image
            
            let memberId = Int(detailView.memberIdTextField.text!) ?? 0
            member!.name = detailView.nameTextField.text ?? ""
            member!.age = Int(detailView.ageTextField.text ?? "") ?? 0
            member!.phone = detailView.phoneNumberTextField.text ?? ""
            member!.address = detailView.addressTextField.text ?? ""
            
            // 뷰에도 바뀐 멤버를 전달
            detailView.member = member
            
            // 1) 델리게이트 방식이 아닌 구현
            let index = navigationController!.viewControllers.count - 2
            // 전 화면에 접근하기 위함
            let vc = navigationController?.viewControllers[index] as! ViewController
            // 전화면의 모델에 접근해서 멤버를 추가
            vc.memberListManager.updateMemberInfo(index: memberId, member!)
            
            // 2) 델리게이트 방식
            //delegate?.update(index: memberId, member!)
        }
     
        // 전 화면으로 돌아가기
        self.navigationController?.popViewController(animated: true)
        
    }

}
