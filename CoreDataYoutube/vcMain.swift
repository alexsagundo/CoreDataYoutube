//
//  vcMain.swift
//  CoreDataYoutube
//
//  Created by proyectosSagundo on 6/13/15.
//  Copyright (c) 2015 proyectosSagundo. All rights reserved.
//

import UIKit
import CoreData

class vcMain: UIViewController {
    
    @IBOutlet var txtUsername: UITextField!
    @IBOutlet var txtPassword: UITextField!
    
    @IBAction func btnSave(){
        var appDel:AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        var context:NSManagedObjectContext=appDel.managedObjectContext!
        
        var newUser = NSEntityDescription.insertNewObjectForEntityForName("Users", inManagedObjectContext: context) as! NSManagedObject
        newUser.setValue("" + txtUsername.text, forKey:"username")
        newUser.setValue("" + txtPassword.text, forKey:"password")
        
        context.save(nil)
        
        println(newUser)
        println("Object saved.")
    }
    
    @IBAction func btnLoad(){
        var appDel:AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        var context:NSManagedObjectContext=appDel.managedObjectContext!
        
        var request = NSFetchRequest(entityName: "Users")
        request.returnsObjectsAsFaults=false;
        request.predicate = NSPredicate(format: "Username = %@", txtUsername.text)
        
        var results:NSArray = context.executeFetchRequest(request, error: nil)!
        
        if (results.count>0){
            var res =  results[0] as! NSManagedObject
            
            txtUsername.text=res.valueForKey("username") as! String
            txtPassword.text=res.valueForKey("password") as! String
            
            //for res in results{
            //    println(res)
            //}
        }else{
            println("0 Results Returned... Potential Error")
        }
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}
