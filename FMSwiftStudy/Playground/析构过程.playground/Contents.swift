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
    let b = B()
    print("\(b)")
    return
}

test()

/**
 b deinit
 a deinit
 */

class C {
    var i = 1
    deinit {
        print("c deinit")
    }
}

var c: C? = C()
c = nil
// c deinit
