//
//  SecondViewController.swift
//  task8.3
//
//  Created by Islam Erlan Uulu on 2/5/23.
//

import UIKit
import SnapKit
class SecondViewController: UIViewController {
    let nextPage: UIButton = {
       let nextPage = UIButton()
        nextPage.setTitle("Next Page", for: .normal)
        nextPage.layer.cornerRadius = 25
        nextPage.layer.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        return nextPage
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.1607843137, green: 0.7137254902, blue: 0.9647058824, alpha: 1)
        view.addSubview(nextPage)
        makeCons()
    }
    
    private func makeCons(){
        nextPage.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(19)
            make.height.equalTo(60)
            make.top.equalToSuperview().offset(350)
                                 }
//        nextPage.addTarget(self, action: #selector(nextPageBTN), for: .touchUpInside)
        nextPage.addTarget(self, action: #selector(btnNext), for: .touchUpInside)
    }
    @objc func btnNext() {
        navigationController?.pushViewController(ThirdViewController(), animated: true)
    }

}
