## 5:39 DreamLister

#### AppDelegate.swift

- `UIApplicationLaunchOptionsKey` has been renamed `UIApplication.LaunchOptionsKey`

#### MaterialView.swift

- cleanup all the spaces

#### ItemCell.swift

- Spacing

#### CustomTextField.swift

- `NSForegroundColorAttributeName` has been renamed to `NSAttributedString.Key.foregroundColor`

- replace: because `textFont` was already initialized and font is optional, will default to system font

OLD:
```
if let fnt = textFont {
  self.font = fnt
} else {
  self.font = UIFont(name: "Helvetica Neue", size: 14.0)
}
```
NEW:
```
self.font = textFont
```
