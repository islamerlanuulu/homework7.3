//
//  ThirdViewController.swift
//  task8.3
//
//  Created by Islam Erlan Uulu on 2/5/23.
//

import UIKit

class ThirdViewController: UIViewController {
   private let lbl:UILabel = {
      let lbl = UILabel()
        lbl.text = "Coming Soon..."
        lbl.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        lbl.font = UIFont(name: "Helvetica Neue", size: 28)
        
        
        
     return lbl
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        view.addSubview(lbl)
        
        const()
        
    }
    
    private func const(){
        
        lbl.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(350)
            make.centerX.equalToSuperview()
            
        }
        
        
    }


}
