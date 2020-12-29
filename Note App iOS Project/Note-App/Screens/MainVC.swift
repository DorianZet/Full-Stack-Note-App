//
//  MainVC.swift
//  Note-App
//
//  Created by Mateusz Zacharski on 24/12/2020.
//

import UIKit

class MainVC: UIViewController {
    
    // MARK: - Initializations
    
    let tableView = UITableView()
    var notesArray = [Note]()
    
    // MARK: - Lifecycle Hooks
    
    override func viewWillAppear(_ animated: Bool) {
        APIFunctions.functions.fetchNotes(for: self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        APIFunctions.functions.fetchNotes(for: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Notes"
        
        APIFunctions.functions.delegate = self
        APIFunctions.functions.fetchNotes(for: self)
        
        configureBarButtonItems()
        configureTableView()
    }
    
    func configureBarButtonItems() {
        let addNoteButton = UIBarButtonItem(title: "Add note", style: .plain, target: self, action: #selector(tapAddNoteButton))
        navigationItem.rightBarButtonItem = addNoteButton
    }
    
    @objc func tapAddNoteButton() {
        let detailVC = DetailVC()
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.frame = view.bounds // fill up the whole view with our table view.
        tableView.delegate = self // our VC now "listens" to the tableView and acts upon the changes in it
        tableView.dataSource = self // our VC now provides the data for the tableView (the var 'favorites' property.)
        tableView.register(NoteCell.self, forCellReuseIdentifier: "cell") // registering the cell we want.
    }
}

// MARK: - Table View Delegates

extension MainVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NoteCell
        cell.titleLabel.text = notesArray[indexPath.row].title
        cell.noteLabel.text = notesArray[indexPath.row].note
        cell.dateLabel.text = notesArray[indexPath.row].date
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailVC()
        detailVC.note = notesArray[indexPath.row]
        detailVC.isUpdating = true
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

// MARK: - Custom Delegates

extension MainVC: DataDelegate {
    func updateArray(newArray: String) {
        let decoder = JSONDecoder()
        do {
            let newNotesArray = try decoder.decode([Note].self, from: newArray.data(using: .utf8)!)
            
            notesArray = []
            for eachNote in newNotesArray {
                let newNote = Note(title: eachNote.title.modifyJSONStringToString(), date: eachNote.date, _id: eachNote._id, note: eachNote.note.modifyJSONStringToString())
                notesArray.append(newNote)
            }
            
            print(notesArray)
        } catch {
            print(error.localizedDescription)
            print("Failed to decode!")
        }
        
        self.tableView.reloadData()
    }
}
