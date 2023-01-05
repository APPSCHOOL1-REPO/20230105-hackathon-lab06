//
//  ViewModel.swift
//  Check_It
//
//  Created by 최한호 on 2023/01/05.
//

import Foundation
import SwiftUI
import FirebaseFirestore
import Firebase

class GroupStore: ObservableObject {
    @Published var groups: [Group]
    
    let database = Firestore.firestore()
    
    init(groups: [Group] = []) {
        self.groups = groups
    }
    
    //그룹추가하기 - C
    func addGroup(newGroup: Group) {
        database.collection("Group")
            .document("\(newGroup.id)")
            .setData(["id": newGroup.id,
                      "groupName" : newGroup.groupName,
                      "groupImage" : newGroup.groupImage,
                      "host" : newGroup.host,
                      "code" : newGroup.code,
                      "userList" : newGroup.userList,
                      "promiseList" : newGroup.promiseList
            ])
    }
    
    //그룹 목록 Fetch --> 현호님 예정 - R
    func fetchGroup(){
        database.collection("Group")
            .getDocuments { (snapshot, error) in
//                self.promise.removeAll()
                
                if let snapshot {
                    print("++++", self.groups)
                    var temp = [Group]()
                    for document in snapshot.documents {
                        let docData = document.data()
                        let groupName: String = docData["groupName"] as? String ?? ""
                        let groupImage: String = docData["groupImage"] as? String ?? ""
                        let host: String = docData["host"] as? String ?? ""
                        let code: String = docData["code"] as? String ?? ""
//                        let userList: [String] = docData["userList"] as? [String] ?? []
//                        let promiseList: [String] = docData["promiseList"] as? [String] ?? []
                        
                        let group: Group = Group(groupName: groupName, groupImage: groupImage, host: host, code: code, userList: [], promiseList: [])
                        
                        temp.append(group)
                    }
                    print("++++", self.groups)
                    self.groups = temp
                }
            }
    }
    
    //그룹 이름 수정 - U
    func updateGroupName(groupId: String, groupName: String) async {
        do {
            try await database.collection("Group")
                .document("\(groupId)")
                .updateData([
                    "groupName" : groupName
                ])
        } catch {
            print(error)
        }
    }
    
    //그룹 호스트 수정 - U
    func updateHost(host: String, groupId: String) async {
        do {
            try await database.collection("Group")
                .document("\(groupId)")
                .updateData([
                    "host" : host
                ])
        } catch {
            print(error)
        }
    }
    
    //그룹 삭제 - D
    func deleteGroup(groupId: String) async {
        do {
            try await database.collection("Group")
                .document("\(groupId)")
                .delete()
        } catch {
            print(error)
        }
    }
    
}
