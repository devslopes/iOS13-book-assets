## 3:21 MyHood

#### AppDelegate.swiftt

- didFinishLaunchingWithOptions

`UIApplicationLaunchOptionsKey` has been renamed to `UIApplication.LaunchOptionsKey`


#### DataService.swift

- Change loadData() — NSKeyedUnarchiver throws and arguments have changed
 
NEW:
```
func loadPosts() {
  if let postsData = UserDefaults.standard.object(forKey: "posts") as? Data {
            
    if let postsArray = try? NSKeyedUnarchiver.unarchivedObject(ofClasses: [Post.self], from: postsData) as? [Post] {
      _loadedPosts = postsArray
    }
  }
        
  NotificationCenter.default.post(Notification(name: Notification.Name(rawValue: "postsLoaded"), object: nil))
}
```

OLD:
```
func loadPosts() {
  if let postsData = UserDefaults.standard.object(forKey: "posts") as? Data {
            
    if let postsArray = NSKeyedUnarchiver.unarchiveObject(with: postsData) as? [Post] {
      _loadedPosts = postsArray
    }
  }
        
  NotificationCenter.default.post(Notification(name: Notification.Name(rawValue: "postsLoaded"), object: nil))
}
```

- Change saveData() - NSKeyedArchiver throws and arguments have changed - remove `UserDefaults.standard.synchronize()`

NEW:
```
func savePosts() {
  let postsData = try? NSKeyedArchiver.archivedData(withRootObject: _loadedPosts, requiringSecureCoding: true)
  UserDefaults.standard.set(postsData, forKey: "posts")
}
```

OLD:
```
func savePosts() {
  let postsData = NSKeyedArchiver.archivedData(withRootObject: _loadedPosts)
  UserDefaults.standard.set(postsData, forKey: "posts")
  UserDefaults.standard.synchronize()
}
```

- in `func saveImageAndCreatePath(_ image: UIImage)` change `UIImagePNGRepresentation(image)` to `image.pngData()`

#### AddPostVC.swift

- imagePickerControllerDelegate method has changed. `info[UIImagePickerControllerOriginalImage]` has been changed to `info[.originalImage]` replace:

OLD:
```
func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
  let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
  imagePicker.dismiss(animated: true, completion: nil)
  postImg.image = selectedImage
}
```

NEW:
```
func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
  let selectedImage = info[.originalImage] as? UIImage
  imagePicker.dismiss(animated: true, completion: nil)
  postImg.image = selectedImage
}
```
Also note the optional cast to `UIImage`
