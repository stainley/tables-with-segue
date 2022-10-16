//
//  StudentInfoViewController.swift
//  TableExample
//
//  Created by Stainley A Lebron R on 10/15/22.
//

import UIKit

class StudentInfoViewController: UIViewController {
    
    private var students: [String: [String]]!
    
    @IBOutlet var tableView: UITableView!
    
    
    struct StudentsObject {
        var sectionName: String!
        var sectionRows: [String]!
        
    }
    
    private var studentsObj = [StudentsObject]()
    
    override func performSegue(withIdentifier identifier: String, sender: Any?) {
        if identifier == "studentTable" {
            students = sender as? [String: [String]]
        }
    }
    
    override func viewDidLoad() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        for (key, value) in students {
            studentsObj.append(StudentsObject(sectionName: key, sectionRows: value))
        }
    }
}


extension StudentInfoViewController: UITableViewDelegate {
    
}


extension StudentInfoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return studentsObj[section].sectionRows.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return studentsObj[section].sectionName
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // number of sections
        return students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier:  "studentRow", for: indexPath)
        
        var contentConfiguration = UIListContentConfiguration.cell()
        
        print("\(studentsObj[indexPath.section].sectionRows[indexPath.row])")
        contentConfiguration.text = studentsObj[indexPath.section].sectionRows[indexPath.row]
        cell.contentConfiguration = contentConfiguration
        
        return cell
    }
 
    
    
}
