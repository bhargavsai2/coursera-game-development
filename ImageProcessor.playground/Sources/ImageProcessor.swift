import Foundation

public class ImageProcessor
{
    var filterOrder = ["Increase Brightness by 155",
                          "Decrease Brightness by 155",
                          "Set Transparency to 50%",
                          "Set Transparency to 0%",
                          "Remove Green and Red",
                          "Remove Blue"
    ]
    
    var filterDictionary = ["Increase Brightness by 155": BrightnessFilter(paramArray: [155]),
                            "Decrease Brightness by 155": BrightnessFilter(paramArray: [-155]),
                            "Set Transparency to 50%": BrightnessFilter(paramArray: [127]),
                            "Set Transparency to 0%": BrightnessFilter(paramArray: [0]),
                            "Remove Green and Red": ColorChannelFilter(paramArray: [0,0,255]),
                            "Remove Blue": ColorChannelFilter(paramArray: [255,255,0]),
                            "ColorChannelFilter": ColorChannelFilter(),
                            "BrightnessFilter": BrightnessFilter(),
                            "TransparencyFilter": TransparencyFilter()]
    
    public init() {}
    
    public func applyFilterPipeline(image: RGBAImage, filterOrder: Array<String>) -> RGBAImage
    {
        var alteredImage = image
        if filterOrder.isEmpty
        {
            print("No filters assigned")
        }
        
        for strName: String in filterOrder
        {
            let val = filterDictionary[strName]!
            alteredImage = val.apply(alteredImage)
        }
        
        return alteredImage
    }
    
    
    public func applyFilter(image: RGBAImage, strFilterName: String, paramArray: Array<Int>) -> RGBAImage
    {
        var alteredImage = image
        
        let val = filterDictionary[strFilterName]!
        val.setAdjustment(paramArray)
        alteredImage = val.apply(alteredImage)
        
        return alteredImage
    }
}
