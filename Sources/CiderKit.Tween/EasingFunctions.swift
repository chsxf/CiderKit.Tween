import Foundation

// Source: https://easings.net
internal struct EasingFunctions {

    // function easeInSine(x: number): number {
    //   return 1 - Math.cos((x * Math.PI) / 2);
    // }
    static func inSine(_ x: Float) -> Float { 1.0 - cos((x * .pi) / 2.0) }

    // function easeOutSine(x: number): number {
    //   return Math.sin((x * Math.PI) / 2);
    // }
    static func outSine(_ x: Float) -> Float { sin((x * .pi) / 2.0) }

    // function easeInOutSine(x: number): number {
    //   return -(Math.cos(Math.PI * x) - 1) / 2;
    // }
    static func inOutSine(_ x: Float) -> Float { -(cos(x * .pi) - 1.0) / 2.0 }

    // function easeInCubic(x: number): number {
    //   return x * x * x;
    // }
    static func inCubic(_ x: Float) -> Float { pow(x, 3.0) }

    // function easeOutCubic(x: number): number {
    //   return 1 - Math.pow(1 - x, 3);
    // }
    static func outCubic(_ x: Float) -> Float { 1.0 - pow(1.0 - x, 3.0) }

    // function easeInOutCubic(x: number): number {
    //   return x < 0.5 ? 4 * x * x * x : 1 - Math.pow(-2 * x + 2, 3) / 2;
    // }
    static func inOutCubic(_ x: Float) -> Float {
        if x < 0.5 {
            return 4 * pow(x, 3.0)
        }
        return 1.0 - pow(-2.0 * x + 2.0, 3.0) / 2.0
    }

    // function easeInQuint(x: number): number {
    //   return x * x * x * x * x
    // }
    static func inQuint(_ x: Float) -> Float { pow(x, 5.0) }

    // function easeOutQuint(x: number): number {
    //   return 1 - Math.pow(1 - x, 5);
    // }
    static func outQuint(_ x: Float) -> Float { 1.0 - pow(1.0 - x, 5.0) }

    // function easeInOutQuint(x: number): number {
    //   return x < 0.5 ? 16 * x * x * x * x * x : 1 - Math.pow(-2 * x + 2, 5) / 2;
    // }
    static func inOutQuint(_ x: Float) -> Float {
        if x < 0.5 {
            return 16 * pow(x, 5.0)
        }
        return 1.0 - pow(-2.0 * x + 2, 5.0) / 2.0
    }

    // function easeInCirc(x: number): number {
    //   return 1 - Math.sqrt(1 - Math.pow(x, 2));
    // }
    static func inCirc(_ x: Float) -> Float {
        1.0 - sqrt(1.0 - pow(x, 2.0))
    }

    // function easeOutCirc(x: number): number {
    //   return Math.sqrt(1 - Math.pow(x - 1, 2))
    // }
    static func outCirc(_ x: Float) -> Float {
        sqrt(1.0 - pow(x - 1.0, 2.0))
    }

    // function easeInOutCirc(x: number): number {
    //   return x < 0.5
    //     ? (1 - Math.sqrt(1 - Math.pow(2 * x, 2))) / 2
    //     : (Math.sqrt(1 - Math.pow(-2 * x + 2, 2)) + 1) / 2;
    // }
    static func inOutCirc(_ x: Float) -> Float {
        if x < 0.5 {
            return (1.0 - sqrt(1.0 - pow(x * 2.0, 2.0))) / 2.0
        }
        return (sqrt(1.0 - pow(x * -2.0 + 2.0, 2.0)) + 1.0) / 2.0
    }

    // function easeInElastic(x: number): number {
    //   const c4 = (2 * Math.PI) / 3;
    //   return x === 0
    //     ? 0
    //     : x === 1
    //       ? 1
    //       : -Math.pow(2, 10 * x - 10) * Math.sin((x * 10 - 10.75) * c4);
    // }
    static func inElastic(_ x: Float) -> Float {
        let c4: Float = (.pi * 2.0 / 3.0)
        if x == 0 {
            return 0
        }
        if x == 1 {
            return 1
        }
        return -pow(2.0, x * 10.0 - 10.0) * sin((x * 10.0 - 10.75) * c4)
    }

