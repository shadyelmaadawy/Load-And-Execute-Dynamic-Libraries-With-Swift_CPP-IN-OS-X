//
//  main.swift
//  DyLoader
//
//  Created by Shady El-Maadawy on 26/11/2023.
//

import Foundation

typealias DyFunction = @convention(c) () -> CInt

guard let dyInstance = dlopen("./libDyInstance.dylib", RTLD_LAZY) else {
    fatalError("Cannot load instance")
}

print("Dy instance loaded at address: \(dyInstance)")

guard let dyMethodAddress = dlsym(dyInstance, "OSXVersion") else {
    fatalError("Cannot get address of method.")
}

print("Dy method address is: \(dyMethodAddress)")

let dyCasting = unsafeBitCast(dyMethodAddress, to: DyFunction.self)

print("Result of execute is: \(dyCasting())")

dlclose(dyInstance)

print("THE-END")
