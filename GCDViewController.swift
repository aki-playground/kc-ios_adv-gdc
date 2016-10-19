//
//  GCDViewController.swift
//  GCD
//
//  Created by Akixe on 17/10/16.
//  Copyright © 2016 AOA. All rights reserved.
//

import UIKit

class GCDViewController: UIViewController {

    
    let url = URL(string: "http://img12.deviantart.net/3273/i/2015/112/e/7/game_of_thrones___winter_direwolf___loup_d_hiver_by_kanthesis-d61xr28.jpg")
    @IBOutlet weak var image: UIImageView!
    @IBAction func updateAlpha(_ sender: UISlider) {
        let value : CGFloat = CGFloat(sender.value)
        image.alpha = value
    }
    
    @IBAction func asyncDownload(_ sender: AnyObject) {
            //Metemos la operación de "descarga" a una cola
            DispatchQueue.global(qos: .userInitiated) // la cola de tipo .userInitiated tendrá más prioridad que .default
                .async {
                    do{
                        let data = try Data(contentsOf: self.url!)
                        
                        DispatchQueue.main.async { // Toda interacción en la vista se debe hacer en el hilo proncipal (DispqtchQueue.main)
                            self.image.image = UIImage(data: data)
                        }
                        
                    }catch{
                        print("Error descargando imagen")
                    }
            }
        
    }
    
    @IBAction func syncDownload(_ sender: AnyObject) {
        
        do{
            let data = try Data(contentsOf: url!)
            image.image = UIImage(data: data)
        }catch{
            print("Error descargando imagen")
        }
        
        
    }
    
    @IBAction func actorDownload(_ sender: AnyObject) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
