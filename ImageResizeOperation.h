
@class ImageResizeOperation;

@protocol ImageResizeOperationDelegate <NSObject>
@optional
- (void)onImageResizeOperationDone:(ImageResizeOperation *)operation;
- (void)onImageResizeOperationCancelled:(ImageResizeOperation *)operation;
@end

@interface ImageResizeOperation : NSOperation {
	
	__weak id <ImageResizeOperationDelegate> _delegate;
}

@property (nonatomic, weak) id <ImageResizeOperationDelegate> delegate;
@property (nonatomic, retain) UIImage *croppedImage;
@property (nonatomic, retain) NSString *imageURL;

- (id)initWithImage:(UIImage *)image cropSize:(CGSize)cropSize;

@end
