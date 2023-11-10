//
//  DatabaseManager.swift
//  MentalDiary
//
//  Created by Danil Frolov on 11.11.2023.
//

import FirebaseFirestore

final class DatabaseManager {
    //MARK: - Nested Types -
    private enum Constant {
        static let basePath = "users/"
    }
    
    enum DataType {
        case profile
        case report
        
        func path(email: String) = {
            switch self {
            case .profile:
                return Constant.basePath + email + "/profile"
            case .report:
                return Constant.basePath + email + "/report"
            }
        }
    }
    
    //MARK: - Properties -
    private let database = Firestore.firestore()
    
    //MARK: - Internal -
    func write(data: [String: Any], with type: DataType) {
        let docRef = database.document(type.path)
        docRef.setData(data)
    }
    
    func getData(with type: DataType) {
        let docRef = database.document(type.path)
        docRef.getDocument { snapshot, error in
            guard let data = snapshot?.data(), error == nil else {
                return
            }
        
            debugPrint(data)
        }
    }
}
