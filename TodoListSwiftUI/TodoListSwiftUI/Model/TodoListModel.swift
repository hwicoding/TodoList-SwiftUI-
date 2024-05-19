//
//  TodoListModel.swift
//  TodoListSwiftUI
//
//  Created by HWI on 5/14/24.
//

import Foundation

struct TodoListModel{
    var id = UUID()
    var item: String
    // 불러올때 항상 orderby 통해서 오름차순으로 가져올것
    var status: Int // 미완료 : 0, 완료 : 1
}
