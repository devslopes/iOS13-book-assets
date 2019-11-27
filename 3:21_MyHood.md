### 3:21 MyHood

- AppDelegate.swiftt

didFinishLaunchingWithOptions

`UIApplicationLaunchOptionsKey` has been renamed to `UIApplication.LaunchOptionsKey`


- DataService.swift

Change loadData() — NSKeyedArchiver throws and arguments have changed
 
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
