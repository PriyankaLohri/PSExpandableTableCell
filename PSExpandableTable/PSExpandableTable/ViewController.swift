
import UIKit

let KTableCellID = "ExpandableCellID"
var selectedRowIndex = -1

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var expandableTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
    }
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: KTableCellID)
        let label:UILabel = cell?.viewWithTag(1111) as! UILabel
        label.text = "Table Cell \(indexPath.row)"
        cell?.backgroundColor = UIColor.green

        if selectedRowIndex == indexPath.row {
            cell?.backgroundColor = UIColor.blue
            label.text = "Table Cell \(indexPath.row) expanded"

        } else {
            cell?.backgroundColor = UIColor.green
            label.text = "Table Cell \(indexPath.row) collapsed"


        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == selectedRowIndex {
            return 150 //Expanded
        }
        return 40 //Not expanded
    }
    
    func tableView(_ : UITableView, didSelectRowAt indexPath: IndexPath) {
        if selectedRowIndex == indexPath.row {
            selectedRowIndex = -1
            
        } else {
            selectedRowIndex = indexPath.row
        }
     //   self.expandableTable.reloadRows(at: [indexPath], with: .automatic)
        let range = NSMakeRange(0, self.expandableTable.numberOfSections)
        let sections = NSIndexSet(indexesIn: range)
        self.expandableTable.reloadSections(sections as IndexSet, with: .automatic)
        
    }


}

