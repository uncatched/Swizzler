import Foundation

public final class Swizzler {

  public init() {}

  public func swizzle(original: Swizzler.Method, swizzled: Swizzler.Method) throws {
    let swizzledClass: AnyClass? = object_getClass(swizzled.methodClass)
    let originalClass: AnyClass? = object_getClass(original.methodClass)

    guard let swizzledMethod = class_getInstanceMethod(swizzledClass, swizzled.selector) else {
      throw SwizzleError.methodNotFound
    }

    if let originalMethod = class_getInstanceMethod(originalClass, original.selector) {
      method_exchangeImplementations(originalMethod, swizzledMethod)
    } else {
      let implementation = method_getImplementation(swizzledMethod)
      let encoding = method_getTypeEncoding(swizzledMethod)
      class_addMethod(originalClass, swizzled.selector, implementation, encoding)
    }
  }
}

extension Swizzler {
  public struct Method {
    let selector: Selector
    let methodClass: Any?

    public init(selector: Selector, methodClass: Any?) {
      self.selector = selector
      self.methodClass = methodClass
    }
  }

  public enum SwizzleError: Error {
    case methodNotFound
  }
}
