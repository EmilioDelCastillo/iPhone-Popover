//
//  ViewController.swift
//  Popover
//
//  Created by Emilio Del Castillo on 04/04/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func sortbyAction(_ sender: UIBarButtonItem) {
        // Sorting order
        let desc = SortingOption(text: "Descending", isSelected: true , order: .descending)
        let asc  = SortingOption(text: "Ascending" , isSelected: false, order: .ascending)
        
        // Sorting parameter
        let sortbyUpdatedAt = SortingOption(text: "Updated At", isSelected: true , parameter: .updatedAt)
        let sortbyAlphabet  = SortingOption(text: "Alphabet"  , isSelected: false, parameter: .alphabet)
        
        presentOptionsPopover(withOptionItems: [[asc, desc],
                                                [sortbyUpdatedAt, sortbyAlphabet]],
                              fromBarButtonItem: sender)
    }
    
    func presentOptionsPopover(withOptionItems items: [[OptionItem]], fromBarButtonItem barButtonItem: UIBarButtonItem) {
        let optionItemListVC = OptionPopoverViewController()
        optionItemListVC.items = items
        optionItemListVC.delegate = self
        
        // The init of OptionPopoverViexController sets its popoverPresentationController.
        let popoverPresentationController = optionItemListVC.popoverPresentationController!
        
        // In this example the popover comes from a barButtonItem, but it could very well come from a normal button.
        popoverPresentationController.barButtonItem = barButtonItem
        popoverPresentationController.delegate = self
        
        present(optionItemListVC, animated: true, completion: nil)
    }
}

extension ViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}

extension ViewController: OptionItemListViewControllerDelegate {
    
    // Here you would do the appropriate actions according to the selected item.
    func didSelectOptionItem(from viewController: OptionPopoverViewController, with item: OptionItem) {
        viewController.dismiss(animated: true) {
            print(item.text)
        }
    }
}

// Example of a struct conforming to OptionItem
struct SortingOption: OptionItem {
    // Required variables
    var text: String
    var isSelected: Bool
    var font: UIFont = .preferredFont(forTextStyle: .body)
    
    // Custom variables
    var order: SortOrder!
    var parameter: SortBy!
}

enum SortBy {
    case updatedAt
    case alphabet
}
enum SortOrder {
    case descending
    case ascending
}
