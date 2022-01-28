//
//  TableViewExampleViewController.swift
//  TestProj2
//
//  Created by 이숭인 on 2022/01/20.
//

import UIKit
import FlexLayout
import PinLayout
import Then


struct Method {
    let name: String
    let description: String
}

class TableViewExampleViewController: UIViewController {
    //MARK: - Properties
    private var methods: [Method] = [
        Method(name: "direction(_: Direction)", description: "The direction property establishes the main-axis, thus defining the direction flex items are placed in the flex container container container."),
        
        Method(name: "wrap(_: Wrap)", description: "The `wrap` property controls whether the flex container is single-lined or multi-lined, and the direction of the cross-axis, which determines the direction in which the new lines are stacked in.\n\nBy default, the flex container fits all flex items into one line. Using this property we can change that. We can tell the container to lay out its items in single or multiple lines, and the direction the new lines are stacked in."),

        Method(name: "justifyContent(_: JustifyContent)", description: "The `justifyContent` property defines the alignment along the main-axis of the current line of the flex container. It helps distribute extra free space leftover when either all the flex items on a line have reached their maximum size. "),
        
        Method(name: "alignItems(_: AlignItems)", description: "The `alignItems` property defines how flex items are laid out along the cross axis on the current line. Similar to `justifyContent` but for the cross-axis (perpendicular to the main-axis)."),
        
        Method(name: "alignSelf(_: AlignSelf)", description: "The `alignSelf` property controls how a child aligns in the cross direction, overriding the `alignItems` of the parent. For example, if children are flowing vertically, `alignSelf` will control how the flex item will align horizontally.\n\n The \"auto\" value means use the flex container `alignItems` property. See `alignItems` for documentation of the other values."),
        
        Method(name: "alignContent(_: AlignContent)", description: "The align-content property aligns a flex container’s lines within the flex container when there is extra space in the cross-axis, similar to how justifyContent aligns individual items within the main-axis.\n\nNote, alignContent has no effect when the flexbox has only a single line."),
        
        Method(name: "layoutDirection(_: LayoutDirection)", description: "The layoutDirection property controls the flex container layout direction.\n\nValues:\n-`.inherit`\n  Direction defaults to Inherit on all nodes except the root which defaults to LTR. It is up to you to detect the user’s preferred direction (most platforms have a standard way of doing this) and setting this direction on the root of your layout tree.\n-.ltr: Layout views from left to right. (Default)\n-.rtl: Layout views from right to left.")
    ]
    
    //MARK: - UI Components
    private lazy var tableView = UITableView().then{
        $0.delegate = self
        $0.dataSource = self
        $0.estimatedRowHeight = 10
        $0.register(MethodCell.self, forCellReuseIdentifier: MethodCell.reuseIdentifier)
        $0.register(MethodGroupHeaderView.self, forHeaderFooterViewReuseIdentifier: MethodGroupHeaderView.identifier)
    }
    
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setUI()
    }
    
    //MARK: - Functions
    func setUI(){
        self.view.addSubview(tableView)
        
    }
}


//MARK: - UITableViewDelegate extension
extension TableViewExampleViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return methods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MethodCell.reuseIdentifier, for: indexPath) as? MethodCell else {
            return UITableViewCell()
        }
        
        cell.configure(method: methods[indexPath.row])
        print("adsdd")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return MethodGroupHeaderView.height
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: MethodGroupHeaderView.identifier) as? MethodGroupHeaderView else {
            return UIView()
        }
        
        header.configure(title: "Flex Container methods")
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
