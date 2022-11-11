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
    var dailyWaterLimit: Int
    var budget: Int
}

protocol Animal {
    var waterConsumption: Int {get set}
    var animalVoice: String {get set}
    var animalSitter: AnimalSitter {get set}
}

struct AnimalSitter {
    var animal: [Animal]
    
}
