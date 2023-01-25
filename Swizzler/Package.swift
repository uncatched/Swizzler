// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Swizzler",
  platforms: [
    .iOS(.v15),
    .macOS("10.15"),
  ],
  products: [
    .library(
      name: "Swizzler",
      targets: ["Swizzler"]),
  ],
  dependencies: [],
  targets: [
    .target(
      name: "Swizzler",
      dependencies: []),
    .testTarget(
      name: "SwizzlerTests",
      dependencies: ["Swizzler"]),
  ]
)
