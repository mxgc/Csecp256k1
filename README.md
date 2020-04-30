# Csecp256k1

This library is intended to make up-to-date [libsecp256k1](https://github.com/bitcoin-core/secp256k1) available as a swift package. Added files are located in `Sources/    Csecp256k1/spm-compat`. I have consulted the config file in [secp256k1.swift](https://github.com/Boilertalk/secp256k1.swift). And of course, all credits for `libsecp256k1` goes to [bitcoin-core](https://github.com/bitcoin-core).

### Swift Package Manager
Add the following to the dependencies in your `Package.swift` and `"Csecp256k1"` to relevant target dependencies. And to use, simply `import Csecp256k1`.

```swift
dependencies: [
    .package(url: "https://github.com/mxgc/Csecp256k1.git", from: "0.2.0")
]
```
