import UIKit
import XCPlayground

class ViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource {
    lazy var tableView: UITableView = { [unowned self] in
        let tableview = UITableView(frame: self.view.frame, style: UITableViewStyle.Plain)
        tableview.delegate = self
        tableview.dataSource = self
        return tableview
    }()
    
    var items = ["Hello 1","Hello 2","Hello 3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        view.frame = CGRect(x: 0, y: 0, width: 200, height: 44 * 3)
        view.addSubview(tableView)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return items.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel?.text = "\(self.items[indexPath.row])"
        return cell
    }
}

var vc = ViewController()
vc.view
