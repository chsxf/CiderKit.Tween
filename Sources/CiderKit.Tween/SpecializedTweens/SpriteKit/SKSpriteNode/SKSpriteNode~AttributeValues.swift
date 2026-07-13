import SpriteKit

public extension SKSpriteNode {

    /// Tweens the `Float` value of an attribute of a `SKSpriteNode` instance
    ///
    /// - Parameters:
    ///     - key: Name of the attribute
    ///     - travel: Description of the starting and ending values for the tween
    ///     - options: Options for this tween
    ///     - setupUpdate: If set, the tween updated the position of the `SKNode` instance automatically
    func tweenAttributeValue(named key: String, _ travel: TweenSimpleTravel<Float>, options: TweenOptions, setupUpdate: Bool = true) async -> Tween<Float> {
        let detailedTravel = travel.toDetailedTravel(
            deferredFrom: { await MainActor.run { self.value(forAttributeNamed: key)?.floatValue ?? 0 } },
            relativeAccessorFactory: { by in { from in from + by }}
        )
        let tween = await Float.tween(detailedTravel, options: options)
        if setupUpdate {
            Task {
                for await updatedAttributeValue in await tween.onUpdate {
                    await MainActor.run { self.setValue(SKAttributeValue(float: updatedAttributeValue), forAttribute: key) }
                }
            }
        }
        return tween
    }

    /// Tweens the `vector_float2` value of an attribute of a `SKSpriteNode` instance
    ///
    /// - Parameters:
    ///     - key: Name of the attribute
    ///     - travel: Description of the starting and ending values for the tween
    ///     - options: Options for this tween
    ///     - setupUpdate: If set, the tween updated the position of the `SKNode` instance automatically
    func tweenAttributeValue(named key: String, _ travel: TweenSimpleTravel<SIMD2<Float>>, options: TweenOptions, setupUpdate: Bool = true) async -> Tween<SIMD2<Float>> {
        let detailedTravel = travel.toDetailedTravel(
            deferredFrom: { await MainActor.run { self.value(forAttributeNamed: key)?.vectorFloat2Value ?? SIMD2() } },
            relativeAccessorFactory: { by in { from in from + by }}
        )
        let tween = await SIMD2<Float>.tween(detailedTravel, options: options)
        if setupUpdate {
            Task {
                for await updatedAttributeValue in await tween.onUpdate {
                    await MainActor.run { self.setValue(SKAttributeValue(vectorFloat2: updatedAttributeValue), forAttribute: key) }
                }
            }
        }
        return tween
    }

    /// Tweens the `vector_float3` value of an attribute of a `SKSpriteNode` instance
    ///
    /// - Parameters:
    ///     - key: Name of the attribute
    ///     - travel: Description of the starting and ending values for the tween
    ///     - options: Options for this tween
    ///     - setupUpdate: If set, the tween updated the position of the `SKNode` instance automatically
    func tweenAttributeValue(named key: String, _ travel: TweenSimpleTravel<SIMD3<Float>>, options: TweenOptions, setupUpdate: Bool = true) async -> Tween<SIMD3<Float>> {
        let detailedTravel = travel.toDetailedTravel(
            deferredFrom: { await MainActor.run { self.value(forAttributeNamed: key)?.vectorFloat3Value ?? SIMD3() } },
            relativeAccessorFactory: { by in { from in from + by }}
        )
        let tween = await SIMD3<Float>.tween(detailedTravel, options: options)
        if setupUpdate {
            Task {
                for await updatedAttributeValue in await tween.onUpdate {
                    await MainActor.run { self.setValue(SKAttributeValue(vectorFloat3: updatedAttributeValue), forAttribute: key) }
                }
            }
        }
        return tween
    }

    /// Tweens the `vector_float4` value of an attribute of a `SKSpriteNode` instance
    ///
    /// - Parameters:
    ///     - key: Name of the attribute
    ///     - travel: Description of the starting and ending values for the tween
    ///     - options: Options for this tween
    ///     - setupUpdate: If set, the tween updated the position of the `SKNode` instance automatically
    func tweenAttributeValue(named key: String, _ travel: TweenSimpleTravel<SIMD4<Float>>, options: TweenOptions, setupUpdate: Bool = true) async -> Tween<SIMD4<Float>> {
        let detailedTravel = travel.toDetailedTravel(
            deferredFrom: { await MainActor.run { self.value(forAttributeNamed: key)?.vectorFloat4Value ?? SIMD4() } },
            relativeAccessorFactory: { by in { from in from + by }}
        )
        let tween = await SIMD4<Float>.tween(detailedTravel, options: options)
        if setupUpdate {
            Task {
                for await updatedAttributeValue in await tween.onUpdate {
                    await MainActor.run { self.setValue(SKAttributeValue(vectorFloat4: updatedAttributeValue), forAttribute: key) }
                }
            }
        }
        return tween
    }

}
