### 3:21 MyHood

- AppDelegate.swiftt

didFinishLaunchingWithOptions

`UIApplicationLaunchOptionsKey` has been renamed to `UIApplication.LaunchOptionsKey`


- DataService.swift

Change loadData() — NSKeyedUnarchiver throws and arguments have changed
 
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

Change saveData() - NSKeyedArchiver throws and arguments have changed - remove `UserDefaults.standard.synchronize()`

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
