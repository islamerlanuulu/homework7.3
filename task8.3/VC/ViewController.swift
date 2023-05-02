//
//  ViewController.swift
//  task8.3
//
//  Created by Islam Erlan Uulu on 2/5/23.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    private let tableView =  UITableView()
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Jl. Merah Biru Nomor 123"
        return searchBar
    }()
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("Or select via map?", for: .normal)
        button.titleLabel?.textAlignment = .center
        let color: UIColor = .systemBlue
        button.setTitleColor(color, for: .normal)
        button.backgroundColor = .white
        return button
    }()
    
    private let views: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.2011313533)
        
        return view
    }()
    
    private var list: [List] = [
    List(bigText: "ABC Company", text: "Jl. Merah Biru Nomor 123"),
    List(bigText: "PQR Company", text: "Jl. Merah Biru Nomor 456"),
    List(bigText: "XYZ Company", text: "Jl. Merah Biru Nomor 789"),
    List(bigText: "ABCD Company", text: "Jl. Merah Hijau Nomor 123"),
    List(bigText: "PQRS Company", text: "Jl. Biru Kuning Nomor 123"),
    List(bigText: "WXYZ Company", text: "Jl. Biru Hijau Nomor 123")
    ]
    
    private let buttonDone: UIButton = {
       let buttonDone = UIButton()
        buttonDone.setTitle("Done", for: .normal)
        buttonDone.layer.cornerRadius = 25
        buttonDone.layer.backgroundColor = #colorLiteral(red: 0.1821432114, green: 0.3977169991, blue: 0.7752947211, alpha: 1)
       return buttonDone
    }()
    
    private var filtrList: [List] = []
    private var isFiltr: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(buttonDone)
        view.addSubview(tableView)
        view.addSubview(searchBar)
        view.addSubview(views)
        view.addSubview(button)
        
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
        makeConstrains()
    }

    
    
    private func makeConstrains(){
        
        searchBar.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.leading.trailing.equalToSuperview().inset(19)
            make.height.equalTo(40)
        }
        button.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(searchBar.snp.bottom).offset(20)
            make.width.equalTo(180)
        }

        tableView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(button.snp.bottom)
            make.bottom.equalTo(buttonDone.snp.top).offset(-60)


        }
        buttonDone.snp.makeConstraints { make in
                    make.leading.trailing.equalToSuperview().inset(19)
                    make.height.equalTo(45)
                    make.bottom.equalTo(-100)
        }
        views.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(19)
            make.top.equalTo(button.snp.top).offset(17)
            make.height.equalTo(1)
        }
        
    }
 
}

extension ViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //list.count
        return isFiltr ? filtrList.count : list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = isFiltr ? filtrList[indexPath.row].bigText : list[indexPath.row].bigText
        cell.detailTextLabel?.text = isFiltr ? filtrList[indexPath.row].text : list[indexPath.row].text
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    
}
extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            isFiltr = false
        }else{
            isFiltr = true
            filtrList = list.filter {
                $0.text.contains(searchText)

            }
        }
        tableView.reloadData()
    }
}



struct List {
    var bigText: String
    var text: String
}
