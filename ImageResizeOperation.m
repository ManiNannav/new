#import "ImageResizeOperation.h"

@interface ImageResizeOperation () <NSXMLParserDelegate>
@property (nonatomic, strong) UIImage *imageToCrop;
@property (nonatomic, assign) CGSize cropSize;
@end


@implementation ImageResizeOperation

// -------------------------------------------------------------------------------
//	initWithData:
// -------------------------------------------------------------------------------

- (id)initWithImage:(UIImage *)image cropSize:(CGSize)cropSize
{
	//ALog(@"Started Parsing");
    self = [super init];
    if (self != nil)
    {
        self.imageToCrop = image;
		self.cropSize = cropSize;
    }
    return self;
}

// -------------------------------------------------------------------------------
//	main
//  Entry point for the operation.
//  Given data to parse, use NSXMLParser and process all the top paid apps.
// -------------------------------------------------------------------------------

- (void)main
{
	@autoreleasepool {
		self.croppedImage = [self.imageToCrop resizedImageWithSize:self.cropSize];
		if (self.isCancelled) {
			if ([(NSObject *)self.delegate respondsToSelector:@selector(onImageResizeOperationCancelled:)]) {
				[(NSObject *)self.delegate performSelectorOnMainThread:@selector(onImageResizeOperationCancelled:) withObject:self waitUntilDone:NO];
			}
		}
		if ([(NSObject *)self.delegate respondsToSelector:@selector(onImageResizeOperationDone:)]) {
			[(NSObject *)self.delegate performSelectorOnMainThread:@selector(onImageResizeOperationDone:) withObject:self waitUntilDone:NO];
		}
		//ALog(@"%@ :::: Image Resize Done", self.imageURL);
	}
}

@end
