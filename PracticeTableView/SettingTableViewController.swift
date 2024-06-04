//
//  SettingTableViewController.swift
//  PracticeTableView
//
//  Created by YJ on 5/23/24.
//

import UIKit

enum Setting: Int, CaseIterable {
    case entireSetting
    case personalSetting
    case etc
    
    var mainOption: String {
        switch self {
        case.entireSetting:
            return "전체 설정"
        case.personalSetting:
            return "개인 설정"
        case.etc:
            return "기타"
            
        }
    }
    
    var optionString: [String] {
        switch self {
        case.entireSetting:
            return ["공지사항", "실험실", "버전 정보"]
        case.personalSetting:
            return ["개인/보안", "알림", "채팅", "멀티프로필"]
        case.etc:
            return ["고객센터/도움말"]
        }
    }
}

class SettingTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "설정"
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return Setting.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Setting.allCases[section].mainOption
        
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.textColor = UIColor.lightGray
        header.textLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        header.textLabel?.frame = header.bounds
        header.textLabel?.textAlignment = .left
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Setting.allCases[section].optionString.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell")!

        cell.textLabel?.text = Setting.allCases[indexPath.section].optionString[indexPath.row]
        cell.textLabel?.textColor = UIColor.label
        cell.textLabel?.font = .systemFont(ofSize: 14)
        return cell
    }
}
