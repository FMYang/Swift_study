import UIKit

class A {
    deinit {
        print("a deinit")
    }
}

class B: A {
    deinit {
        print("b deinit")
    }
}

func test() {
    var b = B()
    return
}

test()

/**
 b deinit
 a deinit
 */
