//
//  ViewController.swift
//  editViewTable
//
//  Created by HSIN-HUNG WU on 2018/3/20.
//  Copyright © 2018年 HSIN-HUNG WU. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{

    

    @IBOutlet var MyTableView: UITableView!
    @IBOutlet var textBall: UITextField!
    @IBOutlet var labelBall: UILabel!
    var balls:NSMutableArray = ["籃球","足球","棒球","其他"]
    @IBAction func insert(_ sender: UIButton) {
        balls.add(textBall.text as Any)
        MyTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.delete
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return balls.count
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        balls.removeObject(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = MyTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = balls[indexPath.row] as? String
        return cell
    }
    
    @IBAction func valueChanged(_ sender: UISwitch) {
        if sender.isOn{
            self.MyTableView.isEditing = true
        } else {
            self.MyTableView.isEditing = false
            
        }
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        balls.exchangeObject(at: sourceIndexPath.row, withObjectAt: destinationIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let choice:String = balls[indexPath.row] as! String
        labelBall.text = "最喜歡的球類：\(choice)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

