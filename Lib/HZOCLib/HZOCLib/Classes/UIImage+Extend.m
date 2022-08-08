//
//  UIImage+Extend.m
//  BankCard
//
//  Created by XAYQ-FanXL on 16/7/8.
//  Copyright © 2016年 AN. All rights reserved.
//

#import "UIImage+Extend.h"
#import "HZFileManager.h"
@implementation UIImage (Extend)

+ (UIImage *)imageFromSampleBuffer:(CMSampleBufferRef)sampleBuffer {
    // Get a CMSampleBuffer's Core Video image buffer for the media data
    CVImageBufferRef imageBuffer = CMSampleBufferGetImageBuffer(sampleBuffer);
    // Lock the base address of the pixel buffer
    CVPixelBufferLockBaseAddress(imageBuffer, 0);
    
    // Get the number of bytes per row for the pixel buffer
    void *baseAddress = CVPixelBufferGetBaseAddress(imageBuffer);
    
    // Get the number of bytes per row for the pixel buffer
    size_t bytesPerRow = CVPixelBufferGetBytesPerRow(imageBuffer);
    // Get the pixel buffer width and height
    size_t width = CVPixelBufferGetWidth(imageBuffer);
    size_t height = CVPixelBufferGetHeight(imageBuffer);
    
    // Create a device-dependent RGB color space
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    // Create a bitmap graphics context with the sample buffer data
    CGContextRef context = CGBitmapContextCreate(baseAddress, width, height, 8, bytesPerRow, colorSpace, kCGBitmapByteOrder32Little | kCGImageAlphaPremultipliedFirst);
    // Create a Quartz image from the pixel data in the bitmap graphics context
    CGImageRef quartzImage = CGBitmapContextCreateImage(context);
    // Unlock the pixel buffer
    CVPixelBufferUnlockBaseAddress(imageBuffer,0);
    
    // Free up the context and color space
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    
    // Create an image object from the Quartz image
    //UIImage *image = [UIImage imageWithCGImage:quartzImage];
    UIImage *image = [UIImage imageWithCGImage:quartzImage scale:1.0f orientation:UIImageOrientationRight];
    
    // Release the Quartz image
    CGImageRelease(quartzImage);
    
    return (image);
}

+ (UIImage *)getImageStream:(CVImageBufferRef)imageBuffer {
    CIImage *ciImage = [CIImage imageWithCVPixelBuffer:imageBuffer];
    CIContext *temporaryContext = [CIContext contextWithOptions:nil];
    CGImageRef videoImage = [temporaryContext createCGImage:ciImage fromRect:CGRectMake(0, 0, CVPixelBufferGetWidth(imageBuffer), CVPixelBufferGetHeight(imageBuffer))];
    
    UIImage *image = [[UIImage alloc] initWithCGImage:videoImage];
    
    CGImageRelease(videoImage);
    return image;
}

+ (UIImage *)getSubImage:(CGRect)rect inImage:(UIImage*)image {
    CGImageRef subImageRef = CGImageCreateWithImageInRect(image.CGImage, rect);
    
    CGRect smallBounds = CGRectMake(0, 0, CGImageGetWidth(subImageRef), CGImageGetHeight(subImageRef));
    
    UIGraphicsBeginImageContext(smallBounds.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextDrawImage(context, smallBounds, subImageRef);
    
    UIImage* smallImage = [UIImage imageWithCGImage:subImageRef];
    CFRelease(subImageRef);
    
    UIGraphicsEndImageContext();
    
    return smallImage;
}

-(UIImage *)originalImage {
    return [self imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

-(UIImage *)imageRotation:(UIImageOrientation)orientation

{
    
    long double rotate = 0.0;
    
    CGRect rect;
    
    float translateX = 0;
    
    float translateY = 0;
    
    float scaleX = 1.0;
    
    float scaleY = 1.0;
    
    
    switch (orientation) {
            
            case UIImageOrientationLeft:
            
            rotate =M_PI_2;
            
            rect =CGRectMake(0,0,self.size.height, self.size.width);
            
            translateX=0;
            
            translateY= -rect.size.width;
            
            scaleY =rect.size.width/rect.size.height;
            
            scaleX =rect.size.height/rect.size.width;
            
            break;
            
             case UIImageOrientationRight:
            
            rotate =3 *M_PI_2;
            
            rect =CGRectMake(0,0,self.size.height, self.size.width);
            
            translateX= -rect.size.height;
            
            translateY=0;
            
            scaleY =rect.size.width/rect.size.height;
            
            scaleX =rect.size.height/rect.size.width;
            
            break;
            
            case UIImageOrientationDown:
            
            rotate =M_PI;
            
            rect =CGRectMake(0,0,self.size.width, self.size.height);
            
            translateX= -rect.size.width;
            
            translateY= -rect.size.height;
            
            break;
            
        default:
            
            rotate =0.0;
            
            rect =CGRectMake(0,0,self.size.width, self.size.height);
            
            translateX=0;
            
            translateY=0;
            
            break;
            
    }
    
    
    
     UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context =UIGraphicsGetCurrentContext();
    
     //做CTM变换
    
     CGContextTranslateCTM(context, 0.0, rect.size.height);
    
     CGContextScaleCTM(context, 1.0, -1.0);
    
     CGContextRotateCTM(context, rotate);
    
     CGContextTranslateCTM(context, translateX,translateY);
    
    
    
     CGContextScaleCTM(context, scaleX,scaleY);
    
     //绘制图片
    
     CGContextDrawImage(context, CGRectMake(0,0,rect.size.width, rect.size.height), self.CGImage);
    
    
    
    UIImage *newPic =UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newPic;
    
}

- (void)saveFaceImage {
    //获取 Document 目录路径
    NSArray *paths =NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    // 构造保存文件的名称 保存成功会返回YES
    NSString *filePath = [[paths objectAtIndex:0]stringByAppendingPathComponent:
                              [NSString stringWithFormat:@"faceId.png"]];
    //保存操作
    BOOL result =[UIImagePNGRepresentation(self)writeToFile:filePath   atomically:YES];
        if (result == YES) {
            NSLog(@"保存成功");
        }else{
        NSLog(@"保存失败");
    }
}

+ (UIImage *)getFaceImage {
 
 NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
 
 NSString *filePath = [[paths objectAtIndex:0]stringByAppendingPathComponent:
                       [NSString stringWithFormat:@"faceId.png"]];
 // 保存文件的名称
    UIImage *img = [UIImage imageWithContentsOfFile:filePath];
    return img;
    
}

+(BOOL)removeFaceImage{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    NSString *filePath = [[paths objectAtIndex:0]stringByAppendingPathComponent:
                          [NSString stringWithFormat:@"faceId.png"]];
    BOOL isRemoveFile = [HZFileManager removeItemAtPath:filePath];
    return isRemoveFile;
}

@end
