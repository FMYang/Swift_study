import UIKit

/**
 在swift中，错误用遵循`Error`协议的类型的值来表示。这个空协议表明该类型可用于错误处理。
 
 Swift枚举类型尤为适合构建一组相关的错误状态，枚举的关联值还可以提供错误状态的额外信息。
 */

enum APIError: Error {
    case clientError(reason: ErrorReason)
    case serviceError
}

enum ErrorReason: Error {
    case userNameIsNil
    case pwdIsNil
    case pwdError
    case userNameInvalid
    case userNameAndPwdNotMatch
}

let err = APIError.clientError(reason: .userNameIsNil)
switch err {
case .clientError(let reason):
    print("client error")
    // 通过关联值的附加信息判断具体错误类型
    switch reason {
    case .userNameIsNil:
        print("userName is nil")
    case .pwdIsNil:
        print("pwd is nil")
    case .pwdError:
        print("pwd error")
    default:
        print("other error")
    }
case .serviceError:
    print("service error")
}

/**
 抛出错误throws
 */
func login() throws {
    throw APIError.serviceError
}

/**
 处理错误
 */
//do {
//    try login()
//} catch APIError.serviceError {
//    print("service error")
//} catch {
//    print("other error")
//}

do {
    try login()
} catch {
    if let err = error as? APIError {
        switch err {
        case .serviceError:
            print("service error!")
        default:
            print(error)
        }
    }
}
