//
//  XPhotoPickerView.h
//  photoPicker
//
//  Created by Chensh on 15/6/13.
//  Copyright (c) 2015年 Chensh. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XPhotoPickerView;

@protocol XPhotoPickerViewDataSource <NSObject>

- (NSInteger)xPhotoPickerViewImageCount:(XPhotoPickerView*)pickerView;

- (UIImage*)xPhotoPickerView:(XPhotoPickerView*)pickerView imageForIndex:(NSInteger)index;

@end

@protocol XPhotoPickerViewDelegate <NSObject>

- (void)xPhotoPickerView:(XPhotoPickerView*)pickerView viewHeightDidChange:(CGFloat)height;

- (void)xPhotoPickerView:(XPhotoPickerView*)pickerView imageDidAdd:(NSArray*)imageArr;

- (void)xPhotoPickerView:(XPhotoPickerView*)pickerView imageDidDelete:(UIImage*)image;

- (void)xPhotoPickerView:(XPhotoPickerView *)pickerView imageViewDidClick:(NSInteger)index;

@end



@interface XPhotoPickerView : UIView

@property (nonatomic, weak) id<XPhotoPickerViewDelegate> delegate;

@property (nonatomic, weak) id<XPhotoPickerViewDataSource> dataSource;

@property (nonatomic, assign) CGFloat imageWidth;

@property (nonatomic, assign) CGFloat imageHeight;

@property (nonatomic, strong) NSMutableArray *imageArrary;


@end
