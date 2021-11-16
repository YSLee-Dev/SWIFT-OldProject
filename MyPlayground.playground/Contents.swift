import UIKit

var array:[String] = ["0 이윤수"]

array.append("1 김정한")
array.append("2 최영민")
array.append("3 이예슬")
array.insert("4 이승민", at: 2)
array.first
array[array.startIndex]
array.last
array.removeLast()
array.sort()
array.contains{ test in
    test == "4 이승민"
}
