import Foundation

protocol Filter
{
    func apply(image: RGBAImage) -> RGBAImage
}

public class PixelFilter : Filter
{
    public init()
    {}
    
    init(paramArray: Array<Int>)
    {}
    
    public func setAdjustment(paramArray: Array<Int>)
    {}
    
    public func apply(image: RGBAImage) -> RGBAImage
    {
        var alteredImage = image
        for nI in 0...(alteredImage.height - 1)
        {
            for nJ in 0...(alteredImage.width - 1)
            {
                let idx = (nI * alteredImage.width) + nJ
                alteredImage.pixels[idx] = filter(image.pixels[idx])
            }
        }
        return alteredImage
    }
    
    func filter(pix : Pixel) -> Pixel
    {
        let alteredPixel = pix
        return alteredPixel
    }
    
    func limitVal(v: Int) -> Int
    {
        return max(0, min(v, 255))
    }
}

public class BrightnessFilter : PixelFilter
{
    var nAdjustment = 0
    
    public override init()
    {
        super.init()
    }
    
    public override init(paramArray: Array<Int>)
    {
        super.init()
        nAdjustment = paramArray[0]
    }
    
    override public func setAdjustment(paramArray: Array<Int>)
    {
       nAdjustment = paramArray[0]
    }
    
    override func filter(pix : Pixel) -> Pixel
    {
        var alteredPixel = pix
        
        let red = limitVal(Int(pix.red) + nAdjustment)
        let blue = limitVal(Int(pix.blue) + nAdjustment)
        let green = limitVal(Int(pix.green) + nAdjustment)
        
        alteredPixel.red = UInt8(red)
        alteredPixel.blue = UInt8(blue)
        alteredPixel.green = UInt8(green)
        
        return alteredPixel
    }
}

public class ColorChannelFilter : PixelFilter
{
    var nRedValue = 0
    var nGreenValue = 0
    var nBlueValue = 0
    
    public override init()
    {
        super.init()
    }
    
    public override init(paramArray: Array<Int>)
    {
        super.init()
        nRedValue = paramArray[0]
        nGreenValue = paramArray[1]
        nBlueValue = paramArray[2]
    }
    
    override public func setAdjustment(paramArray: Array<Int>)
    {
        nRedValue = paramArray[0]
        nGreenValue = paramArray[1]
        nBlueValue = paramArray[2]
    }
    
    override func filter(pix : Pixel) -> Pixel
    {
        var alteredPixel = pix
        
        let red = limitVal(Int(pix.red) * (nRedValue / 255))
        let blue = limitVal(Int(pix.blue) * (nBlueValue / 255))
        let green = limitVal(Int(pix.green) * (nGreenValue / 255))
        
        alteredPixel.red = UInt8(red)
        alteredPixel.blue = UInt8(blue)
        alteredPixel.green = UInt8(green)
        
        return alteredPixel
    }
}

public class TransparencyFilter : PixelFilter
{
    var nAdjustment = 0
    
    public override init()
    {
        super.init()
    }
    
    public override init(paramArray: Array<Int>)
    {
        super.init()
        nAdjustment = paramArray[0]
    }
    
    override public func setAdjustment(paramArray: Array<Int>)
    {
        nAdjustment = paramArray[0]
    }
    
    override func filter(pix : Pixel) -> Pixel
    {
        var alteredPixel = pix
        
        let alpha = limitVal(nAdjustment)
        
        alteredPixel.alpha = UInt8(alpha)
        
        return alteredPixel
    }
}