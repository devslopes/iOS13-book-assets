## 5:35 In App Purchases

#### ViewController.swift

- `func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction])`

Add to the end of the switch statement
``` 
@unknown default:
    break
``` 
In the `case .failed:` section, change
OLD:
```
let errorMsg: String! = transaction.error?.localizedDescription
showErrorAlert(title: "Oops! Something went wrong.", msg: "Unable to make purchase.  Reason: \(errorMsg).")
```
NEW:
```
let errorMsg = transaction.error?.localizedDescription
showErrorAlert(title: "Oops! Something went wrong.", msg: "Unable to make purchase.  Reason: \(String(describing: errorMsg)).")
```

- `func productsRequest(_:)`

Reloading the collection view needs to be on main thread, add this to the end of the function:
```
DispatchQueue.main.async {
    self.collectionView.reloadData()
}
```
