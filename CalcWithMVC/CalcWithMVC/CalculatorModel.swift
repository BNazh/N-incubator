//
//  

import Foundation
 enum Operation{
    case constant(Double)
    case unaryOperation((Double)->Double)
    case binaryOperation((Double,Double)->Double)
    case equals
    case clear
}

struct CalculatorModel{
    private var global_operation: Double?
    private var global: Double?
    public var bol = true
    private var operations: Dictionary<String,Operation> = [
        "π": Operation.constant(Double.pi),
        "e": Operation.constant(M_E),
        "√": Operation.unaryOperation(sqrt),
        "X": Operation.binaryOperation({ $0*$1 }),
        "/": Operation.binaryOperation({$0/$1}),
        "+": Operation.binaryOperation({ $0+$1 }),
        "-": Operation.binaryOperation({$0-$1}),
        "=": Operation.equals,
        "AC": Operation.clear,
        "cos" : Operation.unaryOperation(cos) ,
        "cosh" : Operation.unaryOperation(cosh) ,
        "sin" : Operation.unaryOperation(sin) ,
        "sinh" : Operation.unaryOperation(sinh) ,
        "tan" : Operation.unaryOperation(tan) ,
        "tanh" : Operation.unaryOperation(tanh),
        "x^2" : Operation.unaryOperation({pow($0, 2)}),
        "x^3" : Operation.unaryOperation({pow($0, 3)}),
        "x^4" : Operation.unaryOperation({pow($0, 4)}),
        "e^x" : Operation.unaryOperation({pow(M_E, $0)}),
        "x^y" : Operation.binaryOperation(pow),
        "10^x" : Operation.unaryOperation({pow(10, $0)}),
        "lgx" : Operation.unaryOperation(log10),
        "lnx" : Operation.unaryOperation(log),
        "1/x" : Operation.unaryOperation({1 / $0}),
        "+/-" : Operation.unaryOperation({ -$0 }),
        "%" : Operation.unaryOperation({$0 / 100}),
        "2^x" : Operation.unaryOperation({pow(2, $0)}),
        "3^x" : Operation.unaryOperation({pow(3, $0)}),
        "5^x" : Operation.unaryOperation({pow(5, $0)}),
        "4^x" : Operation.unaryOperation({pow(4, $0)}),
        "x^(1/n)" : Operation.binaryOperation({pow($0, 1/$1)}),
        "++1": Operation.unaryOperation({$0+1}),
        "∛" : Operation.unaryOperation({pow($0, 1/3)}),
        
        
        "x!" : Operation.unaryOperation({
            var count = 1
            for i in 1...Int($0){
                count *= i
            }
            return Double(count)
        })
        
    ]
    
    mutating func performOperation(_ operation: String){
        let symbol = operations[operation]!
        switch symbol {
        case .clear:
            saving = nil
            global_operation = 0
            global = 0
            break
        case .constant(let value):
            global = value
        case .unaryOperation(let function):
            if global_operation != nil{
                global = function(global_operation!)
            }
            break
        case .binaryOperation(let function):
            bol = false
            if saving != nil{
                if global_operation != 0{
                    global_operation = saving?.performOperationWith(global_operation!)
                   
                }
                saving?.function = function
                global_operation = 0
            }
            else if global_operation != nil{
                saving = SavingFirstOperandAndFunction(firstOperand: global_operation!, function: function)
            }
        case .equals:
            if global_operation != nil {
                global = saving?.performOperationWith(global_operation!)
                saving = nil
            }
            break
        }
    }
    private var saving: SavingFirstOperandAndFunction?
    private struct SavingFirstOperandAndFunction{
        var firstOperand: Double? = nil
        var function: (Double,Double)->Double
        
        func performOperationWith(_ seconOperand: Double)-> Double{
            return function(firstOperand!,seconOperand)
        }
    }
    
    
    mutating func setOperand(_ operand: Double){
        global_operation = operand
    }
    var result: Double?{
        get{
            return global
        }
        set {
            global_operation = 0
            global = 0
        }
    }
}
