# SwiftDatePicker

![GitHub repo size](https://img.shields.io/github/repo-size/jaydeep-godhani/SwiftDatePicker)
![GitHub stars](https://img.shields.io/github/stars/jaydeep-godhani/SwiftDatePicker?style=social)
![GitHub forks](https://img.shields.io/github/forks/jaydeep-godhani/SwiftDatePicker?style=social)

**SwiftDatePicker** is a custom date picker implementation for iOS. It provides a visually appealing and reusable `DatePickerView` component that can be easily integrated into any iOS project. The date picker allows users to select a date, and its delegate methods enable handling actions like confirmation and cancellation.

## Features

- Customizable `UIDatePicker` with rounded background view.
- Delegate methods to handle `OK` and `Cancel` button actions.
- Dynamically adds and removes the date picker view.
- Supports minimum date selection starting from today.
- Provides formatted date strings and logical day identifiers (e.g., "today", "yesterday", "tomorrow").

## Screenshots

<table>
  <tr>
    <td><img src="Images/Screenshot - 1.png" width=270></td>
    <td><img src="Images/Screenshot - 2.png" width=270></td>
    <td><img src="Images/Screenshot - 3.png" width=270></td>
  </tr>
</table>

## Installation

To integrate **SwiftDatePicker** into your project:

1. Clone the repository or download the source code.
2. Copy the `DatePickerView.xib` and `DatePickerView.swift` files into your project.
3. Link the `DatePickerView` class with the corresponding `.xib` file.

## Usage

### 1. Adding the Date Picker

In your `UIViewController`:

```swift
@IBAction func datePickerButtonAction(_ sender: UIButton) {
    self.view.endEditing(true)
    self.addDatePickerView()
}

func addDatePickerView() {
    let datePickerView = DatePickerView(frame: self.view.bounds)
    datePickerView.tag = 1001
    datePickerView.delegate = self
    datePickerView.datePicker.date = Date()
    datePickerView.datePicker.minimumDate = Date()
    self.view.addSubview(datePickerView)
    self.view.bringSubviewToFront(datePickerView)
}
```

### 2. Handling Delegate Methods

Conform to the `DatePickerViewDelegate` protocol to handle the button actions:

```swift
extension ViewController: DatePickerViewDelegate {
    func datePickerOkButtonAction(view: DatePickerView, sender: UIButton, date: Date) {
        // Handle selected date
        print("Selected Date:", date)
        self.removeSubView()
    }
    
    func datePickerCancelButtonAction(view: DatePickerView, sender: UIButton) {
        // Handle cancellation
        self.removeSubView()
    }
}
```

### 3. Removing the Date Picker View

```swift
func removeSubView() {
    for subview in self.view.subviews {
        if subview.tag == 1001 {
            subview.removeFromSuperview()
        }
    }
}
```

## Customization

You can easily modify the appearance of the `DatePickerView`:

- Change the background color of `datePickerBackgroundView` for a different look.
- Modify the corner radius for the `datePickerBackgroundView` in the `setDatePickerUI()` method.
- Add more UI elements to the `DatePickerView.xib` file if needed.

## Requirements

- iOS 13.0+
- Swift 5
- Xcode 12 or higher

## Contributing

Contributions are welcome! Please fork the repository and submit a pull request for any enhancements or bug fixes.

## License

This project is licensed under the MIT License. See the [`LICENSE`](LICENSE) file for details.

## Author

Developed by [Jaydeep Godhani](https://github.com/jaydeep-godhani). If you have any questions or feedback, feel free to reach out!

## Acknowledgments

- Thanks to the iOS community for their continuous support and inspiration!
