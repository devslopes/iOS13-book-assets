## 3:22 Park.ly

#### AppDelegate.swift

- didFinishLaunchingWithOptions()

`UIApplicationLaunchOptionsKey` has been renamed to `UIApplication.LaunchOptionsKey`

#### ViewController.swift

- Moved this file into the `Controller` folder

- `func centerMapOnLocation(location: CLLocation)`

`MKCoordinateRegionMakeWithDistance` has been replaced by `MKCoordinateRegion.init(center:latitudinalMeters:longitudinalMeters:)`

OLD:
```
let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
```

NEW:
```
let coordinateRegion = MKCoordinateRegion.init(center: location.coordinate, latitudinalMeters: regionRadius * 2, longitudinalMeters: regionRadius * 2)
```
