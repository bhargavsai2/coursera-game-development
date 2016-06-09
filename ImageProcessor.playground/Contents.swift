//: Playground - noun: a place where people can play

import UIKit

let image = UIImage(named: "sample")

// Process the image!
let originalImage = RGBAImage(image: image!)!
var alteredImage = originalImage

var processor = ImageProcessor()

/*Filters with parameters*/

alteredImage = processor.applyFilter(originalImage, strFilterName: "ColorChannelFilter", paramArray: [0,255,255])
let alteredUIImageCC1 = alteredImage.toUIImage()

alteredImage = processor.applyFilter(originalImage, strFilterName: "ColorChannelFilter", paramArray: [255,0,255])
let alteredUIImageCC2 = alteredImage.toUIImage()

alteredImage = processor.applyFilter(originalImage, strFilterName: "BrightnessFilter", paramArray: [200])
let alteredUIImageB1 = alteredImage.toUIImage()

alteredImage = processor.applyFilter(originalImage, strFilterName: "BrightnessFilter", paramArray: [100])
let alteredUIImageB2 = alteredImage.toUIImage()

alteredImage = processor.applyFilter(originalImage, strFilterName: "TransparencyFilter", paramArray: [100])
let alteredUIImageT1 = alteredImage.toUIImage()

alteredImage = processor.applyFilter(originalImage, strFilterName: "TransparencyFilter", paramArray: [50])
let alteredUIImageT2 = alteredImage.toUIImage()

/*Pipelines of Default Filters*/

alteredImage = processor.applyFilterPipeline(originalImage,
                                     filterOrder: ["Increase Brightness by 155",
                                        "Decrease Brightness by 155",
                                        "Set Transparency to 50%",
                                        "Set Transparency to 0%",
                                        "Remove Green and Red"
    ])
let alteredUIImagePipeline1 = alteredImage.toUIImage()

alteredImage = processor.applyFilterPipeline(originalImage,
                                             filterOrder: ["Increase Brightness by 155",
                                                "Remove Green and Red"
    ])
let alteredUIImagePipeline2 = alteredImage.toUIImage()

alteredImage = processor.applyFilterPipeline(originalImage,
                                             filterOrder: ["Remove Blue"])
let alteredUIImagePipeline3 = alteredImage.toUIImage()

alteredImage = processor.applyFilterPipeline(originalImage,
                                             filterOrder: ["Remove Green and Red"])
let alteredUIImagePipeline4 = alteredImage.toUIImage()

alteredImage = processor.applyFilterPipeline(originalImage,
                                             filterOrder: ["Remove Blue",
                                                "Remove Green and Red"
    ])
let alteredUIImagePipeline5 = alteredImage.toUIImage()