# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.4.0] - 2025-09-29

### Added 

- Specialized tween helpers for `CGColor` and `SKColor`
- Specialized tween helpers for SpriteKit most commonly used classes: `SKNode`, `SKLabelNode`, and `SKSpriteNode`

### Changed

- Tween start and end values are now describe through 'travel' enumerations to allow for simple code and greater flexibility
- Start values can now be defined in a deferred way, allowing for tweens to be created in advance independently from the values they are supposed to work with
- End values can now be defined relatively from the start value 

## [0.3.0] - 2025-08-27

### Added

- Loops
- Sequences

## [0.2.0] - 2025-08-15

### Added

- Added `String` specialized tweens

### Fixed

- Compilation on platforms other than macOS

## [0.1.0] - 2025-08-09

- Initial relase

[unreleased]: https://github.com/chsxf/CiderKit.Tween/compare/0.3.0...HEAD
[0.3.0]: https://github.com/chsxf/CiderKit.Tween/compare/0.2.0...0.3.0
[0.2.0]: https://github.com/chsxf/CiderKit.Tween/compare/0.1.0...0.2.0
[0.1.0]: https://github.com/chsxf/CiderKit.Tween/releases/tag/0.1.0