    // function easeOutElastic(x: number): number {
    //   const c4 = (2 * Math.PI) / 3;
    //   return x === 0
    //     ? 0
    //     : x === 1
    //       ? 1
    //       : Math.pow(2, -10 * x) * Math.sin((x * 10 - 0.75) * c4) + 1;
    // }
    static func outElastic(_ x: Float) -> Float {
        let c4: Float = (.pi * 2.0) / 3.0
        if x == 0 {
            return 0
        }
        if x == 1 {
            return 1
        }
        return pow(2, x * -10.0) * sin((x * 10.0 - 0.75) * c4) + 1
    }

    // function easeInOutElastic(x: number): number {
    //   const c5 = (2 * Math.PI) / 4.5;
    //   return x === 0
    //     ? 0
    //     : x === 1
    //       ? 1
    //       : x < 0.5
    //         ? -(Math.pow(2, 20 * x - 10) * Math.sin((20 * x - 11.125) * c5)) / 2
    //         : (Math.pow(2, -20 * x + 10) * Math.sin((20 * x - 11.125) * c5)) / 2 + 1;
    // }
    static func inOutElastic(_ x: Float) -> Float {
        let c5: Float = (.pi * 2.0) / 4.5
        if x == 0 {
            return 0
        }
        if x == 1 {
            return 1
        }
        if x < 0.5 {
            return -(pow(2.0, x * 20.0 - 10) * sin((x * 20.0 - 11.125) * c5)) / 2.0
        }
        return (pow(2.0, x * -20.0 + 10.0) * sin((x * 20.0 - 11.125) * c5)) / 2.0 + 1.0
    }

    // function easeInQuad(x: number): number {
    //   return x * x;
    // }
    static func inQuad(_ x: Float) -> Float { pow(x, 2.0) }

    // function easeOutQuad(x: number): number {
    //   return 1 - (1 - x) * (1 - x);
    // }
    static func outQuad(_ x: Float) -> Float { 1.0 - pow(1.0 - x, 2.0) }

    // function easeInOutQuad(x: number): number {
    //   return x < 0.5 ? 2 * x * x : 1 - Math.pow(-2 * x + 2, 2) / 2;
    // }
    static func inOutQuad(_ x: Float) -> Float {
        if x < 0.5 {
            return 2.0 * pow(x, 2.0)
        }
        return 1.0 - pow(x * -2.0 + 2.0, 2.0) / 2.0
    }

    // function easeInQuart(x: number): number {
    //   return x * x * x * x;
    // }
    static func inQuart(_ x: Float) -> Float { pow(x, 4.0) }

    // function easeOutQuart(x: number): number {
    //   return 1 - Math.pow(1 - x, 4);
    // }
    static func outQuart(_ x: Float) -> Float { 1.0 - pow(1.0 - x, 4.0) }

    // function easeInOutQuart(x: number): number {
    //   return x < 0.5 ? 8 * x * x * x * x : 1 - Math.pow(-2 * x + 2, 4) / 2;
    // }
    static func inOutQuart(_ x: Float) -> Float {
        if x < 0.5 {
            return 8.0 * pow(x, 4.0)
        }
        return 1.0 - pow(x * -2.0 + 2.0, 4.0) / 2.0
    }

    // function easeInExpo(x: number): number {
    //   return x === 0 ? 0 : Math.pow(2, 10 * x - 10);
    // }
    static func inExpo(_ x: Float) -> Float {
        if x == 0 {
            return 0
        }
        return pow(2.0, x * 10.0 - 10.0)
    }

    // function easeOutExpo(x: number): number {
    //   return x === 1 ? 1 : 1 - Math.pow(2, -10 * x);
    // }
    static func outExpo(_ x: Float) -> Float {
        if x == 1 {
            return 1
        }
        return 1.0 - pow(2.0, x * -10.0)
    }

