# iPhone-Popover
This allows the developer to display a small popover on an iPhone screen.
The result looks like this

<img src="https://user-images.githubusercontent.com/78765245/113518763-97373280-9588-11eb-95ed-5073a8a3a210.png" width="300"/>

To present a popover, the source view must conform to `UIPopoverPresentationControllerDelegate` and implement:
```swift
extension PresentingViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}
```

Every option in the popover must conform to `OptionItem`

*Based on the work of Rohan Bhale.*
