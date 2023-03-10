//
//  Tab1MainView.swift
//  Check_It
//
//  Created by 최한호 on 2023/01/05.
//

import SwiftUI

struct HomeMainView: View {
    
    @State var isJoiningParty: Bool = false
    @State var isAddingParty: Bool = false
    @State var currentIndex: Int = 0
    
    @StateObject var promiseStore: PromiseStore = PromiseStore()
    @StateObject var groupStore: GroupStore = GroupStore()
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("나의 모임")
                        .font(.largeTitle)
                        .bold()
                    Spacer()
                    Button {
                        isAddingParty.toggle()
                    } label: {
                        Image(systemName: "note.text.badge.plus")
                            .resizable()
                            .foregroundColor(Color("myYellow"))
                            .frame(width:30,height: 30)
                    }
                    .sheet(isPresented: $isAddingParty) {
                        NavigationStack {
                            MakeGroupModal()
                                .presentationDetents([.large])
                                .navigationTitle("모임 개설하기")
                        }
                    }
                    Button {
                        isJoiningParty.toggle()
                    } label: {
                        Image(systemName: "iphone.and.arrow.forward")
                            .resizable()
                            .foregroundColor(Color("myYellow"))
                            .frame(width:30,height: 30)
                    }
                    .sheet(isPresented: $isJoiningParty) {
                        JoinModalView()
                            .presentationDetents([.height(300)])
                        
                    }
                    .padding(.leading, 10)
                }
                .padding(.top, 30)
                .padding(.horizontal, 50)
                .offset(y:20)
                
                TabView {
                    ForEach (promiseStore.promise) { promise in
                        PartyView(promise: promise)
                    }
                }
                .tabViewStyle(.page)
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            Spacer()
        }
        .onAppear{
            promiseStore.fetchPromise()
        }
    }
}

struct HomeMainView_Previews: PreviewProvider {
    static var previews: some View {
        HomeMainView()
    }
}
