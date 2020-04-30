@testable import Csecp256k1
import XCTest

final class Csecp256k1Tests: XCTestCase {
    func test_sign() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let flag = UInt32(SECP256K1_CONTEXT_SIGN | SECP256K1_CONTEXT_VERIFY)
        guard let ctx = secp256k1_context_create(flag) else { fatalError() }

        var rand = UInt8.random(in: 0 ... UInt8.max)
        _ = secp256k1_context_randomize(ctx, &rand)

        var signature = secp256k1_ecdsa_signature()
        var msg: [UInt8] = [226, 47, 115, 117, 117, 89, 26, 117, 107, 117, 216, 177, 118, 0, 164, 55, 186, 97, 107, 222, 73, 226, 184, 113, 96, 98, 123, 28, 179, 7, 28, 27]

        var key: [UInt8] = [56, 216, 176, 1, 120, 117, 103, 168, 136, 129, 161, 122, 140, 146, 175, 173, 185, 61, 5, 156, 177, 66, 233, 251, 240, 94, 129, 106, 82, 179, 39, 139]

        let status = secp256k1_ecdsa_sign(ctx, &signature, &msg, &key, secp256k1_nonce_function_rfc6979, nil)

        XCTAssertEqual(status, 1)

        var siglen = 74
        var sig = [UInt8](repeating: 0, count: siglen)
        secp256k1_ecdsa_signature_serialize_der(ctx, &sig, &siglen, &signature)
        let der = sig.rstrip(0).hex()

        let want = "304402207f6d4231f9c37749551ee23ab9d65236da32fe879a32319923eb5f81857e2c11022023d530ffc6eeea7e51e2ac43f8178684f110a26644b0dbf4d56c84b52001f7ab"
        XCTAssertEqual(der, want)
    }

    static var allTests = [
        ("test_sign", test_sign),
    ]
}

extension Array where Element == UInt8 {
    mutating func rstrip(_ elem: Element) -> Self {
        while let last = self.last, last == elem {
            self.removeLast()
        }
        return self
    }

    mutating func lstrip(_ elem: Element) -> Self {
        while let first = self.first, first == elem {
            self.removeFirst()
        }
        return self
    }

    func hex() -> String {
        self.map { String(format: "%02x", $0) }.reduce("", +)
    }
}
