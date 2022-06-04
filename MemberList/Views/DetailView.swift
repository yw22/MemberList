//
//  DetailView.swift
//  MemberList
//
//  Created by 김영욱 on 2022/06/03.
//

import UIKit

class DetailView: UIView {
        
    var member: Member? {
        didSet {
            guard var member = member else {
                // 멤버가 없으면 버튼을 "Save"라고 셋팅
                saveButton.setTitle("SAVE", for: .normal)
                // 멤버가 없으면, 타입 저장 속성의 현재 숫자 가져오기
                memberIdTextField.text = "\(Member.memberNumbers)"
                return
            }
            // 멤버가 있으면
            mainImageVeiw.image = member.memberImage
            memberIdTextField.text = "\(member.memberId)"
            nameTextField.text = member.name
            phoneNumberTextField.text = member.phone
            addressTextField.text = member.address
            
            // 나이항목
//            guard let age = member.age else {
//                // 나이 항목이 없으면 빈문자열로 표시
//                ageTextField.text = ""
//                return
//            }
//            // 나이 항목이 있으면 정수 -> 문자열 변환 표기
//            ageTextField.text = "\(age)"
//            
            // 나이항목의 구현
            ageTextField.text = member.age != nil ? "\(member.age!)" : ""
        }
    }
    
    
    
    
    
    // MARK: - UI구현
    
    let mainImageVeiw: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .lightGray
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 75
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var imageContainView: UIView = {
        let view = UIView()
        view.addSubview(mainImageVeiw)
        //        view.backgroundColor = .yellow
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let memberIdLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.text = "멤버번호 : "
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let memberIdTextField: UITextField = {
        let tf = UITextField()
        tf.frame.size.height = 22
        tf.borderStyle = .roundedRect
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.clearsOnBeginEditing = false
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    lazy var memberIdStackView: UIStackView = {
        let stview = UIStackView(arrangedSubviews: [memberIdLabel, memberIdTextField])
        stview.spacing = 5
        stview.axis = .horizontal
        stview.distribution = .fill
        stview.alignment = .fill
        stview.translatesAutoresizingMaskIntoConstraints = false
        return stview
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.text = "이       름 : "
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let nameTextField: UITextField = {
        let tf = UITextField()
        tf.frame.size.height = 22
        tf.borderStyle = .roundedRect
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.clearsOnBeginEditing = false
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    lazy var nameStackView: UIStackView = {
        let stview = UIStackView(arrangedSubviews: [nameLabel, nameTextField])
        stview.spacing = 5
        stview.axis = .horizontal
        stview.distribution = .fill
        stview.alignment = .fill
        stview.translatesAutoresizingMaskIntoConstraints = false
        return stview
    }()
    
    let ageLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.text = "나       이 : "
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let ageTextField: UITextField = {
        let tf = UITextField()
        tf.frame.size.height = 22
        tf.borderStyle = .roundedRect
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.clearsOnBeginEditing = false
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    lazy var ageStackVeiw: UIStackView = {
        let stview = UIStackView(arrangedSubviews: [ageLabel, ageTextField])
        stview.spacing = 5
        stview.axis = .horizontal
        stview.distribution = .fill
        stview.alignment = .fill
        stview.translatesAutoresizingMaskIntoConstraints = false
        return stview
    }()
    
    let phoneNumberLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.text = "전화번호 : "
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let phoneNumberTextField: UITextField = {
        let tf = UITextField()
        tf.frame.size.height = 22
        tf.borderStyle = .roundedRect
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.clearsOnBeginEditing = false
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    lazy var phoneNumberStackVeiw: UIStackView = {
        let stview = UIStackView(arrangedSubviews: [phoneNumberLabel, phoneNumberTextField])
        stview.spacing = 5
        stview.axis = .horizontal
        stview.distribution = .fill
        stview.alignment = .fill
        stview.translatesAutoresizingMaskIntoConstraints = false
        return stview
    }()
    
    let addressLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.text = "주       소 : "
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let addressTextField: UITextField = {
        let tf = UITextField()
        tf.frame.size.height = 22
        tf.borderStyle = .roundedRect
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.clearsOnBeginEditing = false
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    lazy var addressStackVeiw: UIStackView = {
        let stview = UIStackView(arrangedSubviews: [addressLabel, addressTextField])
        stview.spacing = 5
        stview.axis = .horizontal
        stview.distribution = .fill
        stview.alignment = .fill
        stview.translatesAutoresizingMaskIntoConstraints = false
        return stview
    }()
    
    let saveButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .systemBlue
        button.setTitle("UPDATE", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.frame.size.height = 40
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var stackView: UIStackView = {
       let stview = UIStackView(arrangedSubviews: [imageContainView, memberIdStackView, nameStackView, ageStackVeiw, phoneNumberStackVeiw, addressStackVeiw, saveButton])
        stview.spacing = 10
        stview.axis = .vertical
        stview.distribution = .fill
        stview.alignment = .fill
        stview.translatesAutoresizingMaskIntoConstraints = false
        return stview
    }()
    
    // 레이블 넓이 저장을 위한 속성
    let labelWidth: CGFloat = 70
    // 애니메이션을 위한 속성 선언
    var stackViewTopConstraint: NSLayoutConstraint!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupStackView() {
        self.addSubview(stackView)
    }
    
    override func updateConstraints() {
        setConstraints()
        super.updateConstraints()
        
    }
    
    func setConstraints() {
        
        NSLayoutConstraint.activate([
            mainImageVeiw.heightAnchor.constraint(equalToConstant: 150),
            mainImageVeiw.widthAnchor.constraint(equalToConstant: 150),
            mainImageVeiw.centerYAnchor.constraint(equalTo: imageContainView.centerYAnchor),
            mainImageVeiw.centerXAnchor.constraint(equalTo: imageContainView.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            imageContainView.heightAnchor.constraint(equalToConstant: 180)
        ])
        
        NSLayoutConstraint.activate([
            memberIdLabel.widthAnchor.constraint(equalToConstant: labelWidth),
            nameLabel.widthAnchor.constraint(equalToConstant: labelWidth),
            ageLabel.widthAnchor.constraint(equalToConstant: labelWidth),
            phoneNumberLabel.widthAnchor.constraint(equalToConstant: labelWidth),
            addressLabel.widthAnchor.constraint(equalToConstant: labelWidth)
        ])
        
        stackViewTopConstraint = stackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10)
        
        NSLayoutConstraint.activate([
            stackViewTopConstraint,
            stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
    }
}

