//
//  ViewController.swift
//  TanstagramDev

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet var images: [UIImageView]!
    @IBOutlet weak var saveToPhotos: UIImageView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
    
        createGestures()
    }
    
    @IBAction func saveToPhotosTapGesture(_ sender: UITapGestureRecognizer) {
        renderContainer()
    }
    
    func renderContainer() {
        let renderer = UIGraphicsImageRenderer(size: view.bounds.size)
        let image = renderer.image { (context) in
            view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
        }
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(ViewController.image(_image:didFinishSavingWithError:contextInfo:)), nil)
    }
    
    @objc func image(_image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
          if let error = error {
              // we got back an error!
              let alert = UIAlertController(title: "Save error", message: error.localizedDescription, preferredStyle: .alert)
              alert.addAction(UIAlertAction(title: "OK", style: .default))
              present(alert, animated: true)
          } else {
              let alert = UIAlertController(title: "Saved!", message: "Your image has been saved to your photos.", preferredStyle: .alert)
              alert.addAction(UIAlertAction(title: "OK", style: .default))
              present(alert, animated: true)
          }
      }
    
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
    
    func createGestures() {
        for image in images {
            addPinchGesture(imageView: image)
            addPanGesture(imageView: image)
            addRotateGesture(imageView: image)
        }
    }
    
    @objc func handlePinch(_ sender: UIPinchGestureRecognizer) {
        sender.view?.transform = (sender.view?.transform)!.scaledBy(x: sender.scale, y: sender.scale)
        sender.scale = 1
    }
    
    @objc func handlePan(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: self.view)
        if let view = sender.view {
            view.center = CGPoint(x:view.center.x + translation.x,
                                  y:view.center.y + translation.y)
        }
        sender.setTranslation(CGPoint.zero, in: self.view)
    }
    
    @objc func handleRotation(_ sender: UIRotationGestureRecognizer) {
        sender.view?.transform = (sender.view?.transform)!.rotated(by: sender.rotation)
        sender.rotation = 0
    }
}
