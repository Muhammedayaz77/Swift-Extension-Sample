import UIKit
import ImageIO

extension UIImage {
    /// Converts PNG image data to a Base64 string.
    func pngToBase64() -> String { pngData()?.base64EncodedString() ?? "" }
    /// Creates an image from a Base64 string.
    class func base64ToImage(toImage strEncodeData: String) -> UIImage? { guard let data=Data(base64Encoded:strEncodeData), let image=UIImage(data:data) else{return nil}; return image }
    /// Resizes the image while preserving aspect ratio.
    func resizeImage(targetSize: CGSize) -> UIImage { let r=min(targetSize.width/size.width,targetSize.height/size.height); let s=CGSize(width:size.width*r,height:size.height*r); UIGraphicsBeginImageContextWithOptions(s,false,scale); draw(in:CGRect(origin:.zero,size:s)); let i=UIGraphicsGetImageFromCurrentImageContext() ?? self; UIGraphicsEndImageContext(); return i }
    /// Returns a thumbnail with a maximum pixel size.
    func getThumbnailImage(maxPixelSize: Int=300) -> UIImage { let s=max(size.width,size.height); return s <= CGFloat(maxPixelSize) ? self : resizeImage(targetSize: CGSize(width:maxPixelSize,height:maxPixelSize)) }
    /// Returns the PNG representation of the image.
    func getPNGData() -> Data? { pngData() }
    /// Returns the JPEG representation at the supplied quality.
    func getJPEGData(quality: CGFloat=0.8) -> Data? { jpegData(compressionQuality:quality) }
    /// Returns the image width in points.
    func getWidth() -> CGFloat { size.width }
    /// Returns the image height in points.
    func getHeight() -> CGFloat { size.height }
    /// Returns the aspect ratio of the image.
    func getAspectRatio() -> CGFloat { size.width == 0 ? 0 : size.height/size.width }
    /// Returns a copy with a fixed size.
    func resizeToSize(_ targetSize: CGSize) -> UIImage { UIGraphicsBeginImageContextWithOptions(targetSize,false,scale); draw(in:CGRect(origin:.zero,size:targetSize)); let i=UIGraphicsGetImageFromCurrentImageContext() ?? self; UIGraphicsEndImageContext(); return i }
    /// Crops the image to a rectangle.
    func crop(to rect: CGRect) -> UIImage { guard let cg=cgImage?.cropping(to:rect) else{return self}; return UIImage(cgImage:cg,scale:scale,orientation:imageOrientation) }
    /// Returns a vertically flipped image.
    func flipVertical() -> UIImage { UIGraphicsBeginImageContextWithOptions(size,false,scale); let c=UIGraphicsGetCurrentContext()!; c.translateBy(x:0,y:size.height); c.scaleBy(x:1,y:-1); draw(at:.zero); let i=UIGraphicsGetImageFromCurrentImageContext() ?? self; UIGraphicsEndImageContext(); return i }
    /// Returns a horizontally flipped image.
    func flipHorizontal() -> UIImage { UIGraphicsBeginImageContextWithOptions(size,false,scale); let c=UIGraphicsGetCurrentContext()!; c.translateBy(x:size.width,y:0); c.scaleBy(x:-1,y:1); draw(at:.zero); let i=UIGraphicsGetImageFromCurrentImageContext() ?? self; UIGraphicsEndImageContext(); return i }
    /// Returns a tinted copy of the image.
    func tinted(with color: UIColor) -> UIImage { UIGraphicsBeginImageContextWithOptions(size,false,scale); color.set(); draw(in:CGRect(origin:.zero,size:size),blendMode:.sourceIn,alpha:1); let i=UIGraphicsGetImageFromCurrentImageContext() ?? self; UIGraphicsEndImageContext(); return i }
    /// Returns a grayscale copy of the image.
    func grayscaleImage() -> UIImage { let r=CGRect(origin:.zero,size:size); UIGraphicsBeginImageContextWithOptions(size,false,scale); draw(in:r,blendMode:.luminosity,alpha:1); let i=UIGraphicsGetImageFromCurrentImageContext() ?? self; UIGraphicsEndImageContext(); return i }
    /// Returns the image orientation.
    func getImageOrientation() -> UIImage.Orientation { imageOrientation }
    /// Returns true when the image has a valid CGImage backing.
    func hasCGImage() -> Bool { cgImage != nil }
    /// Returns a copy with rounded corners.
    func roundedImage(radius: CGFloat) -> UIImage { UIGraphicsBeginImageContextWithOptions(size,false,scale); UIBezierPath(roundedRect:CGRect(origin:.zero,size:size),cornerRadius:radius).addClip(); draw(at:.zero); let i=UIGraphicsGetImageFromCurrentImageContext() ?? self; UIGraphicsEndImageContext(); return i }
    /// Returns the image as PNG Base64 with line wrapping disabled.
    func getBase64String() -> String { pngData()?.base64EncodedString(options:[]) ?? "" }
    /// Returns a copy with transparent background outside a rounded rectangle.
    func roundedCornersImage(radius: CGFloat) -> UIImage { roundedImage(radius:radius) }
    /// Returns a copy scaled by a multiplier.
    func scaledImage(_ multiplier: CGFloat) -> UIImage { resizeToSize(CGSize(width:size.width*multiplier,height:size.height*multiplier)) }
}
