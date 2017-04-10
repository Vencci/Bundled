//
//  ViewController.swift
//  SecondPage
//
//  Created by si zhang on 17/4/5.
//  Copyright © 2017年 si zhang. All rights reserved.
//

//隐藏键盘功能需要加上

import UIKit

// flag
var morningFlag: Int = 1
var lunchFlag: Int = 1
var dinnerFlag: Int = 1
var vegetableFlag: Int = 1
var lowfatFlag: Int = 1

var dietRestrictions = [String]()

var myUser = User(numPeople: 1, numMeals: 1, dietaryRestrictions: [""])

var test: Int?

class SecondPage: UIViewController {
    
    
    let BgImage: UIImageView = {
        let theImageView = UIImageView()
        theImageView.contentMode = .scaleAspectFill
        theImageView.image = UIImage(named: "cooking.jpg")
        theImageView.translatesAutoresizingMaskIntoConstraints = false //You need to call this property so the image is added to your view
        return theImageView
    }()
    
    //effect instance
    var effect:UIVisualEffect!
    //
    var addItemView: UIView = {
        var addItemView = UIView()
        addItemView.backgroundColor = UIColor.white
        addItemView.translatesAutoresizingMaskIntoConstraints = false
        addItemView.layer.cornerRadius = 5
        //addItemView.layer.masksToBounds = true
        return addItemView
    }()
    var blurEffectView: UIVisualEffectView!
    //Image Button
    lazy var ImageButton: UIButton = {
        let BundleImage = UIImage(named: "foodphoto") as UIImage?
        let button = UIButton(type: UIButtonType.custom) as UIButton
        button.backgroundColor = UIColor(r: 80, g: 101, b: 161)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(BundleImage, for: .normal)
        button.addTarget(self, action: #selector(goToBundle), for: .touchUpInside)
        return button
    }()
    
    //button 1: morning
    lazy var PopMorningButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.clear
        button.layer.cornerRadius = 6
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.setTitle("Breakfast", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(MorningFunc), for: .touchUpInside)
        return button
    }()
    //button 2: lunch
    lazy var PopLunchButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.clear
        button.layer.cornerRadius = 6
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.setTitle("Lunch", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(LunchFunc), for: .touchUpInside)
        return button
    }()
    //button 3: dinner
    lazy var PopDinnerButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.clear
        button.layer.cornerRadius = 6
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.setTitle("Dinner", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(DinnerFunc), for: .touchUpInside)
        return button
    }()
    //button 4: vegetable
    lazy var PopVegetableButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.clear
        button.layer.cornerRadius = 6
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.setTitle("vegetarian", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(VegetableFunc), for: .touchUpInside)
        return button
    }()
    //button 5: low fat
    lazy var PopLowfatButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.clear
        button.layer.cornerRadius = 6
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.setTitle("low fat", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(LowfatFunc), for: .touchUpInside)
        return button
    }()
    //button UI
    lazy var PopCancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r: 80, g: 101, b: 161)
        button.setTitle("Cancel", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(dismissPop), for: .touchUpInside)
        return button
    }()
    //
    lazy var PopSaveButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r: 80, g: 101, b: 161)
        button.setTitle("Save", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(goToNextView), for: .touchUpInside)
        return button
    }()
    //number of meal
    let mealTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Number of meal"
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.textAlignment = .center
        return tf
    }()
    //number of people
    let peopleTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Number of people"
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.textAlignment = .center
        return tf
    }()
    
    
    //
    //view did load 从这里开始
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //add background
        view.addSubview(BgImage)
        someImageViewConstraints()
        //add bundle
        view.addSubview(ImageButton)
        setUpImageButton()
        // view.addSubview(BundleImage)
        // BundleImageViewConstraints()
        //add blur view
        
        //view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: Selector(("dismissKeyboardFromView:"))))


        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
        blurEffectView = UIVisualEffectView(effect: blurEffect)//这有问题想办法放到外面
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(blurEffectView)
        effect = blurEffectView.effect
        blurEffectView.effect = nil
        //button.addTarget(self, action: Selector("btnTouched:"), for:.touchUpInside)
        //view.addSubview(button)
        //setUpImageButton()
        view.addSubview(ImageButton)
        setUpImageButton()
        //naviagation bar
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add Bundle", style: .plain, target: self, action: #selector(handlePopOver))
        
        
    }
    
    
    func animateIn(){
        view.addSubview(addItemView)
        SetUpPopUpView()
        //
        
        //addItemView.center = self.view.center
        addItemView.transform = CGAffineTransform.init(scaleX:1.3, y:1.3)
        addItemView.alpha = 0;
        UIView.animate(withDuration: 0.4) {
            self.blurEffectView.effect = self.effect
            self.addItemView.alpha = 1
            self.addItemView.transform = CGAffineTransform.identity
            //self. //没写完
        }
        addItemView.addSubview(PopCancelButton)
        addItemView.addSubview(PopSaveButton)
        //这里加popover里面的输入栏
        addItemView.addSubview(mealTextField)
        addItemView.addSubview(peopleTextField)
        addItemView.addSubview(PopMorningButton)
        addItemView.addSubview(PopLunchButton)
        addItemView.addSubview(PopDinnerButton)
        addItemView.addSubview(PopVegetableButton)
        addItemView.addSubview(PopLowfatButton)
        //
        SetUpInputInPupUp()
        setupPopButton()
        setupSaveButton()
        setupMorningButton()
        setupLunchButton()
        setupDinnerButton()
        setupVegetableButton()
        setupLowfatButton()
    }
    
    func animateOut(){
        UIView.animate(withDuration: 0.3, animations: {
            self.addItemView.transform = CGAffineTransform.init(scaleX:1.3, y:1.3)
            self.addItemView.alpha=0
            self.blurEffectView.effect = nil
        }) { (success:Bool) in
            self.addItemView.removeFromSuperview()
        }
    }
    
    func dismissPop(){
        animateOut()
    }
    
    func goToNextView(){
        myUser.numMeals = Int(mealTextField.text!) ?? 1
        myUser.numPeople = Int(peopleTextField.text!) ?? 1
        myUser.dietaryRestrictions = dietRestrictions
        let layout =  UICollectionViewFlowLayout()
        let newMessageController = FeaturedBundlesController(collectionViewLayout: layout)
        let navController = UINavigationController(rootViewController: newMessageController)
        present(navController, animated: true, completion: nil)
    }
    // 各种constrains setup======================================================
    func SetUpInputInPupUp(){
        //number of meal
        mealTextField.centerXAnchor.constraint(equalTo: addItemView.centerXAnchor).isActive = true
        mealTextField.topAnchor.constraint(equalTo: addItemView.topAnchor, constant: 20).isActive = true
        mealTextField.widthAnchor.constraint(equalToConstant: 200).isActive = true
        mealTextField.heightAnchor.constraint(equalTo: addItemView.heightAnchor, multiplier: 1/5)
        //number if people
        peopleTextField.centerXAnchor.constraint(equalTo: addItemView.centerXAnchor).isActive = true
        peopleTextField.topAnchor.constraint(equalTo: mealTextField.bottomAnchor, constant: 10).isActive = true
        peopleTextField.widthAnchor.constraint(equalToConstant: 200).isActive = true
        peopleTextField.heightAnchor.constraint(equalTo: addItemView.heightAnchor, multiplier: 1/5)
    }
    
    func SetUpPopUpView() {
        addItemView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        addItemView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        addItemView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        addItemView.heightAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
    }
    
    func someImageViewConstraints() {
        BgImage.widthAnchor.constraint(equalTo:self.view.widthAnchor).isActive = true
        BgImage.heightAnchor.constraint(equalTo:self.view.heightAnchor).isActive = true
    }
    
    
    
    func setUpImageButton() {
        ImageButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        ImageButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        ImageButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -100).isActive = true
        ImageButton.heightAnchor.constraint(equalTo: view.widthAnchor, constant: -100).isActive = true
    }
    
    func setupPopButton() {
        //need x, y, width, height constraints
        PopCancelButton.centerXAnchor.constraint(equalTo: addItemView.centerXAnchor).isActive = true
        PopCancelButton.centerYAnchor.constraint(equalTo: addItemView.bottomAnchor, constant: -50).isActive = true
        PopCancelButton.widthAnchor.constraint(equalTo: addItemView.widthAnchor, constant: -24).isActive = true
        PopCancelButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupSaveButton() {
        //need x, y, width, height constraints
        PopSaveButton.centerXAnchor.constraint(equalTo: addItemView.centerXAnchor).isActive = true
        PopSaveButton.centerYAnchor.constraint(equalTo: PopCancelButton.topAnchor, constant: -30).isActive = true
        PopSaveButton.widthAnchor.constraint(equalTo: addItemView.widthAnchor, constant: -24).isActive = true
        PopSaveButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func goToBundle(){
        //let layout =  UICollectionViewFlowLayout()
        let newMessageController = TabBarController()
        let navController = UINavigationController(rootViewController: newMessageController)
        present(navController, animated: true, completion: nil)
    }
    
    func handlePopOver(){
        animateIn()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //button 1: morning
    func setupMorningButton() {
        //need x, y, width, height constraints
        PopMorningButton.leftAnchor.constraint(equalTo: addItemView.leftAnchor).isActive = true
        PopMorningButton.centerYAnchor.constraint(equalTo: PopSaveButton.topAnchor, constant: -30).isActive = true
        PopMorningButton.widthAnchor.constraint(equalToConstant: 75).isActive = true
        PopMorningButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    //button 2: lunch
    func setupLunchButton() {
        //need x, y, width, height constraints
        PopLunchButton.leftAnchor.constraint(equalTo: PopMorningButton.rightAnchor).isActive = true
        PopLunchButton.centerYAnchor.constraint(equalTo: PopSaveButton.topAnchor, constant: -30).isActive = true
        PopLunchButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        PopLunchButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    //button 3: dinner
    func setupDinnerButton() {
        //need x, y, width, height constraints
        PopDinnerButton.leftAnchor.constraint(equalTo: PopLunchButton.rightAnchor).isActive = true
        PopDinnerButton.centerYAnchor.constraint(equalTo: PopSaveButton.topAnchor, constant: -30).isActive = true
        PopDinnerButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        PopDinnerButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    //button 4: vegetable
    func setupVegetableButton() {
        //need x, y, width, height constraints
        PopVegetableButton.leftAnchor.constraint(equalTo: PopDinnerButton.rightAnchor).isActive = true
        PopVegetableButton.centerYAnchor.constraint(equalTo: PopSaveButton.topAnchor, constant: -30).isActive = true
        PopVegetableButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        PopVegetableButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    //button 5: low fat
    func setupLowfatButton() {
        //need x, y, width, height constraints
        PopLowfatButton.leftAnchor.constraint(equalTo: PopVegetableButton.rightAnchor).isActive = true
        PopLowfatButton.centerYAnchor.constraint(equalTo: PopSaveButton.topAnchor, constant: -30).isActive = true
        PopLowfatButton.widthAnchor.constraint(equalToConstant: 65).isActive = true
        PopLowfatButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func MorningFunc(){
        morningFlag = morningFlag*(-1)
        if morningFlag == -1 {
            PopMorningButton.backgroundColor = UIColor.clear
            dietRestrictions.append((PopMorningButton.titleLabel?.text)!)
            print((PopMorningButton.titleLabel?.text) ?? "null")
        }
        if morningFlag == 1{
            PopMorningButton.backgroundColor = UIColor(r: 80, g: 101, b: 161)
        }
    }
    func LunchFunc(){
        lunchFlag = lunchFlag*(-1)
        if lunchFlag == -1 {
            PopLunchButton.backgroundColor = UIColor.black
            dietRestrictions.append((PopLunchButton.titleLabel?.text)!)
        }
        if lunchFlag == 1{
            PopLunchButton.backgroundColor = UIColor(r: 80, g: 101, b: 161)
        }
    }
    func DinnerFunc(){
        dinnerFlag = dinnerFlag*(-1)
        if dinnerFlag == -1 {
            PopDinnerButton.backgroundColor = UIColor.black
            dietRestrictions.append((PopDinnerButton.titleLabel?.text)!)
        }
        if dinnerFlag == 1{
            PopDinnerButton.backgroundColor = UIColor(r: 80, g: 101, b: 161)
        }
    }
    func VegetableFunc(){
        vegetableFlag = vegetableFlag*(-1)
        if vegetableFlag == -1 {
            PopVegetableButton.backgroundColor = UIColor.black
            dietRestrictions.append((PopVegetableButton.titleLabel?.text)!)
        }
        if vegetableFlag == 1{
            PopVegetableButton.backgroundColor = UIColor(r: 80, g: 101, b: 161)
        }
    }
    func LowfatFunc(){
        lowfatFlag = lowfatFlag*(-1)
        if lowfatFlag == -1 {
            PopLowfatButton.backgroundColor = UIColor.black
            dietRestrictions.append((PopLowfatButton.titleLabel?.text)!)
        }
        if lowfatFlag == 1{
            PopLowfatButton.backgroundColor = UIColor(r: 80, g: 101, b: 161)
        }
    }
    
}


extension UIViewController {
    func dismissKeyboardFromView(sender: UITapGestureRecognizer?) {
        let view = sender?.view
        view?.endEditing(true)
    }
}

