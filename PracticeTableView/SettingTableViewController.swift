//
//  SettingTableViewController.swift
//  PracticeTableView
//
//  Created by YJ on 5/23/24.
//

import UIKit

class SettingTableViewController: UITableViewController {
    
    var header = ["전체 설정", "개인 설정", "기타"]
    
    var entireSetting = ["공지사항", "실험실", "버전 정보"]
    var personalSetting = ["개인/보안", "알림", "채팅", "멀티프로필"]
    var etc = ["고객센터/도움말"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "설정"
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return header.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return header[section]
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.textColor = UIColor.lightGray
        header.textLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        header.textLabel?.frame = header.bounds
        header.textLabel?.textAlignment = .left
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return entireSetting.count
        } else if section == 1 {
            return personalSetting.count
        } else {
            return etc.count
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell")!
        
        if indexPath.section == 0 {
            cell.textLabel?.text = entireSetting[indexPath.row]
            cell.textLabel?.textColor = UIColor.label
            cell.textLabel?.font = .systemFont(ofSize: 14)
        } else if indexPath.section == 1 {
            cell.textLabel?.text = personalSetting[indexPath.row]
            cell.textLabel?.textColor = UIColor.label
            cell.textLabel?.font = .systemFont(ofSize: 14)
        } else {
            cell.textLabel?.text = etc[indexPath.row]
            cell.textLabel?.textColor = UIColor.label
            cell.textLabel?.font = .systemFont(ofSize: 14)
        }
        return cell
    }
}
