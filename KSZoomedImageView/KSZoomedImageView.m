//
//  KSZoomedImageView.m
//  KSZoomedImageView
//
//  Created by Steve on 2016-10-18.
//  Copyright © 2016 Steve. All rights reserved.
//

#import "KSZoomedImageView.h"

//Change zoomed scale
#define MIN_ZOOMED 1.0f
#define MAX_ZOOMED 4.0f

@interface KSZoomedImageView() <UIScrollViewDelegate>

@property (strong, nonatomic) UIImageView *zoomImageView;

@end

@implementation KSZoomedImageView

# pragma mark - Initializations -

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self setup];
        
    }
    
    return self;
    
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        
        [self setup];
        
    }
    
    return self;
    
}

- (void)setup {
    
    self.showsVerticalScrollIndicator = NO;
    
    self.showsHorizontalScrollIndicator = NO;
    
    self.bouncesZoom = YES;
    
    self.decelerationRate = UIScrollViewDecelerationRateFast;
    
    self.delegate = self;
    
    self.scrollEnabled = NO;
    
    self.minimumZoomScale = MIN_ZOOMED;
    
    self.maximumZoomScale = MAX_ZOOMED;
    
    _zoomImageView = [[UIImageView alloc] init];
    
    [self addSubview:_zoomImageView];
    
}

# pragma mark - Overrides -

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    [self centerScrollViewContents];
    
}

# pragma mark - Public -

- (void)setImageOnImageView:(UIImage *)image withContentMode:(UIViewContentMode)contentMode {
    
    // reset scroll view and image view to the original position
    
    _zoomImageView.transform = CGAffineTransformIdentity;
    
    self.contentSize = CGSizeZero;
    
    self.contentOffset = CGPointMake(0, 0);
    
    CGFloat sizeWidth = (image.size.width > self.frame.size.width) ? self.frame.size.width : image.size.width;
    
    [_zoomImageView setImage:image];
    
    [_zoomImageView setFrame:CGRectMake(0, 0, sizeWidth, self.frame.size.height)];
    
    [_zoomImageView setContentMode:contentMode];
    
    [self centerScrollViewContents];
    
}

# pragma mark - Private -

- (void)centerScrollViewContents {
    
    CGSize boundsSize = self.bounds.size;
    
    CGRect contentsFrame = self.zoomImageView.frame;
    
    if (contentsFrame.size.width < boundsSize.width) {
        
        contentsFrame.origin.x = (boundsSize.width - contentsFrame.size.width) / 2.0f;
        
    } else {
        
        contentsFrame.origin.x = 0.0f;
        
    }
    
    if (contentsFrame.size.height < boundsSize.height) {
        
        contentsFrame.origin.y = (boundsSize.height - contentsFrame.size.height) / 2.0f;
        
    } else {
        
        contentsFrame.origin.y = 0.0f;
        
    }
    
    self.zoomImageView.frame = contentsFrame;
    
}

# pragma mark - Scroll View Delegate -

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    
    return self.zoomImageView;
    
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    
    [self centerScrollViewContents];
    
}

@end
