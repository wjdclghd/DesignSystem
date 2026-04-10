// swift-tools-version: 5.9
//
//  Package.swift
//  DesignSystem
//
//  Created by jch on 4/10/26.
//

import PackageDescription

let package = Package(
    name: "DesignSystem",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "DesignSystem",
            targets: ["DesignSystem"]
        )
    ],
    dependencies: [
        
    ],
    targets: [
        .target(
            name: "DesignSystem",
            dependencies: [
                
            ],
            path: "Sources/DesignSystem",
            linkerSettings: [
                
            ]
        ),
        .testTarget(
            name: "DesignSystemTests",
            dependencies: [
                "DesignSystem",
                
            ],
            path: "Tests/DesignSystemTests",
            linkerSettings: [
                
            ]
        )
    ]
)
