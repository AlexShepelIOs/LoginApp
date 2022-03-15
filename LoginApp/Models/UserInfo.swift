//
//  UserInfo.swift
//  LoginApp2
//
//  Created by Александр Шепель on 13.03.2022.
//


struct UserData {
    let login: String
    let password: String
    let person: Person
    
    static func getUserData() -> UserData {
        UserData(login: "Admin", password: "Admin", person: .getPerson())
    }
    
}

struct Person {
    let name: String
    let surname: String
    let image: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
    
    static func getPerson() -> Person {
        Person(name: "Alex", surname: "Shepel", image: "ImageDog")
    }
}
