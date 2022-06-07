//
//  Member.swift
//  MemberList
//
//  Created by 김영욱 on 2022/06/03.
//

import UIKit


protocol MemberDelegate: AnyObject { // 클래스에서만 선언가능
    func addNewMember(_ member: Member)
    func update(index: Int, _ member: Member)
}


struct Member {
    
    lazy var memberImage: UIImage? = {
        // 이름이 없다면, 시스템 사람이미지 셋팅
        guard let name = name else {
            return UIImage(systemName: "person")
        }
        
        // 해당이름으로된 이미지가 없다면, 시스템 사람이미지 셋팅
        return UIImage(named: "\(name).png") ?? UIImage(systemName: "person")
        
    }()
    
    // 멤버의 절대적 순서를 위한 타입 저장 속성
    static var memberNumbers: Int = 0
    
    let memberId: Int
    var name: String?
    var age: Int?
    var phone: String?
    var address: String?
    
    init(name: String?, age: Int?, phone: String?, address: String?) {
        
        // 0 일떄는 0, 0이 아닐때는 타입저장속성의 절대적 값을 셋팅
        self.memberId = Member.memberNumbers
        
        self.name = name
        self.age = age
        self.phone = phone
        self.address = address
        
        // 멤버를 생성한다면, 항상 타입 저장속성의 값을 +1 을 한다
        Member.memberNumbers += 1
        
    }
    
}
