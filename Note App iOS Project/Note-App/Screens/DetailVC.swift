//
//  DetailVC.swift
//  Note-App
//
//  Created by Mateusz Zacharski on 24/12/2020.
//

import UIKit

class DetailVC: UIViewController {
    
    // MARK: - Initializations
    var saveButton: UIBarButtonItem!
    var deleteButton: UIBarButtonItem!
    
    var textField = UITextField()
    var textView = UITextView()
    
    var note: Note?
    var isUpdating = false
    
    // MARK: - Lifecycle Hooks
    
    override func viewWillAppear(_ animated: Bool) {
        if isUpdating == false {
            deleteButton.isEnabled = false
            deleteButton.title = ""
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setTitle()
        configureBarButtonItems()
        configureTextField()
        configureTextView()
    }
    
    // MARK: - UI Buttons
    
    func configureBarButtonItems() {
        saveButton = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(tapSaveButton))
        
        deleteButton = UIBarButtonItem(title: "Delete", style: .done, target: self, action: #selector(tapDeleteButton))
        deleteButton.tintColor = .systemRed
        
        navigationItem.rightBarButtonItems = [saveButton, deleteButton]
    }
    
    @objc func tapSaveButton() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.string(from: Date())

        if isUpdating == true {
            APIFunctions.functions.updateNote(date: date, title: textField.text!.modifyStringToJSONString(), note: textView.text.modifyStringToJSONString(), id: note!._id)
            navigationController?.popViewController(animated: true)
        } else if !textField.text!.isEmpty && !textView.text!.isEmpty {
            APIFunctions.functions.addNote(date: date, title: textField.text!.modifyStringToJSONString(), note: textView.text.modifyStringToJSONString())
            print(textView.text.modifyStringToJSONString())
            navigationController?.popViewController(animated: true)
        }
    }
    
    @objc func tapDeleteButton() {
        APIFunctions.functions.deleteNote(id: note!._id)
        navigationController?.popViewController(animated: true)
    }
    
    func configureTextField() {
        view.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            textField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.secondaryLabel.cgColor
        textField.layer.cornerRadius = 10
        textField.setLeftPaddingPoints(5)
        textField.setRightPaddingPoints(5)
        textField.font = UIFont.preferredFont(forTextStyle: .headline)
        
        if isUpdating == true {
            textField.text = note?.title
        } else {
            textField.placeholder = "Enter a title"
        }
    }
    
    func configureTextView() {
        view.addSubview(textView)
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 15),
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            textView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15)
        ])
        
        textView.font = UIFont.preferredFont(forTextStyle: .body)
        
        if isUpdating == true {
            textView.text = note?.note
        }
    }
    
    func setTitle() {
        if isUpdating == true {
            title = "Edit note"
        } else {
            title = "Add note"
        }
    }
    
}


