//
//  XPhotoPickerView.m
//  photoPicker
//
//  Created by Chensh on 15/6/13.
//  Copyright (c) 2015年 Chensh. All rights reserved.
//

#import "XPhotoPickerView.h"

const float XPP_MarginOfImageView = 10.0f;

@interface XPhotoPickerView ()
{
    NSMutableArray *_imgViewArr;
    int numberPreLines;
}
@end

@implementation XPhotoPickerView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageWidth = 80.0f;
        self.imageHeight = 80.0f;
        numberPreLines = frame.size.width / self.imageWidth;
        _imgViewArr = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)destroySubViews
{
    int count = (int)[[self subviews] count];
    for (int i = 0; i < count; i++) {
        UIImageView *imageView = [[self subviews] firstObject];
        [imageView removeFromSuperview];
    }
    [_imgViewArr removeAllObjects];
}

- (UIImageView*)imageViewWithImageIndex:(NSInteger)index
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(index * (_imageWidth + XPP_MarginOfImageView), XPP_MarginOfImageView + [self linesOfIndex:index] * (XPP_MarginOfImageView + _imageHeight), _imageWidth, _imageHeight)];
    imageView.image = [self.dataSource xPhotoPickerView:self imageForIndex:index];
    imageView.tag = index;
    [imageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageViewDidTouch:)]];
    return imageView;
}

- (void)reloadData
{
    [self destroySubViews];
    int count = (int)[self.dataSource xPhotoPickerViewImageCount:self];
    for (int i = 0; i < count; i++) {
        UIImageView *imageView = [self imageViewWithImageIndex:i];
        [self addSubview:imageView];
        [_imgViewArr addObject:imageView];
    }
}

- (int)linesOfIndex:(NSInteger)index
{
    return (int)index / numberPreLines;
}

- (void)imageViewDidTouch:(id)sender
{
    
}


@end
