## 3:24 Working with gestures / tanstagram

#### ViewController.swift

- Modify functions that add gestures. if we pass in the imageView we may as well just add the gesture to it in the funciton,
otherwise its unused

NEW:
```
func addPinchGesture(imageView: UIImageView) {
    let pinchGesture =  UIPinchGestureRecognizer(target: self, action: #selector(ViewController.handlePinch))
    imageView.addGestureRecognizer(pinchGesture)
}
    
func addPanGesture(imageView : UIImageView) {
    let panGesture = UIPanGestureRecognizer(target: self, action: #selector(ViewController.handlePan))
    imageView.addGestureRecognizer(panGesture)
}
    
func addRotateGesture(imageView: UIImageView) {
    let rotateGesture = UIRotationGestureRecognizer(target: self, action: #selector(ViewController.handleRotation))
    imageView.addGestureRecognizer(rotateGesture)
}
```

- modify `createGestures()`

NEW:
```
func createGestures() {
    for image in images {
      addPinchGesture(imageView: image)
      addPanGesture(imageView: image)
      addRotateGesture(imageView: image)
    }
}
```

- In order to save the picture we need to add this to `info.plist`

`<key>NSPhotoLibraryAddUsageDescription</key>
    <string>Saving photos to camera roll</string>`
