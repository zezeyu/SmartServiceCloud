//
//  CADVehicleArchivesDetailsViewController.swift
//  cheanda
//
//  Created by 何泽的mac on 2018/8/16.
//  Copyright © 2018年 车安达. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import ReusableKit
import SnapKit

///全屏宽
public let kScreenWidth = UIScreen.main.bounds.width
///全屏高
public let kScreenHeight = UIScreen.main.bounds.height
// MARK: -常量
fileprivate struct Metric {
    static let changeTopHeight:CGFloat = 136.hr
    static let margin:CGFloat = 16.wr
    static let headerHeight:CGFloat = 48.hr
}
// MARK:- 复用
private enum Reusable {
    static let addInsuranceCell = ReusableCell<CADAddInsuranceTableViewCell>(nibName: "CADAddInsuranceTableViewCell")
    static let InformationCell = ReusableCell<CADInfoInsureTableViewCell>(nibName: "CADInfoInsureTableViewCell")
    static let vehicleInfoCell  = ReusableCell<CADVehicleInfoTableViewCell>(nibName: "CADVehicleInfoTableViewCell")
}

class CADVehicleArchivesDetailsViewController: QDCommonViewController {
    
    var vmModel = CADVehicleDetailsViewModel()
    
    lazy var plateNumButton = QMUIButton().then{
        self.view.addSubview($0)
        $0.isUserInteractionEnabled = false
        $0.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp_topMargin).offset(23.hr)
            make.width.equalTo(120)
            make.height.equalTo(46)
            make.centerX.equalToSuperview()
        }
        $0.setBackgroundImage(UIImage(named: "vehicle_yellowPlate"), for: .normal)
        $0.textColorc(normalColor: UIColor.black3)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 22)
    }
    
    lazy var vehicleTypeNameLabel = UILabel(color: UIColor.white, fontSize: 15.wr, isBold: false).then{
        $0.alpha = 0
        self.view.addSubview($0)
        $0.snp.makeConstraints{ (make) in
            make.top.equalTo(self.plateNumButton.snp.bottom).offset(9.hr)
            make.centerX.equalToSuperview()
        }
    }
    
    lazy var companyNameLabel = UILabel(color: UIColor.white, fontSize: 13.wr, isBold: false).then{
        $0.alpha = 0
        self.view.addSubview($0)
        $0.snp.makeConstraints { (make) in
            make.top.equalTo(self.vehicleTypeNameLabel.snp.bottom).offset(16.hr)
            make.centerX.equalToSuperview()
        }
    }
    
    lazy var tableView:UITableView = UITableView(frame: .zero, style: .plain).then{
        $0.register(Reusable.addInsuranceCell)
        $0.register(Reusable.InformationCell)
        $0.register(Reusable.vehicleInfoCell)
        $0.alpha = 0
        $0.tableFooterView = UIView()
        $0.backgroundColor = .white
        $0.separatorStyle = .none
        self.view.addSubview($0)
        $0.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(Metric.changeTopHeight)
            make.bottom.left.right.equalToSuperview()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "车辆详情"
        bindUI()
        initUI()
    }
    
    override func qmui_navigationBarBackgroundImage() -> UIImage? {
        return UIImage.qmui_image(with: UIColor.clear)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
// MARK:- 初始化UI
extension CADVehicleArchivesDetailsViewController {
    
    // MARK:- 初始化视图
    func initUI() {
        plateNumButton.textc(normalText: "鄂A·32812")
        vehicleTypeNameLabel.text = "班线客运"
        companyNameLabel.text = "武汉市欣欣向荣运输有限公司"
        self.hz_changeTopViewHeight = Metric.changeTopHeight
        tableView.delegate = self
        tableView.dataSource = self
        
        UIView.animate(withDuration: 0.5, animations: {
            self.vehicleTypeNameLabel.alpha = 1
            self.companyNameLabel.alpha = 1
            self.tableView.alpha = 1
        }) { (finish) in
        }
        
    }
    
    func bindUI(){
        vmModel.load_data(success: { (model) in
            
        })
    }
}
// MARK:- 代理
extension CADVehicleArchivesDetailsViewController:UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return CADAddInsuranceTableViewCell.cellHeight()
        }else if indexPath.section == 1 {
            return CADVehicleInfoTableViewCell.cellHeight()
        }else if indexPath.section == 2 {
            return CADVehicleInfoTableViewCell.cellHeight()
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: Metric.headerHeight))
        view.backgroundColor = .white
        view.addLine(position: .CBLineTop, width: kScreenWidth)
        view.addLine(position: .CBLineBottom, width: kScreenWidth - Metric.margin * 2,leftMargin: Metric.margin)
        if section == 0 {
            _ = UILabel(color: .MainColor, fontSize: 16.wr, isBold: false).then{
                view.addSubview($0)
                $0.text = "保险信息"
                $0.snp.makeConstraints({ (make) in
                    make.left.equalToSuperview().offset(Metric.margin)
                    make.centerY.equalToSuperview()
                })
                _ = UIButton(text: "查看全部", color: .gray204, fontSize: 15.wr).then{
                    view.addSubview($0)
                    $0.snp.makeConstraints({ (make) in
                        make.right.equalToSuperview().offset(-Metric.margin)
                        make.centerY.equalToSuperview()
                    })
                    }.rx.tap.subscribe(onNext: { (sender) in
                    //点击事件

                    }).disposed(by: DisposeBag())
            }
        }
        if section == 1 {
            _ = CADVehicleDetailsHeadView.loadFromNib().then{
                $0.button1.tag = 10
                $0.button2.tag = 11
                $0.button3.tag = 12
                $0.tag = 88
                $0.frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: Metric.headerHeight-1)
                view.addSubview($0)
                $0.blockButtonAction = {(tag: Int) -> Void in  // 13  14  15
                    self.vmModel.data?.section2ButtonIndex = tag
                }
                $0.model = vmModel.data
            }
        }
        if section == 2 {
            _ = CADVehicleDetailsHeadView.loadFromNib().then{
                $0.button1.tag = 13
                $0.button2.tag = 14
                $0.button3.tag = 15
                $0.tag = 89
                $0.frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: Metric.headerHeight-1)
                view.addSubview($0)
                $0.button1.textc(normalText: "车身信息")
                $0.button2.textc(normalText: "DVR信息")
                $0.button3.textc(normalText: "其他信息")
                $0.blockButtonAction = {(tag: Int) -> Void in  // 13  14  15
                    self.vmModel.data?.section3ButtonIndex = tag
                }
                $0.model = vmModel.data
            }
        }
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return Metric.headerHeight
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else if section == 1 {
            return 5
        }else if section == 2 {
            return 5
        }
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeue(Reusable.addInsuranceCell, for: indexPath)
            return cell
        }else if indexPath.section == 1 {
            let cell = tableView.dequeue(Reusable.vehicleInfoCell, for: indexPath)
            return cell
        }else{
            let cell = tableView.dequeue(Reusable.vehicleInfoCell, for: indexPath)
            return cell
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

