//
//  GifuTestViewController.swift
//  GIFinTextViewPrx
//
//  Created by 이숭인 on 2022/02/04.
//

import UIKit

class GifuTestViewController: UIViewController {
    let chChatViewModel = CHChatListViewModel()
    
    lazy var tableView = UITableView().then{
        $0.dataSource = self
        $0.delegate = self
        $0.estimatedRowHeight = 10
        $0.register(GifuTestCell.self, forCellReuseIdentifier: GifuTestCell.identifier)
    }
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightGray
        
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


extension GifuTestViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.chChatViewModel.chChatData.value.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GifuTestCell.identifier, for: indexPath) as? GifuTestCell
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

extension GifuTestViewController: UITableViewDelegate{
    
}
