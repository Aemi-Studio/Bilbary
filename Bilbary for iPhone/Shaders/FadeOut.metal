//
//  FadeOut.metal
//  Bilbary for iPhone
//
//  Created by SHOHJAHON on 14/07/24.

//

#include <metal_stdlib>
using namespace metal;

[[stitchable]] half4 fadeOut(float2 pos, half4 color, float sY, float fromTop) {
    
    float progress = pos.y / sY;

    float eProgress = smoothstep(0.0, 1.0, progress);
    
    float alpha = eProgress;
    if (fromTop == true) {
        alpha = 1 - eProgress;
    }
    
    return half4(color.rgb, alpha);
    
}

