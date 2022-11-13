import Foundation

 struct Company {
    var companyName: String
    var employee: [Employee]
    var budget: Int
    var foundationYear: Int
    
    mutating func companyIncome(income value: Int)  {
        self.budget += value
    }
    mutating func companyExpense(expense value: Int) {
        self.budget -= value
    }
    
    mutating func employeeSalaryPayment() {
        self.employee.map { employee in
            self.budget -=  employee.calculateEmployeeSalary(employeeAge: employee.age)
        }
    }
    mutating func hireAnEmployee (employee: Employee) {
        self.employee.append(employee)
    }
    
}

enum EmployeeType: Int {case junior = 1,mid,senior,architecture,manager}
enum CivilStatus {case married,single}

protocol Employee {
    var name: String {get set}
    var age: Int {get set}
    var civilStatus: CivilStatus {get set}
    var experienceSectorYear: Int? { get set }
    func calculateEmployeeSalary (employeeAge age: Int) -> Int
}

struct JuniorEmployee: Employee {
    
    
    var experienceSectorYear: Int?
    
    var name: String
    
    var age: Int
    
    var civilStatus: CivilStatus
    
    
    
    func calculateEmployeeSalary(employeeAge age: Int) -> Int {
        return age * EmployeeType.junior.rawValue * 500
    }
    
   
}

struct MidEmployee: Employee {
    var experienceSectorYear: Int?
    
    var name: String
    
    var age: Int
    
    var civilStatus: CivilStatus
    
    func calculateEmployeeSalary(employeeAge age: Int) -> Int {
        return age * EmployeeType.mid
            .rawValue * 500
    }
    
    
}

struct SeniorEmployee: Employee {
    var experienceSectorYear: Int?
    
    var name: String
    
    var age: Int
    
    var civilStatus: CivilStatus
    
    func calculateEmployeeSalary(employeeAge age: Int) -> Int {
        return age * EmployeeType.senior.rawValue * 500
    }
    
    
}

struct ArchitectureEmployee: Employee {
    var name: String
    
    var age: Int
    
    var civilStatus: CivilStatus
    
    var experienceSectorYear: Int?
    
    func calculateEmployeeSalary(employeeAge age: Int) -> Int {
        return age * EmployeeType.architecture.rawValue * 500
    }
    
  
    
    
}

struct ManagerEmployee: Employee {
    var experienceSectorYear: Int?
    
    var name: String
    
    var age: Int
    
    var civilStatus: CivilStatus
    
    func calculateEmployeeSalary(employeeAge age: Int) -> Int {
        return age * EmployeeType.manager.rawValue * 500
    }
    
    
}

var employees: [Employee] = [
    JuniorEmployee(name: "Elon Musk", age: 45, civilStatus: .single),
    JuniorEmployee(name: "Hasan Yatar", age: 22, civilStatus: .single),
   
    
]

var mustafaCicek = ArchitectureEmployee(name: "Mustafa Cicek", age: 22, civilStatus: .single)

var tesla = Company(companyName: "tesla", employee: employees , budget: 150000, foundationYear: 2000)


tesla.budget
tesla.employeeSalaryPayment()
tesla.budget

tesla.hireAnEmployee(employee: mustafaCicek)
tesla.employeeSalaryPayment()
tesla.employee.count
tesla.budget


// MARK: Soru 2

struct Zoo {
    var animals: [Animal]
    
    var animalSitters: [AnimalSitter]
    var dailyWaterLimit: Int {
        didSet {
            
                animals.map { animal in
                    self.dailyWaterLimit -= animal.waterConsumption
                }
            
            
        }
    }
    var budget: Int {
        didSet {
            animalSitters.map { sitter in
                self.budget -= sitter.salary
                if self.budget <= 0 {
                    print("Insufficient Budget")
                }
            }
        }
    }
    
    
    
   
}

protocol Animal {
    var waterConsumption: Int {get set}
    var animalVoice: String {get set}
    var animalSitter: AnimalSitter? {get set}
    
    mutating func setAnimalSitter (animalSitter: AnimalSitter)
    
}

class Dog: Animal {
    
    
    var waterConsumption: Int = 20
    var animalVoice: String = "Hav Hav!!"
    var animalSitter: AnimalSitter?
    var featherColor: String?
    
    init(waterConsumption: Int?, animalVoice: String?, animalSitter: AnimalSitter?, featherColor: String?) {
        self.waterConsumption = waterConsumption ?? 15
        self.animalSitter = animalSitter
        self.featherColor = featherColor
        self.animalVoice = animalVoice ?? "Hav hav!"
    }
    
      func setAnimalSitter(animalSitter sitter: AnimalSitter) {
        self.animalSitter = sitter
    }
}

class Cat: Animal {
       
    var waterConsumption: Int
    var animalVoice: String
    var animalSitter: AnimalSitter?
    var featherColor: String?
    
    init(waterConsumption: Int?, animalVoice: String?, animalSitter: AnimalSitter?, featherColor: String?) {
        self.waterConsumption = waterConsumption ?? 10
        self.animalSitter = animalSitter
        self.featherColor = featherColor
        self.animalVoice = animalVoice ?? "Miyavv"
    }
    
    func setAnimalSitter(animalSitter sitter: AnimalSitter) {
        self.animalSitter = sitter
    }
    
    
    
}



struct AnimalSitter {
    var animal: [Animal]
    var salary: Int {
        didSet {
            self.salary = age * experienceYear * 100
        }
    }
    var age: Int
    var experienceYear: Int
    var name: String?
}

var animalSitter = AnimalSitter(animal: animals, salary: 10, age: 20, experienceYear: 3, name: "jhon")


var animals: [Animal] =  [
    Cat(waterConsumption: 10, animalVoice: "miyav", animalSitter: animalSitter, featherColor: "gray"),
    Cat(waterConsumption: 12, animalVoice: "miyav", animalSitter: animalSitter, featherColor: "orange"),
  Dog(waterConsumption: 15, animalVoice: "Hav hav!", animalSitter: animalSitter, featherColor: "black")
]


var zoo: Zoo = Zoo(animals: animals, animalSitters: [animalSitter], dailyWaterLimit: 350, budget: 150000)








