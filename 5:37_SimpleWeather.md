## 5:37 SimpleWeather

#### AppDelegate.swift

- `UIApplicationLaunchOptionsKey` has changed to `UIApplication.LaunchOptionsKey`

#### ViewController.swift

- initialize `var currentWeather = CurrentWeather()` rather than force unwrapping then setting in ViewDidLoad()
- cleaned up spaces

#### CurrentWeather.swift

- I prefer optional variables, would decrease the use of `if let` and instead use coalescing operators `??` with a default value

- spaces need cleanup

#### Main.storyboard

- For best practices with stackViews, remove height constraint, allow it to grow dynamically
- constrain leading and trailing to superview
