//
//  BarViewController.h
//  CorePlotExample
//
//  Created by Hiromasa OHNO on 2013/12/27.
//  Copyright (c) 2013年 xoyip. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CorePlot-CocoaTouch.h>
#import <vector>

@interface BarViewController : UIViewController<CPTPlotDataSource>
{
    std::vector<float> _data;
}

@end
