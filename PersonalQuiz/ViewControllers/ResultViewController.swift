//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Nikita Zharinov on 01/11/2021.
//

import UIKit

class ResultViewController: UIViewController {
    
    var answers: [Answer]!
    
    @IBOutlet weak var quizResultTitile: UILabel!
    @IBOutlet weak var quizResultDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        let animalTypeWithMaxResult = getResultAnimal()
        
        quizResultTitile.text = "\(animalTypeWithMaxResult.0) - \(animalTypeWithMaxResult.0.rawValue)"
        quizResultDescription.text = animalTypeWithMaxResult.0.definition
    }
    
    private func getResultAnimal() -> (AnimalType, Int) {
        var animalTypesCounter: [AnimalType : Int] = [:]
        for answer in answers{
            
            if let animalTypeCount = animalTypesCounter[answer.type] {
                animalTypesCounter.updateValue(animalTypeCount + 1, forKey: answer.type)
            } else {
                animalTypesCounter.updateValue(1, forKey: answer.type)
            }
        }
        
        let animalTypes = animalTypesCounter.sorted() { $0.value > $1.value }
        guard let animalTypeWithMaxResult = animalTypes.first else { return (.cat, 0) }
        return animalTypeWithMaxResult
    }
    
}
