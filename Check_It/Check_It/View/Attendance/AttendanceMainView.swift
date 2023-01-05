//
//  Tab2MainView.swift
//  Check_It
//
//  Created by 최한호 on 2023/01/05.
//

import SwiftUI

struct AttendanceMainView: View {
    var body: some View {
        ScrollView {
            VStack{
                ForEach (0..<5) { i in
                    NavigationLink(destination: MainDetailView()) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.lightGray)
                                .frame(width: .infinity, height:110)
                            HStack {
                                VStack(alignment:.leading){
                                    Text("허미니의 또구 동아리") // 동아리 이름
                                        .font(.headline)
                                        .foregroundColor(.black)
                                        .padding(.bottom, 10)
                                    HStack{
                                        HStack {
                                            Text("출석")
                                                .foregroundColor(.black)
                                            Text("3")   //출석 횟수
                                                .foregroundColor(.melon)
                                                .bold()
                                        }
                                        Divider().frame(height:20)
                                        HStack {
                                            Text("지각")
                                                .foregroundColor(.black)
                                            Text("3")   //지각 횟수
                                                .foregroundColor(.myYellow)
                                                .bold()
                                        }
                                        Divider().frame(height:20)
                                        HStack {
                                            Text("결석")
                                                .foregroundColor(.black)
                                            Text("3")   //결석 횟수
                                                .foregroundColor(.myRed)
                                                .bold()
                                        }
                                    }
                                }
                                Spacer()
                            }
                            .padding(.leading, 20)
                        }
                        .padding(.vertical,10)
                    }
                }
            }
            .padding(.horizontal, 30)
        }
        .navigationTitle("출석부")
        
    }
}

struct AttendanceMainView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AttendanceMainView()
        }
    }
}
