//
//  ScatterViewController.m
//  CorePlotExample
//
//  Created by Hiromasa OHNO on 2013/12/27.
//  Copyright (c) 2013年 xoyip. All rights reserved.
//

#import "ScatterViewController.h"

@interface ScatterViewController ()

@end

@implementation ScatterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    // CorePlotのセットアップ
    [self setupPlotA];
    [self setupPlotB];
}

- (void)setupPlotA
{
    CGRect rect = CGRectMake(0, 100, 320, 100);
    CPTGraphHostingView* hostingView = [[CPTGraphHostingView alloc] initWithFrame:rect];
    CPTGraph* graph = [[CPTXYGraph alloc] initWithFrame:rect];
    hostingView.hostedGraph = graph;
    
    CPTScatterPlot* plot = [[CPTScatterPlot alloc] init];
    plot.identifier = @"A";
    plot.dataSource = self;
    [graph addPlot:plot];
    
    CPTXYPlotSpace* space = (CPTXYPlotSpace*)graph.defaultPlotSpace;
    space.yRange = [CPTPlotRange plotRangeWithLocation:CPTDecimalFromInt(0) length:CPTDecimalFromInt(100)];
    space.xRange = [CPTPlotRange plotRangeWithLocation:CPTDecimalFromInt(0) length:CPTDecimalFromInt(19)];
    [self.view addSubview:hostingView];
    
    // プロット用データのセットアップ
    _dataA.clear();
    for(int i=0; i<20; ++i){
        _dataA.push_back(rand()%100);
    }
}

- (void)setupPlotB
{
    CGRect rect = CGRectMake(0, 210, 320, 200);
    CPTGraphHostingView* hostingView = [[CPTGraphHostingView alloc] initWithFrame:rect];
    CPTGraph* graph = [[CPTXYGraph alloc] initWithFrame:rect];
    hostingView.hostedGraph = graph;
    
    CPTScatterPlot* plot = [[CPTScatterPlot alloc] init];
    plot.identifier = @"B";
    plot.dataSource = self;
    [graph addPlot:plot];
    
    CPTXYPlotSpace* space = (CPTXYPlotSpace*)graph.defaultPlotSpace;
    space.yRange = [CPTPlotRange plotRangeWithLocation:CPTDecimalFromInt(0) length:CPTDecimalFromInt(100)];
    space.xRange = [CPTPlotRange plotRangeWithLocation:CPTDecimalFromInt(0) length:CPTDecimalFromInt(19)];
    [self.view addSubview:hostingView];
    
    // プロット用データのセットアップ
    _dataB.clear();
    for(int i=0; i<20; ++i){
        _dataB.push_back(rand()%50);
    }
    
    // いろいろ設定
    graph.plotAreaFrame.paddingBottom = 50;
    graph.plotAreaFrame.paddingLeft = 50;
    graph.plotAreaFrame.paddingTop = 10;
    graph.plotAreaFrame.paddingRight = 10;
    
    // 軸の設定
    CPTXYAxisSet* axisSet = (CPTXYAxisSet*)graph.axisSet;
    CPTMutableLineStyle* style = [CPTMutableLineStyle lineStyle];
    style.lineColor = [CPTColor orangeColor];
    style.lineWidth = 2;
    axisSet.xAxis.axisLineStyle = style;
    axisSet.yAxis.axisLineStyle = style;
    
    CPTXYAxis* xAxis = axisSet.xAxis;
    xAxis.majorIntervalLength = CPTDecimalFromInt(5);
    
    NSNumberFormatter* tickFormatter = [[NSNumberFormatter alloc] init];
    [tickFormatter setGeneratesDecimalNumbers:NO];
    [tickFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    xAxis.labelFormatter = tickFormatter;
    
    xAxis.title = @"X軸";
    
    CPTXYAxis* yAxis = axisSet.yAxis;
    yAxis.majorIntervalLength = CPTDecimalFromInt(20);
    
    yAxis.title = @"Y軸";
    
    // プロットの設定
    plot.dataLineStyle = nil;
    plot.plotSymbol = [CPTPlotSymbol diamondPlotSymbol];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSNumber *)numberForPlot:(CPTPlot *)plot field:(NSUInteger)fieldEnum recordIndex:(NSUInteger)idx
{
    NSNumber* num;
    switch (fieldEnum) {
        case CPTScatterPlotFieldX:
            num = [NSNumber numberWithInt:idx];
            break;
        case CPTScatterPlotFieldY:
            // plot.identifierで分岐することで、2種類以上のグラフを同じDataSourceクラスで書くことができる
            if([(NSString*)plot.identifier isEqualToString:@"A"]){
                num = [NSNumber numberWithInt:_dataA[idx]];
            }else{
                num = [NSNumber numberWithInt:_dataB[idx]];
            }
            break;
    }
    return num;
}

- (NSUInteger)numberOfRecordsForPlot:(CPTPlot *)plot
{
    if([(NSString*)plot.identifier isEqualToString:@"A"]){
        return (int)_dataA.size();
    }
    return (int)_dataB.size();
}

@end