    // function easeInOutExpo(x: number): number {
    //   return x === 0
    //     ? 0
    //     : x === 1
    //       ? 1
    //       : x < 0.5
    //          ? Math.pow(2, 20 * x - 10) / 2
    //          : (2 - Math.pow(2, -20 * x + 10)) / 2;
    // }
    static func inOutExpo(_ x: Float) -> Float {
        if x == 0 {
            return 0
        }
        if x == 1 {
            return 1
        }
        if x < 0.5 {
            return pow(2.0, x * 20.0 - 10.0) / 2.0
        }
        return (2.0 - pow(2.0, x * -20.0 + 10.0)) / 2.0
    }

    // function easeInBack(x: number): number {
    //   const c1 = 1.70158;
    //   const c3 = c1 + 1;
    //   return c3 * x * x * x - c1 * x * x;
    // }
    static func inBack(_ x: Float) -> Float {
        let c1: Float = 1.70158
        let c3 = c1 + 1.0
        return c3 * pow(x, 3.0) - c1 * pow(x, 2.0)
    }

    // function easeOutBack(x: number): number {
    //   const c1 = 1.70158;
    //   const c3 = c1 + 1;
    //   return 1 + c3 * Math.pow(x - 1, 3) + c1 * Math.pow(x - 1, 2);
    // }
    static func outBack(_ x: Float) -> Float {
        let c1: Float = 1.70158
        let c3 = c1 + 1.0
        return 1.0 + c3 * pow(x - 1.0, 3.0) + c1 * pow(x - 1.0, 2.0)
    }

    // function easeInOutBack(x: number): number {
    //   const c1 = 1.70158;
    //   const c2 = c1 * 1.525;
    //   return x < 0.5
    //     ? (Math.pow(2 * x, 2) * ((c2 + 1) * 2 * x - c2)) / 2
    //     : (Math.pow(2 * x - 2, 2) * ((c2 + 1) * (x * 2 - 2) + c2) + 2) / 2;
    // }
    static func inOutBack(_ x: Float) -> Float {
        let c1: Float = 1.70158
        let c2 = c1 * 1.525
        if x < 0.5 {
            return (pow(x * 2.0, 2.0) * ((c2 + 1.0) * 2.0 * x - c2)) / 2.0
        }
        return (pow(x * 2.0 - 2.0, 2.0) * ((c2 + 1.0) * (x * 2.0 - 2.0) + c2) + 2.0) / 2.0
    }

    // function easeInBounce(x: number): number {
    //   return 1 - easeOutBounce(1 - x);
    // }
    static func inBounce(_ x: Float) -> Float { 1.0 - outBounce(1.0 - x) }

    // function easeOutBounce(x: number): number {
    //   const n1 = 7.5625;
    //   const d1 = 2.75;
    //   if (x < 1 / d1) {
    //     return n1 * x * x;
    //   } else if (x < 2 / d1) {
    //     return n1 * (x -= 1.5 / d1) * x + 0.75;
    //   } else if (x < 2.5 / d1) {
    //     return n1 * (x -= 2.25 / d1) * x + 0.9375;
    //   } else {
    //     return n1 * (x -= 2.625 / d1) * x + 0.984375;
    //   }
    // }
    static func outBounce(_ x: Float) -> Float {
        let n1: Float = 7.5625
        let d1: Float = 2.75
        if x < 1.0 / d1 {
            return n1 * pow(x, 2.0)
        }
        if x < 2.0 / d1 {
            let diminishedX = x - (1.5 / d1)
            return n1 * pow(diminishedX, 2.0) + 0.75
        }
        if x < 2.5 / d1 {
            let diminishedX = x - (2.25 / d1)
            return n1 * pow(diminishedX, 2.0) + 0.9375
        }
        let diminishedX = x - (2.625 / d1)
        return n1 * pow(diminishedX, 2.0) + 0.984375
    }

    // function easeInOutBounce(x: number): number {
    //   return x < 0.5
    //     ? (1 - easeOutBounce(1 - 2 * x)) / 2
    //     : (1 + easeOutBounce(2 * x - 1)) / 2;
    // }
    static func inOutBounce(_ x: Float) -> Float {
        if x < 0.5 {
            return (1.0 - outBounce(1.0 - x * 2.0)) / 2.0
        }
        return (1.0 + outBounce(x * 2.0 - 1.0)) / 2.0
    }

    static func linear(_ x: Float) -> Float { x }

}
