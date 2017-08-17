//
//  TableViewController.swift
//  TableView
//
//  Created by Nitin Bhatia on 17/08/17.
//  Copyright © 2017 Nitin Bhatia. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    var item = items
    @IBOutlet weak var btnEdit: UIBarButtonItem!
    var itemsToDelete = [Int]()

    override func viewDidLoad() {
        super.viewDidLoad()
        btnEdit.target = self
        btnEdit.action = #selector(setEditView(_:))
        tableView.allowsMultipleSelectionDuringEditing = true
        navigationController?.toolbar.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return item.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = item[indexPath.row].title
       // cell.detailTextLabel?.text = (item[indexPath.row] as AnyObject).details

        return cell
    }
    
    func setEditView(_ sender: Any){
        if tableView.isEditing == true{
            
            
            navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(setEditView(_:)))
            tableView.setEditing(false, animated: true)
            navigationController?.toolbar.isHidden = true
        }else{
           
            navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(setEditView(_:)))
            tableView.setEditing(true, animated: true)
            navigationController?.toolbar.isHidden = false

        }
    }
 
    @IBAction func btnDelete(_ sender: Any) {
        for i in (tableView.indexPathsForSelectedRows as? NSArray)!{
            let x = i as! IndexPath
            itemsToDelete.append(x.row)
            
        }
        
        // sorted to delete items
        
        itemsToDelete = itemsToDelete.sorted {$0 < $1}

      
        for i in (0...itemsToDelete.count - 1 ).reversed(){
            self.item.remove(at: itemsToDelete[i])
        }
        
        itemsToDelete.removeAll()
        
        tableView.deleteRows(at: tableView.indexPathsForSelectedRows!, with: .automatic)
    }

    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
 

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
