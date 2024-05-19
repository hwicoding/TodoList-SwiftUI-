//
//  ContentView.swift
//  TodoListSwiftUI
//
//  Created by HWI on 5/14/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var todoLists: [TodoList] = [TodoList(items: "꽃 선물 준비")]
    @State var isAlert: Bool = false
    @State var userInput: String = ""
    
    var body: some View {
        
        // 내비게이션 뷰 시작
        NavigationView(content: {
            // 리스트 시작
            List(content: {
                // todoLists 배열의 각 요소에 대해 반복
                ForEach(todoLists, content: { todo in
                    // BasicImageRow 뷰 생성 및 전달
                    BasicImageRow(todolist: todo)
                })
                // 삭제 기능 수행
                .onDelete(perform: { indexSet in
                    // deleteItem 함수 호출
                    deleteItem(at: indexSet)
                })
            }) // List
            .navigationTitle("Main View")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing, content: {
                    Image(systemName: "plus.circle")
                        .onTapGesture(perform: {
                            isAlert.toggle()
                        })
                        .sheet(isPresented: $isAlert, content: {
                            VStack(content: {
                                Text("추가할 내용을 입력하세요.")
                                    .bold()
                                    .padding()
                                
                                TextField("추가할 내용을 입력", text: $userInput)
                                    .padding()
                                    .textFieldStyle(.roundedBorder)
                                
                                Button("OK", action: {
                                    isAlert.toggle()
                                    if userInput != ""{
                                        todoLists.append(TodoList(items: userInput))
                                    }
                                    userInput = ""
                                })
                            }) // VStack
                        }) // sheet
                }) // ToolbarItem
            }) // toolbar
        }) // NavigationView
        
    } // body
    
    // --- Functions ---
    func deleteItem(at offsets: IndexSet){
        todoLists.remove(atOffsets: offsets)
    }
    
} // End

struct BasicImageRow: View {
    
    var todolist: TodoList
    
    var body: some View {
        HStack(content: {
            Image(systemName: "house.circle")
                .font(.system(size: 40))
            Text(todolist.items)
                .bold()
        })
    }
}

#Preview {
    ContentView()
}
