# (PART) API overview {-}

# Panel classes {#panels}



## Overview

This chapter provides a list of all of the classes that are implemented by the core *[iSEE](https://bioconductor.org/packages/3.11/iSEE)* package.
Each class comes with its specialized implementations of methods for various generics described in Chapter \@ref(api).
Thus, it is often possible for developers to inherit from one of these classes to get most of the methods implemented "for free".
The classes themselves are either virtual or concrete; the latter can be created and used directly in an `iSEE()` application, while the former can only be used as a parent of a concrete subclass.
Here, we will provide a brief summary of each class along with a listing of its available slots.
Readers should refer to the documentation for each class (links below) for more details.

## Virtual classes

### `Panel` 

The [`Panel`](https://isee.github.io/iSEE/reference/Panel-class.html) class is the base class for all *[iSEE](https://bioconductor.org/packages/3.11/iSEE)* panels.
It provides functionality to control general panel parameters such as the panel width and height.
It also controls the transmission of multiple row/column selections across panels.


```r
slotNames(getClass("Panel"))
```

```
##  [1] "PanelId"                      "PanelHeight"                 
##  [3] "PanelWidth"                   "SelectionBoxOpen"            
##  [5] "RowSelectionSource"           "ColumnSelectionSource"       
##  [7] "DataBoxOpen"                  "RowSelectionDynamicSource"   
##  [9] "RowSelectionType"             "RowSelectionSaved"           
## [11] "ColumnSelectionDynamicSource" "ColumnSelectionType"         
## [13] "ColumnSelectionSaved"         "SelectionHistory"
```

### `DotPlot`

The [`DotPlot`](https://isee.github.io/iSEE/reference/DotPlot-class.html) class inherits from the `Panel` class and is the base class for dot-based plots.
This refers to all plots where each row or column is represented by no more than one dot/point on the plot.
It provides functionality to create the plot, control the aesthetics of the points and to manage the brush/lasso selection.


```r
slotNames(getClass("DotPlot"))
```

```
##  [1] "FacetByRow"                   "FacetByColumn"               
##  [3] "ColorBy"                      "ColorByDefaultColor"         
##  [5] "ColorByFeatureName"           "ColorByFeatureSource"        
##  [7] "ColorByFeatureDynamicSource"  "ColorBySampleName"           
##  [9] "ColorBySampleSource"          "ColorBySampleDynamicSource"  
## [11] "ShapeBy"                      "SizeBy"                      
## [13] "SelectionEffect"              "SelectionColor"              
## [15] "SelectionAlpha"               "ZoomData"                    
## [17] "BrushData"                    "VisualBoxOpen"               
## [19] "VisualChoices"                "ContourAdd"                  
## [21] "ContourColor"                 "PointSize"                   
## [23] "PointAlpha"                   "Downsample"                  
## [25] "DownsampleResolution"         "FontSize"                    
## [27] "LegendPosition"               "PanelId"                     
## [29] "PanelHeight"                  "PanelWidth"                  
## [31] "SelectionBoxOpen"             "RowSelectionSource"          
## [33] "ColumnSelectionSource"        "DataBoxOpen"                 
## [35] "RowSelectionDynamicSource"    "RowSelectionType"            
## [37] "RowSelectionSaved"            "ColumnSelectionDynamicSource"
## [39] "ColumnSelectionType"          "ColumnSelectionSaved"        
## [41] "SelectionHistory"
```

### `ColumnDotPlot`

The [`ColumnDotPlot`](https://isee.github.io/iSEE/reference/ColumnDotPlot-class.html) class inherits from the `DotPlot` class and represents all per-column dot plots.
This refers to all plots where each column is represented by no more than one dot/point on the plot.
It provides functionality to manage `colData` fields for modifying the plot aesthetics.
It is also restricted to receiving and transmitting column identities in single and multiple selections.


```r
slotNames(getClass("ColumnDotPlot"))
```

```
##  [1] "ColorByColumnData"            "ColorByFeatureNameAssay"     
##  [3] "ColorBySampleNameColor"       "ShapeByColumnData"           
##  [5] "SizeByColumnData"             "FacetByRow"                  
##  [7] "FacetByColumn"                "ColorBy"                     
##  [9] "ColorByDefaultColor"          "ColorByFeatureName"          
## [11] "ColorByFeatureSource"         "ColorByFeatureDynamicSource" 
## [13] "ColorBySampleName"            "ColorBySampleSource"         
## [15] "ColorBySampleDynamicSource"   "ShapeBy"                     
## [17] "SizeBy"                       "SelectionEffect"             
## [19] "SelectionColor"               "SelectionAlpha"              
## [21] "ZoomData"                     "BrushData"                   
## [23] "VisualBoxOpen"                "VisualChoices"               
## [25] "ContourAdd"                   "ContourColor"                
## [27] "PointSize"                    "PointAlpha"                  
## [29] "Downsample"                   "DownsampleResolution"        
## [31] "FontSize"                     "LegendPosition"              
## [33] "PanelId"                      "PanelHeight"                 
## [35] "PanelWidth"                   "SelectionBoxOpen"            
## [37] "RowSelectionSource"           "ColumnSelectionSource"       
## [39] "DataBoxOpen"                  "RowSelectionDynamicSource"   
## [41] "RowSelectionType"             "RowSelectionSaved"           
## [43] "ColumnSelectionDynamicSource" "ColumnSelectionType"         
## [45] "ColumnSelectionSaved"         "SelectionHistory"
```

### `RowDotPlot`

The [`RowDotPlot`](https://isee.github.io/iSEE/reference/RowDotPlot-class.html) class inherits from the `DotPlot` class and represents all per-row dot plots.
This refers to all plots where each row is represented by no more than one dot/point on the plot.
It provides functionality to manage `rowData` fields for modifying the plot aesthetics.
It is also restricted to receiving and transmitting row identities in single and multiple selections.


```r
slotNames(getClass("RowDotPlot"))
```

```
##  [1] "ColorByRowData"               "ColorBySampleNameAssay"      
##  [3] "ColorByFeatureNameColor"      "ShapeByRowData"              
##  [5] "SizeByRowData"                "FacetByRow"                  
##  [7] "FacetByColumn"                "ColorBy"                     
##  [9] "ColorByDefaultColor"          "ColorByFeatureName"          
## [11] "ColorByFeatureSource"         "ColorByFeatureDynamicSource" 
## [13] "ColorBySampleName"            "ColorBySampleSource"         
## [15] "ColorBySampleDynamicSource"   "ShapeBy"                     
## [17] "SizeBy"                       "SelectionEffect"             
## [19] "SelectionColor"               "SelectionAlpha"              
## [21] "ZoomData"                     "BrushData"                   
## [23] "VisualBoxOpen"                "VisualChoices"               
## [25] "ContourAdd"                   "ContourColor"                
## [27] "PointSize"                    "PointAlpha"                  
## [29] "Downsample"                   "DownsampleResolution"        
## [31] "FontSize"                     "LegendPosition"              
## [33] "PanelId"                      "PanelHeight"                 
## [35] "PanelWidth"                   "SelectionBoxOpen"            
## [37] "RowSelectionSource"           "ColumnSelectionSource"       
## [39] "DataBoxOpen"                  "RowSelectionDynamicSource"   
## [41] "RowSelectionType"             "RowSelectionSaved"           
## [43] "ColumnSelectionDynamicSource" "ColumnSelectionType"         
## [45] "ColumnSelectionSaved"         "SelectionHistory"
```

### `Table`

The [`Table`](https://isee.github.io/iSEE/reference/Table-class.html) class inherits from the `Panel` class and represents all tables rendered using *[DT](https://CRAN.R-project.org/package=DT)*.
Each row of the table is expected to correspond to a row or column of the `SummarizedExperiment`.
This class provides functionality to render the `DT::datatable` widget, monitor single selections and apply search filters.


```r
slotNames(getClass("Table"))
```

```
##  [1] "Selected"                     "Search"                      
##  [3] "SearchColumns"                "PanelId"                     
##  [5] "PanelHeight"                  "PanelWidth"                  
##  [7] "SelectionBoxOpen"             "RowSelectionSource"          
##  [9] "ColumnSelectionSource"        "DataBoxOpen"                 
## [11] "RowSelectionDynamicSource"    "RowSelectionType"            
## [13] "RowSelectionSaved"            "ColumnSelectionDynamicSource"
## [15] "ColumnSelectionType"          "ColumnSelectionSaved"        
## [17] "SelectionHistory"
```

### `ColumnTable`

The [`ColumnTable`](https://isee.github.io/iSEE/reference/ColumnTable-class.html) class inherits from the `Table` class and represents all tables where the rows correspond to columns of the `SummarizedExperiment`.
Instances of this class can only transmit single and multiple selections on columns.


```r
slotNames(getClass("ColumnTable"))
```

```
##  [1] "Selected"                     "Search"                      
##  [3] "SearchColumns"                "PanelId"                     
##  [5] "PanelHeight"                  "PanelWidth"                  
##  [7] "SelectionBoxOpen"             "RowSelectionSource"          
##  [9] "ColumnSelectionSource"        "DataBoxOpen"                 
## [11] "RowSelectionDynamicSource"    "RowSelectionType"            
## [13] "RowSelectionSaved"            "ColumnSelectionDynamicSource"
## [15] "ColumnSelectionType"          "ColumnSelectionSaved"        
## [17] "SelectionHistory"
```

### `RowTable`

The [`RowTable`](https://isee.github.io/iSEE/reference/RowTable-class.html) class inherits from the `Table` class and represents all tables where the rows correspond to rows of the `SummarizedExperiment`.
Instances of this class can only transmit single and multiple selections on rows.


```r
slotNames(getClass("RowTable"))
```

```
##  [1] "Selected"                     "Search"                      
##  [3] "SearchColumns"                "PanelId"                     
##  [5] "PanelHeight"                  "PanelWidth"                  
##  [7] "SelectionBoxOpen"             "RowSelectionSource"          
##  [9] "ColumnSelectionSource"        "DataBoxOpen"                 
## [11] "RowSelectionDynamicSource"    "RowSelectionType"            
## [13] "RowSelectionSaved"            "ColumnSelectionDynamicSource"
## [15] "ColumnSelectionType"          "ColumnSelectionSaved"        
## [17] "SelectionHistory"
```

## Concrete classes

### `ReducedDimensionPlot`

The [`ReducedDimensionPlot`](https://isee.github.io/iSEE/reference/ReducedDimensionPlot-class.html) class inherits from the `ColumnDotPlot` class and plots reduced dimension coordinates from an entry of the `reducedDims` in a `SingleCellExperiment`.
It provides functionality to choose the result and extract the relevant entry in preparation for plotting.


```r
slotNames(getClass("ReducedDimensionPlot"))
```

```
##  [1] "Type"                         "XAxis"                       
##  [3] "YAxis"                        "ColorByColumnData"           
##  [5] "ColorByFeatureNameAssay"      "ColorBySampleNameColor"      
##  [7] "ShapeByColumnData"            "SizeByColumnData"            
##  [9] "FacetByRow"                   "FacetByColumn"               
## [11] "ColorBy"                      "ColorByDefaultColor"         
## [13] "ColorByFeatureName"           "ColorByFeatureSource"        
## [15] "ColorByFeatureDynamicSource"  "ColorBySampleName"           
## [17] "ColorBySampleSource"          "ColorBySampleDynamicSource"  
## [19] "ShapeBy"                      "SizeBy"                      
## [21] "SelectionEffect"              "SelectionColor"              
## [23] "SelectionAlpha"               "ZoomData"                    
## [25] "BrushData"                    "VisualBoxOpen"               
## [27] "VisualChoices"                "ContourAdd"                  
## [29] "ContourColor"                 "PointSize"                   
## [31] "PointAlpha"                   "Downsample"                  
## [33] "DownsampleResolution"         "FontSize"                    
## [35] "LegendPosition"               "PanelId"                     
## [37] "PanelHeight"                  "PanelWidth"                  
## [39] "SelectionBoxOpen"             "RowSelectionSource"          
## [41] "ColumnSelectionSource"        "DataBoxOpen"                 
## [43] "RowSelectionDynamicSource"    "RowSelectionType"            
## [45] "RowSelectionSaved"            "ColumnSelectionDynamicSource"
## [47] "ColumnSelectionType"          "ColumnSelectionSaved"        
## [49] "SelectionHistory"
```

### `FeatureAssayPlot`

The [`FeatureAssayPlot`](https://isee.github.io/iSEE/reference/FeatureAssayPlot-class.html) class inherits from the `ColumnDotPlot` class and plots the assay values for a feature across all samples, using an entry of the `assays()` from any `SummarizedExperiment` object.
It provides functionality to choose the feature of interest and any associated variable to plot on the x-axis, as well as a method to extract the relevant pieces of data in preparation for plotting.


```r
slotNames(getClass("FeatureAssayPlot"))
```

```
##  [1] "Assay"                        "XAxis"                       
##  [3] "XAxisColumnData"              "XAxisFeatureName"            
##  [5] "XAxisFeatureSource"           "XAxisFeatureDynamicSource"   
##  [7] "YAxisFeatureName"             "YAxisFeatureSource"          
##  [9] "YAxisFeatureDynamicSource"    "ColorByColumnData"           
## [11] "ColorByFeatureNameAssay"      "ColorBySampleNameColor"      
## [13] "ShapeByColumnData"            "SizeByColumnData"            
## [15] "FacetByRow"                   "FacetByColumn"               
## [17] "ColorBy"                      "ColorByDefaultColor"         
## [19] "ColorByFeatureName"           "ColorByFeatureSource"        
## [21] "ColorByFeatureDynamicSource"  "ColorBySampleName"           
## [23] "ColorBySampleSource"          "ColorBySampleDynamicSource"  
## [25] "ShapeBy"                      "SizeBy"                      
## [27] "SelectionEffect"              "SelectionColor"              
## [29] "SelectionAlpha"               "ZoomData"                    
## [31] "BrushData"                    "VisualBoxOpen"               
## [33] "VisualChoices"                "ContourAdd"                  
## [35] "ContourColor"                 "PointSize"                   
## [37] "PointAlpha"                   "Downsample"                  
## [39] "DownsampleResolution"         "FontSize"                    
## [41] "LegendPosition"               "PanelId"                     
## [43] "PanelHeight"                  "PanelWidth"                  
## [45] "SelectionBoxOpen"             "RowSelectionSource"          
## [47] "ColumnSelectionSource"        "DataBoxOpen"                 
## [49] "RowSelectionDynamicSource"    "RowSelectionType"            
## [51] "RowSelectionSaved"            "ColumnSelectionDynamicSource"
## [53] "ColumnSelectionType"          "ColumnSelectionSaved"        
## [55] "SelectionHistory"
```

### `ColumnDataPlot`

The [`ColumnDataPlot`](https://isee.github.io/iSEE/reference/ColumnDataPlot-class.html) class inherits from the `ColumnDotPlot` class and plots `colData` variables by themselves or against each other.
It provides functionality to choose and extract the variables to plot.


```r
slotNames(getClass("ColumnDataPlot"))
```

```
##  [1] "XAxis"                        "YAxis"                       
##  [3] "XAxisColumnData"              "ColorByColumnData"           
##  [5] "ColorByFeatureNameAssay"      "ColorBySampleNameColor"      
##  [7] "ShapeByColumnData"            "SizeByColumnData"            
##  [9] "FacetByRow"                   "FacetByColumn"               
## [11] "ColorBy"                      "ColorByDefaultColor"         
## [13] "ColorByFeatureName"           "ColorByFeatureSource"        
## [15] "ColorByFeatureDynamicSource"  "ColorBySampleName"           
## [17] "ColorBySampleSource"          "ColorBySampleDynamicSource"  
## [19] "ShapeBy"                      "SizeBy"                      
## [21] "SelectionEffect"              "SelectionColor"              
## [23] "SelectionAlpha"               "ZoomData"                    
## [25] "BrushData"                    "VisualBoxOpen"               
## [27] "VisualChoices"                "ContourAdd"                  
## [29] "ContourColor"                 "PointSize"                   
## [31] "PointAlpha"                   "Downsample"                  
## [33] "DownsampleResolution"         "FontSize"                    
## [35] "LegendPosition"               "PanelId"                     
## [37] "PanelHeight"                  "PanelWidth"                  
## [39] "SelectionBoxOpen"             "RowSelectionSource"          
## [41] "ColumnSelectionSource"        "DataBoxOpen"                 
## [43] "RowSelectionDynamicSource"    "RowSelectionType"            
## [45] "RowSelectionSaved"            "ColumnSelectionDynamicSource"
## [47] "ColumnSelectionType"          "ColumnSelectionSaved"        
## [49] "SelectionHistory"
```

### `SampleAssayPlot`

The [`SampleAssayPlot`](https://isee.github.io/iSEE/reference/SampleAssayPlot-class.html) class inherits from the `RowDotPlot` class and plots the assay values for a sample across all features, using an entry of the `assays()` from any `SummarizedExperiment` object.
It provides functionality to choose the sample of interest and any associated variable to plot on the x-axis, as well as a method to extract the relevant pieces of data in preparation for plotting.


```r
slotNames(getClass("FeatureAssayPlot"))
```

```
##  [1] "Assay"                        "XAxis"                       
##  [3] "XAxisColumnData"              "XAxisFeatureName"            
##  [5] "XAxisFeatureSource"           "XAxisFeatureDynamicSource"   
##  [7] "YAxisFeatureName"             "YAxisFeatureSource"          
##  [9] "YAxisFeatureDynamicSource"    "ColorByColumnData"           
## [11] "ColorByFeatureNameAssay"      "ColorBySampleNameColor"      
## [13] "ShapeByColumnData"            "SizeByColumnData"            
## [15] "FacetByRow"                   "FacetByColumn"               
## [17] "ColorBy"                      "ColorByDefaultColor"         
## [19] "ColorByFeatureName"           "ColorByFeatureSource"        
## [21] "ColorByFeatureDynamicSource"  "ColorBySampleName"           
## [23] "ColorBySampleSource"          "ColorBySampleDynamicSource"  
## [25] "ShapeBy"                      "SizeBy"                      
## [27] "SelectionEffect"              "SelectionColor"              
## [29] "SelectionAlpha"               "ZoomData"                    
## [31] "BrushData"                    "VisualBoxOpen"               
## [33] "VisualChoices"                "ContourAdd"                  
## [35] "ContourColor"                 "PointSize"                   
## [37] "PointAlpha"                   "Downsample"                  
## [39] "DownsampleResolution"         "FontSize"                    
## [41] "LegendPosition"               "PanelId"                     
## [43] "PanelHeight"                  "PanelWidth"                  
## [45] "SelectionBoxOpen"             "RowSelectionSource"          
## [47] "ColumnSelectionSource"        "DataBoxOpen"                 
## [49] "RowSelectionDynamicSource"    "RowSelectionType"            
## [51] "RowSelectionSaved"            "ColumnSelectionDynamicSource"
## [53] "ColumnSelectionType"          "ColumnSelectionSaved"        
## [55] "SelectionHistory"
```

### `RowDataPlot`

The [`RowDataPlot`](https://isee.github.io/iSEE/reference/RowDataPlot-class.html) class inherits from the `RowDotPlot` class and plots `rowData` variables by themselves or against each other.
It provides functionality to choose and extract the variables to plot.


```r
slotNames(getClass("RowDataPlot"))
```

```
##  [1] "XAxis"                        "YAxis"                       
##  [3] "XAxisRowData"                 "ColorByRowData"              
##  [5] "ColorBySampleNameAssay"       "ColorByFeatureNameColor"     
##  [7] "ShapeByRowData"               "SizeByRowData"               
##  [9] "FacetByRow"                   "FacetByColumn"               
## [11] "ColorBy"                      "ColorByDefaultColor"         
## [13] "ColorByFeatureName"           "ColorByFeatureSource"        
## [15] "ColorByFeatureDynamicSource"  "ColorBySampleName"           
## [17] "ColorBySampleSource"          "ColorBySampleDynamicSource"  
## [19] "ShapeBy"                      "SizeBy"                      
## [21] "SelectionEffect"              "SelectionColor"              
## [23] "SelectionAlpha"               "ZoomData"                    
## [25] "BrushData"                    "VisualBoxOpen"               
## [27] "VisualChoices"                "ContourAdd"                  
## [29] "ContourColor"                 "PointSize"                   
## [31] "PointAlpha"                   "Downsample"                  
## [33] "DownsampleResolution"         "FontSize"                    
## [35] "LegendPosition"               "PanelId"                     
## [37] "PanelHeight"                  "PanelWidth"                  
## [39] "SelectionBoxOpen"             "RowSelectionSource"          
## [41] "ColumnSelectionSource"        "DataBoxOpen"                 
## [43] "RowSelectionDynamicSource"    "RowSelectionType"            
## [45] "RowSelectionSaved"            "ColumnSelectionDynamicSource"
## [47] "ColumnSelectionType"          "ColumnSelectionSaved"        
## [49] "SelectionHistory"
```

### `ColumnDataTable`

The [`ColumnDataTable`](https://isee.github.io/iSEE/reference/ColumnDataTable-class.html) class inherits from the `ColumnTable` class and shows the contents of the `colData` in a table.
It provides functionality to extract the `colData` in preparation for rendering.


```r
slotNames(getClass("ColumnDataTable"))
```

```
##  [1] "Selected"                     "Search"                      
##  [3] "SearchColumns"                "PanelId"                     
##  [5] "PanelHeight"                  "PanelWidth"                  
##  [7] "SelectionBoxOpen"             "RowSelectionSource"          
##  [9] "ColumnSelectionSource"        "DataBoxOpen"                 
## [11] "RowSelectionDynamicSource"    "RowSelectionType"            
## [13] "RowSelectionSaved"            "ColumnSelectionDynamicSource"
## [15] "ColumnSelectionType"          "ColumnSelectionSaved"        
## [17] "SelectionHistory"
```

### `RowDataTable`

The [`RowDataTable`](https://isee.github.io/iSEE/reference/RowDataTable-class.html) class inherits from the `RowTable` class and shows the contents of the `rowData` in a table.
It provides functionality to extract the `rowData` in preparation for rendering.


```r
slotNames(getClass("RowDataTable"))
```

```
##  [1] "Selected"                     "Search"                      
##  [3] "SearchColumns"                "PanelId"                     
##  [5] "PanelHeight"                  "PanelWidth"                  
##  [7] "SelectionBoxOpen"             "RowSelectionSource"          
##  [9] "ColumnSelectionSource"        "DataBoxOpen"                 
## [11] "RowSelectionDynamicSource"    "RowSelectionType"            
## [13] "RowSelectionSaved"            "ColumnSelectionDynamicSource"
## [15] "ColumnSelectionType"          "ColumnSelectionSaved"        
## [17] "SelectionHistory"
```

### `ComplexHeatmapPlot`

The [`ComplexHeatmapPlot`](https://isee.github.io/iSEE/reference/ComplexHeatmapPlot-class.html) class inherits from the `Panel` class and creates a heatmap from assay values using the *[ComplexHeatmap](https://bioconductor.org/packages/3.11/ComplexHeatmap)* package.
It provides functionality to specify the features to be shown, which assay to show, transformations to be applied, and which metadata variables to display as row and column heatmap annotations.


```r
slotNames(getClass("ComplexHeatmapPlot"))
```

```
##  [1] "Assay"                        "CustomRows"                  
##  [3] "CustomRowsText"               "ClusterRows"                 
##  [5] "ClusterRowsDistance"          "ClusterRowsMethod"           
##  [7] "DataBoxOpen"                  "VisualChoices"               
##  [9] "ColumnData"                   "RowData"                     
## [11] "CustomBounds"                 "LowerBound"                  
## [13] "UpperBound"                   "AssayCenterRows"             
## [15] "AssayScaleRows"               "DivergentColormap"           
## [17] "ShowDimNames"                 "LegendPosition"              
## [19] "LegendDirection"              "VisualBoxOpen"               
## [21] "SelectionEffect"              "SelectionColor"              
## [23] "PanelId"                      "PanelHeight"                 
## [25] "PanelWidth"                   "SelectionBoxOpen"            
## [27] "RowSelectionSource"           "ColumnSelectionSource"       
## [29] "RowSelectionDynamicSource"    "RowSelectionType"            
## [31] "RowSelectionSaved"            "ColumnSelectionDynamicSource"
## [33] "ColumnSelectionType"          "ColumnSelectionSaved"        
## [35] "SelectionHistory"
```
