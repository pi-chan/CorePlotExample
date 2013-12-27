//
//  PieViewController.h
//  CorePlotExample
//
//  Created by Hiromasa OHNO on 2013/12/27.
//  Copyright (c) 2013年 xoyip. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CorePlot/CorePlot-CocoaTouch.h>
#import <vector>

@interface PieViewController : UIViewController<CPTPieChartDataSource,CPTPieChartDelegate>
{
    std::vector<float> _data;
}

@end
