import UIKit

final class MainViewController: UIViewController {
    
    private let resultLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = .boldSystemFont(ofSize: 60)
        label.textColor = .white
        label.textAlignment = .right
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let historyLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .boldSystemFont(ofSize: 30)
        label.textColor = .gray
        label.textAlignment = .right
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let mainStackView = MainStackView()
    private let calculationModel = CalculationModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
        mainStackView.delegate = self
    }
    
    private func setupViews() {
        view.backgroundColor = .black
        
        view.addSubview(mainStackView)
        view.addSubview(resultLabel)
        view.addSubview(historyLabel)
    }
}

extension MainViewController: MainStackViewProtocol {
    func tapNumberButton(tag: Int) {
        calculationModel.setuNumber(number: tag)
        resultLabel.text = calculationModel.getCurrentNumber()
        historyLabel.text = calculationModel.getCalculationHistory(tag: tag)
    }
    
    func tapActionButton(tag: Int) {
        switch tag {
        case 10:
            calculationModel.addPointValue()
            resultLabel.text = calculationModel.getCurrentNumber()
        case 11:
            resultLabel.text = calculationModel.getResult()
        case 12:
            resultLabel.text = calculationModel.setOperation(opertion: .addition)
            historyLabel.text = calculationModel.getCalculationHistory(tag: tag)
        case 13:
            resultLabel.text = calculationModel.setOperation(opertion: .substraction)
            historyLabel.text = calculationModel.getCalculationHistory(tag: tag)
        case 14:
            resultLabel.text = calculationModel.setOperation(opertion: .multyplication)
            historyLabel.text = calculationModel.getCalculationHistory(tag: tag)
        case 15:
            resultLabel.text = calculationModel.setOperation(opertion: .division)
            historyLabel.text = calculationModel.getCalculationHistory(tag: tag)
        case 16:
            calculationModel.setPrecentNumber()
            resultLabel.text = calculationModel.getCurrentNumber()
        case 17:
            historyLabel.text = calculationModel.getCalculationHistory(tag: tag)
            calculationModel.invertValue()
            resultLabel.text = calculationModel.getCurrentNumber()
        case 18:
            print("AC")
            calculationModel.resetValue()
            resultLabel.text = "0"
            historyLabel.text = ""
        default:
            print("Error tag")
        }
    }
}

extension MainViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            mainStackView.heightAnchor.constraint(equalTo: mainStackView.widthAnchor, multiplier: 1),
            
            historyLabel.bottomAnchor.constraint(equalTo: mainStackView.topAnchor, constant: -5),
            historyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            historyLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            resultLabel.bottomAnchor.constraint(equalTo: historyLabel.topAnchor, constant: -10),
            resultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            resultLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
    }
}
