//
//  CADVehicleArchivesViewController.swift
//  cheanda
//
//  Created by 何泽的mac on 2018/8/13.
//  Copyright © 2018年 车安达. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import ReusableKit
import HZSwiftLib
// MARK: -常量
fileprivate struct Metric {
    static let margin:CGFloat = 16.wr
    static let searchTop:CGFloat = 4.hr
    static let searchHeight:CGFloat = 35.hr
    static let changeTopHeight:CGFloat = 50.hr
    static let searchViewColor:UIColor = RGBA(r: 245, g: 245, b: 245, a: 0.3)
    static let tableViewTopMargin:CGFloat = 10.hr
}
class CADVehicleArchivesViewController: QDCommonViewController {
    
    lazy var tableView:UITableView = UITableView(frame: .zero, style: .plain).then{
        $0.backgroundColor = UIColor.VCBackgroundColor
        $0.register(Reusable.VehicleArchivesCell)
        $0.rowHeight = CADVehicleArchivesTableViewCell.cellHeight()
        $0.tableFooterView = UIView()
        self.view.addSubview($0)
    }
    
    let plateSearch:CADPlateSearchView = CADPlateSearchView.loadFromNib().then{
        $0.backgroundColor = Metric.searchViewColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "车辆档案"
        
        initUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func qmui_navigationBarBackgroundImage() -> UIImage? {
        return UIImage.qmui_image(with: UIColor.clear)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
}

extension CADVehicleArchivesViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        return view
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return Metric.tableViewTopMargin
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(Reusable.VehicleArchivesCell, for: indexPath)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.isUserInteractionEnabled = false
        plateSearch.searchTextField.isUserInteractionEnabled = false
        cellSelectedAtIndexPath(indexPath: indexPath)
        
    }
    
}
// MARK: UI
extension CADVehicleArchivesViewController {
    func initUI() {
        hz_changeTopViewHeight = Metric.changeTopHeight
        view.addSubview(plateSearch)
        plateSearch.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(Metric.margin)
            make.right.equalToSuperview().offset(-Metric.margin)
            make.top.equalTo(view.snp_topMargin).offset(Metric.searchTop)
            make.height.equalTo(Metric.searchHeight)
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        view.sendSubview(toBack: tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(plateSearch.snp.bottom).offset(Metric.tableViewTopMargin * 2)
            make.left.right.bottom.equalToSuperview()
        }
    }
}
// MARK: 移动cell控件
extension CADVehicleArchivesViewController{
    
    func cellSelectedAtIndexPath(indexPath:IndexPath){
        let rectInTableView:CGRect = tableView.rectForRow(at: indexPath)
        let rectInSuperview:CGRect = tableView.convert(rectInTableView, to: tableView.superview)
        let cell = tableView.cellForRow(at: indexPath) as! CADVehicleArchivesTableViewCell
        let snapshot = UIImage.qmui_image(with: cell.plateNumButton)
        cell.plateNumButton.isHidden = true
        let imageView = UIImageView(image: snapshot)
        imageView.cb_centerX = cell.cb_centerX
        imageView.cb_top = rectInSuperview.origin.y + cell.plateNumButton.cb_top
        view.addSubview(imageView)
        UIView.animate(withDuration: 0.5, animations: {
            self.hz_changeTopViewHeight = Metric.changeTopHeight + 86.hr
            imageView.qmui_top = 26.hr
            self.tableView.alpha    = 0
            self.plateSearch.alpha  = 0
        }) { (finish) in
            if finish{
                cell.plateNumButton.isHidden = false
                imageView.removeFromSuperview()
                self.tableView.isUserInteractionEnabled = true
                self.plateSearch.searchTextField.isUserInteractionEnabled = true
                self.hz_changeTopViewHeight = Metric.changeTopHeight
                self.tableView.alpha = 1
                self.plateSearch.alpha  = 1
                let details = CADVehicleArchivesDetailsViewController()
                self.navigationController?.pushViewController(details, animated: false)
            }
        }
    }
    
    
}

protocol NibLoadable { }

extension NibLoadable where Self : UIView {
    
    static func loadFromNib(_ nibNmae :String? = nil) -> Self {
        return Bundle.main.loadNibNamed(nibNmae ?? "\(self)", owner: nil, options: nil)?.first as! Self
    }
}


private enum Reusable {
    static let VehicleArchivesCell = ReusableCell<CADVehicleArchivesTableViewCell>(nibName: "CADVehicleArchivesTableViewCell")
}

