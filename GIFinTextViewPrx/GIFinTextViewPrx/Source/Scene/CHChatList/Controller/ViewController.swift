//
//  ViewController.swift
//  GIFinTextViewPrx
//
//  Created by 이숭인 on 2022/01/26.
//

import UIKit
import SnapKit
import Then
import FlexLayout
import PinLayout

//https://github.com/GetStream/Streamoji/blob/main/meta/emojis/let_me_in.gif?raw=true

class ViewController: UIViewController {
    //MARK: - Properties
    let chChatViewModel = CHChatListViewModel()
    
    //MARK: - UI Components
    lazy var tableView = UITableView().then{
        $0.dataSource = self
        $0.delegate = self
        $0.estimatedRowHeight = 10
        $0.register(MessageCell.self, forCellReuseIdentifier: MessageCell.identifier)
    }
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        setBind()
        setUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        chChatViewModel.loadCHChatData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        layout()
    }
    
    //MARK: - Functions
    func layout(){
        self.tableView.pin.all(self.view.safeAreaInsets)
        self.tableView.flex.layout()
    }
    
    func setBind(){
        self.chChatViewModel.chChatData.bind { test in
//            print("chChatViewModel chChatData binding")
        }
    }
    
    func setUI(){
        self.view.addSubview(tableView)
    }
}


extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.chChatViewModel.chChatData.value.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MessageCell.identifier, for: indexPath) as? MessageCell
        else{
            return UITableViewCell()
        }

        cell.configure(chChatData: self.chChatViewModel.chChatData.value[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension ViewController: UITableViewDelegate{
    
}
